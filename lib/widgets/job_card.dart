import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_constants.dart';
import '../models/job_model.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback? onSave;

  const JobCard({
    super.key,
    required this.job,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF), // Light purple background
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          context.push('/job/${job.id}');
        },
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with "New" badge and bookmark
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DEF8), // Purple badge
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6750A4),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      job.isSaved == true
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: job.isSaved == true
                          ? AppConstants.primaryBlue
                          : AppConstants.textSecondary,
                    ),
                    onPressed: onSave,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Job title
              Text(
                job.jobTitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Company name
              if (job.companyName != null)
                Text(
                  job.companyName!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppConstants.textSecondary,
                      ),
                ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Location
              if (job.officeLocation != null)
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppConstants.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        job.officeLocation!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppConstants.textSecondary,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Job details badges
              Wrap(
                spacing: AppConstants.paddingSmall,
                runSpacing: AppConstants.paddingSmall,
                children: [
                  if (job.minSalary != null || job.maxSalary != null)
                    _buildInfoBadge(_formatSalary()),
                  if (job.jobType != null)
                    _buildInfoBadge(job.jobType!),
                  if (job.locationPriority != null)
                    _buildInfoBadge(job.locationPriority!),
                ],
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Active since
              if (job.activeSince != null || job.createdAt != null)
                Text(
                  job.activeSince ?? 'Active recently',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppConstants.textSecondary,
                        fontSize: 11,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: AppConstants.textPrimary,
        ),
      ),
    );
  }


  String _formatSalary() {
    if (job.salaryToBeDiscussed == true) {
      return 'Salary: Negotiable';
    }
    if (job.minSalary != null && job.maxSalary != null) {
      return 'AED ${job.minSalary} - ${job.maxSalary}';
    }
    if (job.minSalary != null) {
      return 'From AED ${job.minSalary}';
    }
    if (job.maxSalary != null) {
      return 'Up to AED ${job.maxSalary}';
    }
    return '';
  }
}


