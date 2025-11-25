import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../services/api_service.dart';

// Search state
class SearchState {
  final bool isLoading;
  final String? error;
  final List<Job> jobs;
  final String? query;

  SearchState({
    this.isLoading = false,
    this.error,
    this.jobs = const [],
    this.query,
  });

  SearchState copyWith({
    bool? isLoading,
    String? error,
    List<Job>? jobs,
    String? query,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      jobs: jobs ?? this.jobs,
      query: query ?? this.query,
    );
  }
}

// Search notifier
class SearchNotifier extends StateNotifier<SearchState> {
  final ApiService _apiService = ApiService();

  SearchNotifier() : super(SearchState());

  Future<void> search({
    String? keyword,
    String? location,
    int? salaryMin,
    int? salaryMax,
    String? experience,
    String? jobType,
    String? locationType,
    int? disability,
  }) async {
    state = state.copyWith(isLoading: true, error: null, query: keyword);
    
    try {
      print('🔍 Searching with keyword: $keyword, jobType: $jobType, locationType: $locationType');
      
      // Build query parameters
      final queryParams = <String, dynamic>{};
      if (keyword != null && keyword.isNotEmpty) queryParams['keyword'] = keyword;
      if (location != null && location.isNotEmpty) queryParams['location'] = location;
      if (salaryMin != null) queryParams['salary_min'] = salaryMin;
      if (salaryMax != null) queryParams['salary_max'] = salaryMax;
      if (experience != null) queryParams['experience'] = experience;
      if (jobType != null) queryParams['job_type'] = jobType;
      if (locationType != null) queryParams['location_type'] = locationType;
      if (disability != null) queryParams['disability'] = disability;
      
      final response = await _apiService.get(
        ApiConstants.search,
        queryParameters: queryParams,
      );
      
      final data = response.data['data'];
      final jobsList = (data['data'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      print('✅ Found ${jobsList.length} jobs');
      
      state = state.copyWith(
        isLoading: false,
        jobs: jobsList,
      );
    } catch (e) {
      print('❌ Search failed: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearSearch() {
    state = SearchState();
  }
}

// Search provider
final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

