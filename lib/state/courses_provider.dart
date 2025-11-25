import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/course_model.dart';
import '../services/api_service.dart';

// Courses state
class CoursesState {
  final bool isLoading;
  final String? error;
  final List<Course> courses;

  CoursesState({
    this.isLoading = false,
    this.error,
    this.courses = const [],
  });

  CoursesState copyWith({
    bool? isLoading,
    String? error,
    List<Course>? courses,
  }) {
    return CoursesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      courses: courses ?? this.courses,
    );
  }
}

// Courses notifier
class CoursesNotifier extends StateNotifier<CoursesState> {
  final ApiService _apiService = ApiService();

  CoursesNotifier() : super(CoursesState());

  Future<void> loadCourses({
    int? categoryId,
    String? level,
    String? type,
    bool? hasCertificate,
    String? search,
    bool? coursesForYou,
    String? startDate,
    int page = 1,
    int perPage = 12,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      print('📚 Loading courses...');
      
      // Build query parameters
      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': perPage,
      };
      if (categoryId != null) queryParams['category_id'] = categoryId;
      if (level != null) queryParams['level'] = level;
      if (type != null) queryParams['type'] = type;
      if (hasCertificate != null) queryParams['has_certificate'] = hasCertificate ? 1 : 0;
      if (search != null && search.isNotEmpty) queryParams['search'] = search;
      if (coursesForYou != null && coursesForYou) queryParams['courses_for_you'] = 'true';
      if (startDate != null) queryParams['start_date'] = startDate;
      
      final response = await _apiService.get(
        ApiConstants.courses,
        queryParameters: queryParams,
      );
      
      final data = response.data['data'];
      final coursesList = (data['courses'] as List?)
              ?.map((course) => Course.fromJson(course))
              .toList() ??
          [];

      print('✅ Loaded ${coursesList.length} courses');
      
      state = state.copyWith(
        isLoading: false,
        courses: coursesList,
      );
    } catch (e) {
      print('❌ Failed to load courses: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> toggleSaveCourse(int courseId) async {
    try {
      print('💾 Toggling save for course $courseId');
      final response = await _apiService.post(ApiConstants.saveCourse(courseId));
      print('✅ Save course response: ${response.data}');
      
      // Reload courses to get updated save status
      await loadCourses();
    } catch (e) {
      print('❌ Failed to save course: $e');
      state = state.copyWith(error: 'Failed to save course');
    }
  }
}

// Courses provider
final coursesProvider = StateNotifierProvider<CoursesNotifier, CoursesState>((ref) {
  return CoursesNotifier();
});

