import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/course_card.dart';
import '../../../state/courses_provider.dart';

class CoursesScreen extends ConsumerStatefulWidget {
  const CoursesScreen({super.key});

  @override
  ConsumerState<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends ConsumerState<CoursesScreen> {
  @override
  void initState() {
    super.initState();
    // Load courses when screen opens
    Future.microtask(() {
      ref.read(coursesProvider.notifier).loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final coursesState = ref.watch(coursesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: coursesState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : coursesState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 64, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading courses',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        coursesState.error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(coursesProvider.notifier).loadCourses();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : coursesState.courses.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.school_outlined, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No courses available',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => ref.read(coursesProvider.notifier).loadCourses(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(AppConstants.paddingMedium),
                        itemCount: coursesState.courses.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: CourseCard(course: coursesState.courses[index]),
                          );
                        },
                      ),
                    ),
    );
  }
}

