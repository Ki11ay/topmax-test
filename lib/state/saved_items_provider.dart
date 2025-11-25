import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../models/course_model.dart';
import '../services/api_service.dart';

// Saved items state
class SavedItemsState {
  final bool isLoading;
  final String? error;
  final List<Job> savedJobs;
  final List<Course> savedCourses;

  SavedItemsState({
    this.isLoading = false,
    this.error,
    this.savedJobs = const [],
    this.savedCourses = const [],
  });

  SavedItemsState copyWith({
    bool? isLoading,
    String? error,
    List<Job>? savedJobs,
    List<Course>? savedCourses,
  }) {
    return SavedItemsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      savedJobs: savedJobs ?? this.savedJobs,
      savedCourses: savedCourses ?? this.savedCourses,
    );
  }
}

// Saved items notifier
class SavedItemsNotifier extends StateNotifier<SavedItemsState> {
  final ApiService _apiService = ApiService();

  SavedItemsNotifier() : super(SavedItemsState());

  Future<void> loadSavedJobs() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      print('📥 Loading saved jobs...');
      final response = await _apiService.get(
        ApiConstants.savedItems,
        queryParameters: {'type': 'jobs'},
      );
      
      final data = response.data['data'];
      final jobsList = (data['data'] as List?)
              ?.map((job) => Job.fromJson(job))
              .toList() ??
          [];

      print('✅ Loaded ${jobsList.length} saved jobs');
      
      state = state.copyWith(
        isLoading: false,
        savedJobs: jobsList,
      );
    } catch (e) {
      print('❌ Failed to load saved jobs: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadSavedCourses() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      print('📥 Loading saved courses...');
      final response = await _apiService.get(
        ApiConstants.savedItems,
        queryParameters: {'type': 'courses'},
      );
      
      final data = response.data['data'];
      final coursesList = (data['data'] as List?)
              ?.map((course) => Course.fromJson(course))
              .toList() ??
          [];

      print('✅ Loaded ${coursesList.length} saved courses');
      
      state = state.copyWith(
        isLoading: false,
        savedCourses: coursesList,
      );
    } catch (e) {
      print('❌ Failed to load saved courses: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadAll() async {
    await loadSavedJobs();
    await loadSavedCourses();
  }
}

// Saved items provider
final savedItemsProvider = StateNotifierProvider<SavedItemsNotifier, SavedItemsState>((ref) {
  return SavedItemsNotifier();
});

