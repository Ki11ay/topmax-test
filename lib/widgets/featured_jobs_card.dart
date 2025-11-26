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
      width: 365,
      margin: const EdgeInsets.only(right: AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusExtraExtraLarge),
        border: Border.all(color: const Color(0xFFCAC9C9), width: 1),
      ),
      child: Column(
        children: [
          Container(
          margin: const EdgeInsets.all(AppConstants.paddingSmall),
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          decoration: BoxDecoration(
            // Rotate among three different background colors so that no two following cards have the same color
            color: [const Color(0xFFFCE7F3), const Color.fromARGB(255, 230, 220, 104), const Color(0xFFBB5CA026), const Color(0xFFE3D7FF)][job.id % 4],
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Company logo and bookmark
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFCAC9C9), width: 1),
                      ),
                      child: job.companyLogo != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.radiusSmall),
                              child: Image.network(
                                job.companyLogo!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.business,
                              color: Color(0xFFDB2777),
                              size: 24,
                            ),
                    ),
                    const SizedBox(width: AppConstants.paddingSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.companyName!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w600,
                            color: AppConstants.textPrimary,
                          ),
                        ),
                        Text(
                          job.officeLocation!.split(' – ').first.trim(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            color: AppConstants.textTertiary,
                          ),
                        ),
                      ],
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
                  style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        color: AppConstants.textPrimary,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                // Job description
                Text(
                  job.jobDescription,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        color: AppConstants.textTertiary,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.paddingLarge),
                // Job type and location badges
                Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  children: [
                    if (job.jobType != null)
                      _buildBadge(job.jobType!, AppConstants.cardColor),
                    if (job.locationPriority != null)
                      _buildBadge(job.locationPriority!, AppConstants.cardColor),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge,),
            child: Row(
            children: [
              Text(
                _formatSalary(),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  color: AppConstants.textPrimary,
                ),
              ),
              Spacer(),
              InkWell(
              onTap: () {
                context.push('/job/${job.id}');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppConstants.jobSalaryBorderColor, width: 1),
                  color: AppConstants.cardColor,
                ),
                child: Text(
                  'Details',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    color: AppConstants.textPrimary,
                  ),
                ),
              ),
            ),
            ],
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
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
      return 'From AED ${job.minSalary} / month';
    }
    if (job.minSalary != null) {
      return 'From AED ${job.minSalary}';
    }
    if (job.maxSalary != null) {
      return 'Up to AED ${job.maxSalary}';
    }
    return 'From AED 15000 / month';
  }
}

