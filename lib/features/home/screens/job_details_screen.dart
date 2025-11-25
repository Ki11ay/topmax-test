import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/jobs_provider.dart';

class JobDetailsScreen extends ConsumerStatefulWidget {
  final int jobId;

  const JobDetailsScreen({super.key, required this.jobId});

  @override
  ConsumerState<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends ConsumerState<JobDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(jobDetailsProvider(widget.jobId).notifier).loadJobDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobState = ref.watch(jobDetailsProvider(widget.jobId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        actions: [
          if (jobState.job != null)
            IconButton(
              icon: Icon(
                jobState.job!.isSaved == true
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              ),
              onPressed: () {
                ref
                    .read(jobDetailsProvider(widget.jobId).notifier)
                    .toggleSaveJob();
              },
            ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share job
            },
          ),
        ],
      ),
      body: jobState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 60,
                        color: AppConstants.errorColor,
                      ),
                      const SizedBox(height: AppConstants.paddingMedium),
                      Text(
                        'Error loading job details',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppConstants.paddingLarge),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(jobDetailsProvider(widget.jobId).notifier)
                              .loadJobDetails();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : jobState.job == null
                  ? const Center(child: Text('Job not found'))
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with company info
                          Container(
                            width: double.infinity,
                            padding:
                                const EdgeInsets.all(AppConstants.paddingLarge),
                            decoration: BoxDecoration(
                              color: AppConstants.lightBlue,
                              borderRadius: const BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(AppConstants.radiusLarge),
                                bottomRight:
                                    Radius.circular(AppConstants.radiusLarge),
                              ),
                            ),
                            child: Column(
                              children: [
                                // Company logo
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.radiusMedium),
                                  ),
                                  child: jobState.job!.company?.logo != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppConstants.radiusMedium),
                                          child: Image.network(
                                            jobState.job!.company!.logo!,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(
                                                Icons.business,
                                                size: 40,
                                                color: AppConstants.primaryBlue,
                                              );
                                            },
                                          ),
                                        )
                                      : const Icon(
                                          Icons.business,
                                          size: 40,
                                          color: AppConstants.primaryBlue,
                                        ),
                                ),
                                const SizedBox(height: AppConstants.paddingMedium),
                                Text(
                                  jobState.job!.jobTitle,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: AppConstants.paddingSmall),
                                if (jobState.job!.company != null)
                                  Text(
                                    jobState.job!.company!.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppConstants.textSecondary,
                                        ),
                                  ),
                                const SizedBox(height: AppConstants.paddingMedium),
                                // Job badges
                                Wrap(
                                  spacing: AppConstants.paddingSmall,
                                  runSpacing: AppConstants.paddingSmall,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    if (jobState.job!.isUrgent == true)
                                      _buildBadge(
                                          'Urgent', AppConstants.errorColor),
                                    if (jobState.job!.isMultipleHires == true)
                                      _buildBadge('Multiple Hires',
                                          AppConstants.successColor),
                                    if (jobState.job!.locationPriority != null)
                                      _buildBadge(
                                          jobState.job!.locationPriority!,
                                          AppConstants.primaryBlue),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Job details sections
                          Padding(
                            padding:
                                const EdgeInsets.all(AppConstants.paddingLarge),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Quick info
                                _buildInfoRow(
                                  Icons.work,
                                  'Job Type',
                                  jobState.job!.jobType ?? 'N/A',
                                ),
                                _buildInfoRow(
                                  Icons.trending_up,
                                  'Experience',
                                  jobState.job!.experienceLevel ?? 'N/A',
                                ),
                                _buildInfoRow(
                                  Icons.location_on,
                                  'Location',
                                  jobState.job!.officeLocation ?? 'N/A',
                                ),
                                if (jobState.job!.minSalary != null ||
                                    jobState.job!.maxSalary != null)
                                  _buildInfoRow(
                                    Icons.attach_money,
                                    'Salary',
                                    _formatSalary(jobState.job!),
                                  ),

                                const SizedBox(height: AppConstants.paddingLarge),

                                // Description
                                _buildSection(
                                  'Job Description',
                                  jobState.job!.jobDescription,
                                ),

                                // Responsibilities
                                if (jobState.job!.responsibilities != null)
                                  _buildSection(
                                    'Responsibilities',
                                    jobState.job!.responsibilities!,
                                  ),

                                // Requirements
                                if (jobState.job!.requirements != null)
                                  _buildSection(
                                    'Requirements',
                                    jobState.job!.requirements!,
                                  ),

                                // Qualifications
                                if (jobState.job!.qualifications != null)
                                  _buildSection(
                                    'Qualifications',
                                    jobState.job!.qualifications!,
                                  ),

                                // Benefits
                                if (jobState.job!.benefits != null)
                                  _buildSection(
                                    'Benefits',
                                    jobState.job!.benefits!,
                                  ),

                                const SizedBox(
                                    height: AppConstants.paddingExtraLarge),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
      bottomNavigationBar: jobState.job != null
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                child: ElevatedButton(
                  onPressed: () {
                    // Show apply dialog or navigate to application
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Apply for Job'),
                        content: const Text(
                            'Application feature will be implemented soon.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.paddingMedium,
                    ),
                  ),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(fontSize: AppConstants.fontSizeLarge),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppConstants.fontSizeSmall,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      child: Row(
        children: [
          Icon(
            icon,
            size: AppConstants.iconSizeMedium,
            color: AppConstants.primaryBlue,
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppConstants.textSecondary,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  String _formatSalary(job) {
    if (job.salaryToBeDiscussed == true) {
      return 'Negotiable';
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
    return 'Not specified';
  }
}

