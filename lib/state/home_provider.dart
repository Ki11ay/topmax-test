import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../models/course_model.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

// Home data state
class HomeState {
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final List<Job> featuredJobs;
  final List<Job> recentOpenings;
  final List<Job> disabilityJobs;
  final List<Course> coursesForYou;
  
  // Pagination state for each section
  final int disabilityJobsPage;
  final int featuredJobsPage;
  final int recentOpeningsPage;
  final bool hasMoreDisabilityJobs;
  final bool hasMoreFeaturedJobs;
  final bool hasMoreRecentOpenings;

  HomeState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.featuredJobs = const [],
    this.recentOpenings = const [],
    this.disabilityJobs = const [],
    this.coursesForYou = const [],
    this.disabilityJobsPage = 1,
    this.featuredJobsPage = 1,
    this.recentOpeningsPage = 1,
    this.hasMoreDisabilityJobs = true,
    this.hasMoreFeaturedJobs = true,
    this.hasMoreRecentOpenings = true,
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    List<Job>? featuredJobs,
    List<Job>? recentOpenings,
    List<Job>? disabilityJobs,
    List<Course>? coursesForYou,
    int? disabilityJobsPage,
    int? featuredJobsPage,
    int? recentOpeningsPage,
    bool? hasMoreDisabilityJobs,
    bool? hasMoreFeaturedJobs,
    bool? hasMoreRecentOpenings,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      featuredJobs: featuredJobs ?? this.featuredJobs,
      recentOpenings: recentOpenings ?? this.recentOpenings,
      disabilityJobs: disabilityJobs ?? this.disabilityJobs,
      coursesForYou: coursesForYou ?? this.coursesForYou,
      disabilityJobsPage: disabilityJobsPage ?? this.disabilityJobsPage,
      featuredJobsPage: featuredJobsPage ?? this.featuredJobsPage,
      recentOpeningsPage: recentOpeningsPage ?? this.recentOpeningsPage,
      hasMoreDisabilityJobs: hasMoreDisabilityJobs ?? this.hasMoreDisabilityJobs,
      hasMoreFeaturedJobs: hasMoreFeaturedJobs ?? this.hasMoreFeaturedJobs,
      hasMoreRecentOpenings: hasMoreRecentOpenings ?? this.hasMoreRecentOpenings,
    );
  }
}

// Home notifier
class HomeNotifier extends StateNotifier<HomeState> {
  final ApiService _apiService = ApiService();

  HomeNotifier() : super(HomeState());

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Use single API call to mobile/home endpoint for initial load (efficient)
      final response = await _apiService.get(ApiConstants.mobileHome);

      final data = response.data['data'];

      // Parse all job categories from single response
      final featuredJobsList = (data['featured_jobs'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      final featuredJobsForYouList = (data['featured_jobs_for_you'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      final recentOpeningsList = (data['recent_openings'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      final disabilityJobsList = (data['disability_jobs'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      final coursesForYouList = (data['courses_for_you'] as List?)
              ?.map((course) => Course.fromJson(course))
              .toList() ??
          [];

      // Combine featured jobs arrays (featured_jobs + featured_jobs_for_you)
      final allFeaturedJobs = [...featuredJobsList, ...featuredJobsForYouList];

      state = state.copyWith(
        isLoading: false,
        featuredJobs: allFeaturedJobs,
        recentOpenings: recentOpeningsList,
        disabilityJobs: disabilityJobsList,
        coursesForYou: coursesForYouList,
        // Reset pagination state
        featuredJobsPage: 1,
        disabilityJobsPage: 1,
        recentOpeningsPage: 1,
        // Assume more pages exist if we got data (will be verified on load more)
        hasMoreFeaturedJobs: allFeaturedJobs.length >= 10,
        hasMoreDisabilityJobs: disabilityJobsList.length >= 2,
        hasMoreRecentOpenings: recentOpeningsList.length >= 10,
      );
    } catch (e) {
      print('Error loading home data: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Load more featured jobs with pagination
  Future<void> _loadFeaturedJobs({bool refresh = false}) async {
    try {
      final page = refresh ? 1 : state.featuredJobsPage + 1;
      
      final response = await _apiService.get(
        ApiConstants.jobs,
        queryParameters: {
          'featured_jobs_for_you': 'true',
          'page': page.toString(),
          'per_page': '10',
        },
      );

      final data = response.data['data'];
      final jobsList = (data['data'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];
      
      final pagination = data['pagination'] ?? {};
      final hasMore = pagination['has_more_pages'] ?? false;

      state = state.copyWith(
        featuredJobs: refresh ? jobsList : [...state.featuredJobs, ...jobsList],
        featuredJobsPage: page,
        hasMoreFeaturedJobs: hasMore,
      );
    } catch (e) {
      print('Error loading featured jobs: $e');
    }
  }

  // Load more disability jobs with pagination
  Future<void> _loadDisabilityJobs({bool refresh = false}) async {
    try {
      final page = refresh ? 1 : state.disabilityJobsPage + 1;
      
      final response = await _apiService.get(
        ApiConstants.jobs,
        queryParameters: {
          'is_disability_jobs': 'true',
          'page': page.toString(),
          'per_page': '10',
        },
      );

      final data = response.data['data'];
      final jobsList = (data['data'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];
      
      final pagination = data['pagination'] ?? {};
      final hasMore = pagination['has_more_pages'] ?? false;

      state = state.copyWith(
        disabilityJobs: refresh ? jobsList : [...state.disabilityJobs, ...jobsList],
        disabilityJobsPage: page,
        hasMoreDisabilityJobs: hasMore,
      );
    } catch (e) {
      print('Error loading disability jobs: $e');
    }
  }

  // Load more recent openings with pagination
  Future<void> _loadRecentOpenings({bool refresh = false}) async {
    try {
      final page = refresh ? 1 : state.recentOpeningsPage + 1;
      
      final response = await _apiService.get(
        ApiConstants.jobs,
        queryParameters: {
          'is_recent_openings': 'true',
          'page': page.toString(),
          'per_page': '10',
        },
      );

      final data = response.data['data'];
      final jobsList = (data['data'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];
      
      final pagination = data['pagination'] ?? {};
      final hasMore = pagination['has_more_pages'] ?? false;

      state = state.copyWith(
        recentOpenings: refresh ? jobsList : [...state.recentOpenings, ...jobsList],
        recentOpeningsPage: page,
        hasMoreRecentOpenings: hasMore,
      );
    } catch (e) {
      print('Error loading recent openings: $e');
    }
  }

  // Public methods to load more items
  Future<void> loadMoreFeaturedJobs() async {
    if (!state.isLoadingMore && state.hasMoreFeaturedJobs) {
      state = state.copyWith(isLoadingMore: true);
      await _loadFeaturedJobs(refresh: false);
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> loadMoreDisabilityJobs() async {
    if (!state.isLoadingMore && state.hasMoreDisabilityJobs) {
      state = state.copyWith(isLoadingMore: true);
      await _loadDisabilityJobs(refresh: false);
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> loadMoreRecentOpenings() async {
    if (!state.isLoadingMore && state.hasMoreRecentOpenings) {
      state = state.copyWith(isLoadingMore: true);
      await _loadRecentOpenings(refresh: false);
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> toggleSaveJob(int jobId, bool currentlySaved) async {
    try {
      // Optimistically update UI
      _updateJobSavedStatus(jobId, !currentlySaved);
      
      print('💾 Toggling save for job $jobId (currently: $currentlySaved)');
      final response = await _apiService.post(ApiConstants.toggleSaveJob(jobId));
      print('✅ Save job response: ${response.data}');
    } catch (e) {
      print('❌ Failed to save job: $e');
      // Revert on error
      _updateJobSavedStatus(jobId, currentlySaved);
      
      // Parse error to provide specific message
      final errorString = e.toString();
      String errorMessage;
      String? errorType; // For special handling in UI
      
      if (errorString.contains('401')) {
        // Token expired - need to re-login
        errorMessage = '⏰ Session expired. Please login again';
        errorType = 'session_expired';
      } else if (errorString.contains('500') && 
          (errorString.contains('savedJobs() on null') || 
           errorString.contains('Call to a member function'))) {
        // Check if storage was cleared (session expired) or profile incomplete
        final token = await StorageService.getToken();
        if (token == null) {
          errorMessage = '⏰ Session expired. Please login again';
          errorType = 'session_expired';
        } else {
          errorMessage = '🔒 Complete your profile first\n'
                        'Go to More → Profile to add your details';
          errorType = 'profile_incomplete';
        }
      } else if (errorString.contains('Network') || 
                 errorString.contains('SocketException')) {
        errorMessage = 'Network error. Check your connection';
      } else {
        errorMessage = 'Unable to save job. Try again';
      }
      
      state = state.copyWith(error: '$errorType:$errorMessage');
    }
  }
  
  void clearError() {
    state = state.copyWith(error: null);
  }

  void _updateJobSavedStatus(int jobId, bool isSaved) {
    state = state.copyWith(
      featuredJobs: _updateJobInList(state.featuredJobs, jobId, isSaved),
      recentOpenings: _updateJobInList(state.recentOpenings, jobId, isSaved),
      disabilityJobs: _updateJobInList(state.disabilityJobs, jobId, isSaved),
    );
  }

  List<Job> _updateJobInList(List<Job> jobs, int jobId, bool isSaved) {
    return jobs.map((job) {
      if (job.id == jobId) {
        return Job.fromJson({...job.toJson(), 'is_saved': isSaved});
      }
      return job;
    }).toList();
  }
}

// Home provider
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});


