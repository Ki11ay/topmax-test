import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_constants.dart';
import '../models/job_model.dart';

class SpecialAbilitiesJobCard extends StatelessWidget {
  final Job job;
  final VoidCallback? onSave;

  const SpecialAbilitiesJobCard({
    super.key,
    required this.job,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365, // Fixed width
      margin: const EdgeInsets.only(right: AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: AppConstants.jobCardColor, // Light purple background
        borderRadius: BorderRadius.circular(AppConstants.radiusExtraExtraLarge),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          context.push('/job/${job.id}');
        },
        borderRadius: BorderRadius.circular(AppConstants.radiusExtraExtraLarge),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Dynamic height
            children: [
              // Top row with badges (column) and bookmark
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badges column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Special Abilities badge - always show for this card type
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCCE5FF), // Light blue
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                              job.disabilityOther?.isNotEmpty == true 
                                  ? job.disabilityOther! 
                                  : 'Special Abilities',
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                color: AppConstants.textPrimary,
                              ),
                            ),
                      ),
                      const SizedBox(height: 8),
                      // Regular badge (Urgent/Multiple Hires/New)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: job.isUrgent == true
                              ? AppConstants.urgentColor
                              : job.isMultipleHires == true
                                  ? AppConstants.multipleHiresColor
                                  : AppConstants.newJobColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          job.isUrgent == true
                              ? 'Urgent'
                              : job.isMultipleHires == true
                                  ? 'Hiring Multiple Candidates'
                                  : 'New',
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            color: AppConstants.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Save button
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
              const SizedBox(height: AppConstants.paddingSmall),
              // Job description - NEW ADDITION
              if (job.jobDescription.isNotEmpty)
                Text(
                  job.jobDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    color: AppConstants.textTertiary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: AppConstants.paddingSmall),
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
                  job.officeLocation!.split(' – ').last.trim() + '  ●  ' + job.officeLocation!.split(' – ').first.trim(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    color: AppConstants.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: AppConstants.paddingSmall),
              // Job details badges
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  _buildInfoBadge(_formatSalary()),
                  if (job.jobType != null) _buildInfoBadge(job.jobType!),
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
    return 'From AED 5000 / month';
  }
}

