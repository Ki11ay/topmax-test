import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../models/course_model.dart';
import '../services/api_service.dart';

// Home data state
class HomeState {
  final bool isLoading;
  final String? error;
  final List<Job> featuredJobs;
  final List<Job> recentOpenings;
  final List<Job> disabilityJobs;
  final List<Course> coursesForYou;
  final List<Job> featuredJobsForYou;
  final List<Job> matchedJobs;

  HomeState({
    this.isLoading = false,
    this.error,
    this.featuredJobs = const [],
    this.recentOpenings = const [],
    this.disabilityJobs = const [],
    this.coursesForYou = const [],
    this.featuredJobsForYou = const [],
    this.matchedJobs = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    List<Job>? featuredJobs,
    List<Job>? recentOpenings,
    List<Job>? disabilityJobs,
    List<Course>? coursesForYou,
    List<Job>? featuredJobsForYou,
    List<Job>? matchedJobs,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      featuredJobs: featuredJobs ?? this.featuredJobs,
      recentOpenings: recentOpenings ?? this.recentOpenings,
      disabilityJobs: disabilityJobs ?? this.disabilityJobs,
      coursesForYou: coursesForYou ?? this.coursesForYou,
      featuredJobsForYou: featuredJobsForYou ?? this.featuredJobsForYou,
      matchedJobs: matchedJobs ?? this.matchedJobs,
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
      final response = await _apiService.get(ApiConstants.mobileHome);
      final data = response.data['data'];

      // Parse featured jobs
      final featuredJobsList = (data['featured_jobs'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      // Parse recent openings
      final recentOpeningsList = (data['recent_openings'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      // Parse disability jobs
      final disabilityJobsList = (data['disability_jobs'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      // Parse courses for you
      final coursesForYouList = (data['courses_for_you'] as List?)
              ?.map((course) => Course.fromJson(course))
              .toList() ??
          [];

      // Parse featured jobs for you
      final featuredJobsForYouList = (data['featured_jobs_for_you'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      // Parse matched jobs
      final matchedJobsList = (data['matched_jobs'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      state = state.copyWith(
        isLoading: false,
        featuredJobs: featuredJobsList,
        recentOpenings: recentOpeningsList,
        disabilityJobs: disabilityJobsList,
        coursesForYou: coursesForYouList,
        featuredJobsForYou: featuredJobsForYouList,
        matchedJobs: matchedJobsList,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
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
      state = state.copyWith(error: 'Failed to save job');
    }
  }

  void _updateJobSavedStatus(int jobId, bool isSaved) {
    state = state.copyWith(
      featuredJobs: _updateJobInList(state.featuredJobs, jobId, isSaved),
      recentOpenings: _updateJobInList(state.recentOpenings, jobId, isSaved),
      disabilityJobs: _updateJobInList(state.disabilityJobs, jobId, isSaved),
      featuredJobsForYou:
          _updateJobInList(state.featuredJobsForYou, jobId, isSaved),
      matchedJobs: _updateJobInList(state.matchedJobs, jobId, isSaved),
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

