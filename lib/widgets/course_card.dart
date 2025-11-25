import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_constants.dart';
import '../models/course_model.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback? onSave;

  const CourseCard({
    super.key,
    required this.course,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      child: InkWell(
        onTap: () {
          context.push('/course/${course.id}');
        },
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course image
            if (course.featuredImage != null)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.radiusMedium),
                  topRight: Radius.circular(AppConstants.radiusMedium),
                ),
                child: Image.network(
                  course.featuredImage!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderImage();
                  },
                ),
              )
            else
              _buildPlaceholderImage(),
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          course.isSaved == true
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: course.isSaved == true
                              ? AppConstants.primaryBlue
                              : AppConstants.textSecondary,
                        ),
                        onPressed: onSave,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  if (course.courseCategory != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingSmall,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppConstants.lightBlue,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusSmall),
                      ),
                      child: Text(
                        course.courseCategory!,
                        style: const TextStyle(
                          fontSize: AppConstants.fontSizeSmall,
                          color: AppConstants.primaryBlue,
                        ),
                      ),
                    ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  if (course.description != null)
                    Text(
                      course.description!,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  Row(
                    children: [
                      if (course.level != null) ...[
                        const Icon(
                          Icons.signal_cellular_alt,
                          size: 16,
                          color: AppConstants.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          course.level!,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppConstants.textSecondary,
                                  ),
                        ),
                        const SizedBox(width: AppConstants.paddingMedium),
                      ],
                      if (course.hasCertificate == 1) ...[
                        const Icon(
                          Icons.verified,
                          size: 16,
                          color: AppConstants.successColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Certificate',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppConstants.textSecondary,
                                  ),
                        ),
                      ],
                      const Spacer(),
                      Text(
                        _formatPrice(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppConstants.primaryBlue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppConstants.lightBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusMedium),
          topRight: Radius.circular(AppConstants.radiusMedium),
        ),
      ),
      child: const Icon(
        Icons.school,
        size: 60,
        color: AppConstants.primaryBlue,
      ),
    );
  }

  String _formatPrice() {
    if (course.isFree == 1) {
      return 'Free';
    }
    if (course.price != null) {
      final priceValue = double.tryParse(course.price!) ?? 0;
      if (priceValue == 0) {
        return 'Free';
      }
      return 'AED ${priceValue.toStringAsFixed(0)}';
    }
    return '';
  }
}

