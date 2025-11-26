import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../models/course_model.dart';
import '../services/api_service.dart';

// Error types
enum SavedItemsErrorType {
  unauthorized,
  network,
  server,
  unknown,
}

// Saved items error class
class SavedItemsError {
  final SavedItemsErrorType type;
  final String message;
  final String? technicalDetails;

  SavedItemsError({
    required this.type,
    required this.message,
    this.technicalDetails,
  });

  factory SavedItemsError.fromException(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        return SavedItemsError(
          type: SavedItemsErrorType.unauthorized,
          message: 'Your session has expired. Please log in again.',
          technicalDetails: error.message,
        );
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return SavedItemsError(
          type: SavedItemsErrorType.network,
          message: 'Connection timeout. Please check your internet connection.',
          technicalDetails: error.message,
        );
      } else if (error.type == DioExceptionType.connectionError) {
        return SavedItemsError(
          type: SavedItemsErrorType.network,
          message: 'Unable to connect. Please check your internet connection.',
          technicalDetails: error.message,
        );
      } else if (error.response?.statusCode != null &&
          error.response!.statusCode! >= 500) {
        return SavedItemsError(
          type: SavedItemsErrorType.server,
          message: 'Server error. Please try again later.',
          technicalDetails: error.message,
        );
      }
    }

    return SavedItemsError(
      type: SavedItemsErrorType.unknown,
      message: 'An unexpected error occurred. Please try again.',
      technicalDetails: error.toString(),
    );
  }
}

// Saved items state
class SavedItemsState {
  final bool isLoading;
  final SavedItemsError? error;
  final List<Job> savedJobs;
  final List<Course> savedCourses;
  final bool jobsLoaded;
  final bool coursesLoaded;

  SavedItemsState({
    this.isLoading = false,
    this.error,
    this.savedJobs = const [],
    this.savedCourses = const [],
    this.jobsLoaded = false,
    this.coursesLoaded = false,
  });

  SavedItemsState copyWith({
    bool? isLoading,
    SavedItemsError? error,
    bool clearError = false,
    List<Job>? savedJobs,
    List<Course>? savedCourses,
    bool? jobsLoaded,
    bool? coursesLoaded,
  }) {
    return SavedItemsState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      savedJobs: savedJobs ?? this.savedJobs,
      savedCourses: savedCourses ?? this.savedCourses,
      jobsLoaded: jobsLoaded ?? this.jobsLoaded,
      coursesLoaded: coursesLoaded ?? this.coursesLoaded,
    );
  }
}

// Saved items notifier
class SavedItemsNotifier extends StateNotifier<SavedItemsState> {
  final ApiService _apiService = ApiService();

  SavedItemsNotifier() : super(SavedItemsState());

  Future<void> loadSavedJobs() async {
    state = state.copyWith(isLoading: true, clearError: true);
    
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
        jobsLoaded: true,
        clearError: true,
      );
    } catch (e) {
      print('❌ Failed to load saved jobs: $e');
      final error = SavedItemsError.fromException(e);
      state = state.copyWith(
        isLoading: false,
        error: error,
        jobsLoaded: false,
      );
    }
  }

  Future<void> loadSavedCourses() async {
    state = state.copyWith(isLoading: true, clearError: true);
    
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
        coursesLoaded: true,
        clearError: true,
      );
    } catch (e) {
      print('❌ Failed to load saved courses: $e');
      final error = SavedItemsError.fromException(e);
      state = state.copyWith(
        isLoading: false,
        error: error,
        coursesLoaded: false,
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

