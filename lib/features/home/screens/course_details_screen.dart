import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/constants/app_constants.dart';
import '../../../services/api_service.dart';
import '../../../models/course_model.dart';

class CourseDetailsScreen extends ConsumerStatefulWidget {
  final int courseId;

  const CourseDetailsScreen({
    super.key,
    required this.courseId,
  });

  @override
  ConsumerState<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends ConsumerState<CourseDetailsScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  String? _error;
  Course? _course;

  @override
  void initState() {
    super.initState();
    _loadCourseDetails();
  }

  Future<void> _loadCourseDetails() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('📚 Loading course details for ID: ${widget.courseId}');
      final response = await _apiService.get(ApiConstants.courseDetails(widget.courseId));
      
      final data = response.data['data'];
      setState(() {
        _course = Course.fromJson(data);
        _isLoading = false;
      });
      
      print('✅ Course details loaded successfully');
    } catch (e) {
      print('❌ Failed to load course details: $e');
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_course?.title ?? 'Course Details'), 
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $_error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadCourseDetails,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_course == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Course not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            if (_course!.featuredImage != null)
              Image.network(
                _course!.featuredImage!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: AppConstants.lightBlue,
                    child: const Icon(Icons.school, size: 64, color: Colors.grey),
                  );
                },
              ),
            
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    _course!.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Category
                  if (_course!.courseCategory != null)
                    Text(
                      _course!.courseCategory!,
                      style: TextStyle(
                        color: AppConstants.primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 16),
                  
                  // Price
                  Text(
                    _course!.isFree == true ? 'Free' : 'AED ${_course!.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Description
                  if (_course!.description != null) ...[
                    Text(
                      'About this course',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _course!.description!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                  ],
                  
                  // Details
                  _buildDetailRow('Level', _course!.level ?? 'N/A'),
                  _buildDetailRow('Certificate', _course!.hasCertificate == true ? 'Yes' : 'No'),
                  _buildDetailRow('Available Seats', '${_course!.availableSeats ?? 0}'),
                  _buildDetailRow('Company ID', '${_course!.companyId}'),
                  _buildDetailRow('Status', _course!.status ?? 'N/A'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Enroll functionality coming soon!')),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Enroll Now', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppConstants.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppConstants.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

