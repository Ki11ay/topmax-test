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
      width: 280,
      margin: const EdgeInsets.only(right: AppConstants.paddingMedium),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            context.push('/job/${job.id}');
          },
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppConstants.primaryBlue.withOpacity(0.1),
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusMedium),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: job.companyLogo != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusMedium),
                                child: Image.network(
                                  job.companyLogo!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.business,
                                      color: AppConstants.primaryBlue,
                                      size: 30,
                                    );
                                  },
                                ),
                              )
                            : const Icon(
                                Icons.business,
                                color: AppConstants.primaryBlue,
                                size: 30,
                              ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppConstants.primaryBlue,
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusSmall),
                        ),
                        child: const Text(
                          'FEATURED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  Text(
                    job.jobTitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  if (job.companyName != null)
                    Text(
                      job.companyName!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppConstants.textSecondary,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  Text(
                    job.jobDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  const Divider(),
                  Row(
                    children: [
                      if (job.officeLocation != null) ...[
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppConstants.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            job.officeLocation!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: AppConstants.textSecondary,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

