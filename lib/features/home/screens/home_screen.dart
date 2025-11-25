import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/home_provider.dart';
import '../../../widgets/job_card.dart';
import '../../../widgets/featured_jobs_card.dart';
import '../../../widgets/course_card.dart';
import '../../../widgets/search_chip.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load home data when screen is initialized
    Future.microtask(() => ref.read(homeProvider.notifier).loadHomeData());
  }

  Future<void> _refreshData() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 16),
            Text('Refreshing data...'),
          ],
        ),
        duration: Duration(seconds: 5),
      ),
    );
    
    await ref.read(homeProvider.notifier).loadHomeData();
    
    if (mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✓ Data refreshed'),
          backgroundColor: AppConstants.successColor,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Navigate to notifications
            },
          ),
        ],
      ),
      body: homeState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : homeState.error != null
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
                        'Error loading data',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        homeState.error!,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppConstants.paddingLarge),
                      ElevatedButton(
                        onPressed: _refreshData,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _refreshData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search bar
                        Padding(
                          padding:
                              const EdgeInsets.all(AppConstants.paddingMedium),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to explore screen
                              context.go('/explore');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusMedium),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Search for jobs and courses',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Popular categories chips
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.paddingMedium),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SearchChip(label: 'All'),
                                const SizedBox(width: AppConstants.paddingSmall),
                                const SearchChip(label: 'Full-time'),
                                const SizedBox(width: AppConstants.paddingSmall),
                                const SearchChip(label: 'Part-time'),
                                const SizedBox(width: AppConstants.paddingSmall),
                                const SearchChip(label: 'Remote'),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: AppConstants.paddingLarge),

                        // Featured Jobs
                        if (homeState.featuredJobs.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Featured Jobs',
                            onSeeAll: () {},
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.paddingMedium),
                              itemCount: homeState.featuredJobs.length,
                              itemBuilder: (context, index) {
                                final job = homeState.featuredJobs[index];
                                return FeaturedJobsCard(
                                  job: job,
                                  onSave: () {
                                    ref
                                        .read(homeProvider.notifier)
                                        .toggleSaveJob(
                                          job.id,
                                          job.isSaved ?? false,
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: AppConstants.paddingLarge),
                        ],

                        // Recent Openings
                        if (homeState.recentOpenings.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Recent Openings',
                            onSeeAll: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.paddingMedium),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeState.recentOpenings.length > 5
                                  ? 5
                                  : homeState.recentOpenings.length,
                              itemBuilder: (context, index) {
                                final job = homeState.recentOpenings[index];
                                return JobCard(
                                  job: job,
                                  onSave: () {
                                    ref
                                        .read(homeProvider.notifier)
                                        .toggleSaveJob(
                                          job.id,
                                          job.isSaved ?? false,
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                        ],

                        // Courses for You
                        if (homeState.coursesForYou.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Courses for You',
                            onSeeAll: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.paddingMedium),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeState.coursesForYou.length > 3
                                  ? 3
                                  : homeState.coursesForYou.length,
                              itemBuilder: (context, index) {
                                final course = homeState.coursesForYou[index];
                                return CourseCard(
                                  course: course,
                                  onSave: () {
                                    // Toggle save course
                                  },
                                );
                              },
                            ),
                          ),
                        ],

                        // Disability Jobs
                        if (homeState.disabilityJobs.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Jobs for People with Disabilities',
                            onSeeAll: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.paddingMedium),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeState.disabilityJobs.length > 3
                                  ? 3
                                  : homeState.disabilityJobs.length,
                              itemBuilder: (context, index) {
                                final job = homeState.disabilityJobs[index];
                                return JobCard(
                                  job: job,
                                  onSave: () {
                                    ref
                                        .read(homeProvider.notifier)
                                        .toggleSaveJob(
                                          job.id,
                                          job.isSaved ?? false,
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                        ],

                        // Matched Jobs
                        if (homeState.matchedJobs.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Matched Jobs',
                            onSeeAll: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.paddingMedium),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeState.matchedJobs.length > 5
                                  ? 5
                                  : homeState.matchedJobs.length,
                              itemBuilder: (context, index) {
                                final job = homeState.matchedJobs[index];
                                return JobCard(
                                  job: job,
                                  onSave: () {
                                    ref
                                        .read(homeProvider.notifier)
                                        .toggleSaveJob(
                                          job.id,
                                          job.isSaved ?? false,
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                        ],

                        const SizedBox(height: AppConstants.paddingLarge),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title, {
    VoidCallback? onSeeAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              child: const Text('See All'),
            ),
        ],
      ),
    );
  }
}

