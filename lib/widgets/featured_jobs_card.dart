import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_constants.dart';
import '../models/job_model.dart';

class FeaturedJobsCard extends StatelessWidget {
  final Job job;
  final VoidCallback? onSave;

  const FeaturedJobsCard({
    super.key,
    required this.job,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: AppConstants.paddingMedium),
      child: InkWell(
        onTap: () {
          context.push('/job/${job.id}');
        },
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFCE7F3), // Light pink background
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Company logo and bookmark
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusSmall),
                      ),
                      child: job.companyLogo != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.radiusSmall),
                              child: Image.network(
                                job.companyLogo!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.business,
                                    color: Color(0xFFDB2777),
                                    size: 24,
                                  );
                                },
                              ),
                            )
                          : const Icon(
                              Icons.business,
                              color: Color(0xFFDB2777),
                              size: 24,
                            ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        job.isSaved == true
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: job.isSaved == true
                            ? AppConstants.primaryBlue
                            : AppConstants.textSecondary,
                        size: 22,
                      ),
                      onPressed: onSave,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                
                // Job title
                Text(
                  job.jobTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                
                // Company name
                if (job.companyName != null)
                  Text(
                    job.companyName!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppConstants.textSecondary,
                          fontSize: 13,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: AppConstants.paddingSmall),
                
                // Job description
                Text(
                  job.jobDescription,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: AppConstants.textSecondary,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                
                // Job type and location badges
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    if (job.jobType != null)
                      _buildBadge(job.jobType!, const Color(0xFFBFDBFE)),
                    if (job.locationPriority != null)
                      _buildBadge(job.locationPriority!, const Color(0xFFBFDBFE)),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                
                const Divider(height: 1),
                const SizedBox(height: AppConstants.paddingSmall),
                
                // Salary range
                Text(
                  _formatSalary(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                
                // Details link
                Text(
                  'Details',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppConstants.primaryBlue,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String label, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF1E40AF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatSalary() {
    if (job.salaryToBeDiscussed == true) {
      return 'Salary: Negotiable';
    }
    if (job.minSalary != null && job.maxSalary != null) {
      return 'From AED ${job.minSalary} / month';
    }
    if (job.minSalary != null) {
      return 'From AED ${job.minSalary}';
    }
    if (job.maxSalary != null) {
      return 'Up to AED ${job.maxSalary}';
    }
    return 'Salary not specified';
  }
}

