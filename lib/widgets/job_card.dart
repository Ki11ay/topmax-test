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
      margin: const EdgeInsets.only(bottom: AppConstants.paddingLarge),
      // height: 261,
      decoration: BoxDecoration(
        color: AppConstants.jobCardColor, // Light purple background
        borderRadius: BorderRadius.circular(AppConstants.radiusExtraExtraLarge),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          context.push('/job/${job.id}');
        },
        // borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with "New" badge and bookmark
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: job.isUrgent == true ? AppConstants.urgentColor : job.isMultipleHires == true ? AppConstants.multipleHiresColor : AppConstants.newJobColor, // Purple badge
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      job.isUrgent == true ? 'Urgent'
                       : job.isMultipleHires == true ? 'Hiring Multiple Candidates'
                        : 'New',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      width: 20,
                      height: 20,
                      job.isSaved == true
                          ? 'assets/icons/saved.png'
                          : 'assets/icons/save.png',
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
                      fontWeight: FontWeight.w500,
                      color: AppConstants.textPrimary,
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Company name
              if (job.companyName != null)
                Text(
                  job.companyName!,
                  style: const TextStyle(
                        color: AppConstants.textSecondary,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Location
              if (job.officeLocation != null)
                Text(
                  job.officeLocation!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    color: AppConstants.textSecondary,
                      ),
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Job details badges
              Wrap(
                spacing: 5,
                // runSpacing: AppConstants.paddingSmall,
                children: [
                  if (job.minSalary != null || job.maxSalary != null)
                    _buildInfoBadge(_formatSalary()),
                  if (job.jobType != null)
                    _buildInfoBadge(job.jobType!),
                  if (job.locationPriority != null)
                    _buildInfoBadge(job.locationPriority!),
                ],
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Active since
              if (job.activeSince != null || job.createdAt != null)
                Text(
                  job.activeSince ?? 'Active recently',
                  style: const TextStyle(
                        color: AppConstants.textTertiary,
                        fontSize: 12,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
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
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppConstants.jobSalaryBorderColor, width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
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


