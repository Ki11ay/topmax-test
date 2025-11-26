import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/home_provider.dart';
import '../../../widgets/job_card.dart';
import '../../../widgets/featured_jobs_card.dart';
import '../../../widgets/special_abilities_job_card.dart';
import '../../../models/job_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _selectedDisabilityFilter = 'All';
  String _selectedRecentOpeningsFilter = 'All';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load home data when screen is initialized
    Future.microtask(() => ref.read(homeProvider.notifier).loadHomeData());
    
    // Add scroll listener for pagination
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // Load more recent openings when user is 300px from bottom
      ref.read(homeProvider.notifier).loadMoreRecentOpenings();
    }
  }

  Future<void> _refreshData() async {
    await ref.read(homeProvider.notifier).loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    
    // Show error snackbar if there's an error
    if (homeState.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final errorParts = homeState.error!.split(':');
        final errorType = errorParts.length > 1 ? errorParts[0] : '';
        final errorMessage = errorParts.length > 1 ? errorParts[1] : homeState.error!;
        
        final isProfileError = errorType == 'profile_incomplete';
        final isSessionExpired = errorType == 'session_expired';
        
        IconData icon;
        Color backgroundColor;
        String actionLabel;
        
        if (isSessionExpired) {
          icon = Icons.access_time;
          backgroundColor = const Color(0xFFE74C3C); // Red for session expired
          actionLabel = 'Login';
        } else if (isProfileError) {
          icon = Icons.account_circle_outlined;
          backgroundColor = const Color(0xFFE67E22); // Orange for profile
          actionLabel = 'Go to Profile';
        } else {
          icon = Icons.error_outline;
          backgroundColor = AppConstants.errorColor;
          actionLabel = 'Dismiss';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            backgroundColor: backgroundColor,
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: actionLabel,
              textColor: Colors.white,
              onPressed: () {
                ref.read(homeProvider.notifier).clearError();
                if (isSessionExpired) {
                  context.go('/auth/phone'); // Navigate to login
                } else if (isProfileError) {
                  context.go('/more'); // Navigate to profile
                }
              },
            ),
          ),
        );
        ref.read(homeProvider.notifier).clearError();
      });
    }

    return Scaffold(
      backgroundColor: AppConstants.cardColor,
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
                    controller: _scrollController,
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

                        // Jobs for Special Abilities Section
                        _buildSectionHeader(
                          context,
                          'Jobs for Special Abilities',
                          onSeeAll: () {},
                        ),
                        if (homeState.disabilityJobs.isEmpty) ...[
                          _buildEmptyState(
                            icon: Icons.accessibility_new,
                            title: 'No Special Ability Jobs',
                            message: 'Check back soon for opportunities tailored for you',
                          ),
                        ] else ...[
                          _buildFilterChips(
                            ['All', 'Deaf', 'Blind'],
                            _selectedDisabilityFilter,
                            (filter) {
                              setState(() {
                                _selectedDisabilityFilter = filter;
                              });
                            },
                          ),
                          const SizedBox(height: AppConstants.paddingSmall),
                          SizedBox( // Increased height for description
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.paddingMedium),
                              itemCount: homeState.disabilityJobs.length + 
                                  (homeState.hasMoreDisabilityJobs ? 1 : 0),
                              itemBuilder: (context, index) {
                                // Load more button at the end
                                if (index == homeState.disabilityJobs.length) {
                                  return _buildLoadMoreCard(
                                    onTap: () => ref
                                        .read(homeProvider.notifier)
                                        .loadMoreDisabilityJobs(),
                                    isLoading: homeState.isLoadingMore,
                                    width: 365,
                                  );
                                }
                                
                                final job = homeState.disabilityJobs[index];
                                return SpecialAbilitiesJobCard(
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

                        // Featured Jobs Section
                        _buildSectionHeader(
                          context,
                          'Featured Jobs',
                          onSeeAll: () {},
                        ),
                        if (homeState.featuredJobs.isEmpty) ...[
                          _buildEmptyState(
                            icon: Icons.star_outline,
                            title: 'No Featured Jobs Yet',
                            message: 'Great opportunities will be featured here',
                          ),
                        ] else ...[
                          SizedBox(
                            height: 280,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.paddingMedium),
                              itemCount: homeState.featuredJobs.length + 
                                  (homeState.hasMoreFeaturedJobs ? 1 : 0),
                              itemBuilder: (context, index) {
                                // Load more button at the end
                                if (index == homeState.featuredJobs.length) {
                                  return _buildLoadMoreCard(
                                    onTap: () => ref
                                        .read(homeProvider.notifier)
                                        .loadMoreFeaturedJobs(),
                                    isLoading: homeState.isLoadingMore,
                                  );
                                }
                                
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
                        ],
                        const SizedBox(height: AppConstants.paddingLarge),

                        // Recent Openings Section
                        if (homeState.recentOpenings.isNotEmpty) ...[
                          _buildSectionHeader(
                            context,
                            'Recent Openings',
                            onSeeAll: () {},
                          ),
                          _buildFilterChips(
                            ['All', 'Full Time', 'Part Time', 'On-site', 'Hybrid', 'Remote'],
                            _selectedRecentOpeningsFilter,
                            (filter) {
                              setState(() {
                                _selectedRecentOpeningsFilter = filter;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.paddingMedium),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _getFilteredRecentOpenings(homeState).length,
                              itemBuilder: (context, index) {
                                final job = _getFilteredRecentOpenings(homeState)[index];
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

                        // Loading more indicator
                        if (homeState.isLoadingMore)
                          const Padding(
                            padding: EdgeInsets.all(AppConstants.paddingLarge),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),

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
        // vertical: AppConstants.paddingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              child: const Text('See More',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w600,
                color: AppConstants.primaryBlue,
              ),),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(
    List<String> filters,
    String selectedFilter,
    Function(String) onFilterSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) {
            final isSelected = filter == selectedFilter;
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: FilterChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                label: Text(filter, style: 
                TextStyle(
                  fontSize: 14, 
                  fontFamily: 'DM Sans',
                  color: isSelected ? Colors.white : AppConstants.textSecondary,
                ),),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    onFilterSelected(filter);
                  }
                },
                backgroundColor: Colors.white,
                selectedColor: AppConstants.buttonBlue,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppConstants.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                side: BorderSide(
                  color: isSelected
                      ? AppConstants.buttonBlue
                      : Colors.grey.shade300,
                ),
                showCheckmark: false,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Job> _getFilteredRecentOpenings(HomeState homeState) {
    if (_selectedRecentOpeningsFilter == 'All') {
      return homeState.recentOpenings;
    }

    return homeState.recentOpenings.where((job) {
      switch (_selectedRecentOpeningsFilter) {
        case 'Full Time':
          return job.jobType?.toLowerCase().contains('full') ?? false;
        case 'Part Time':
          return job.jobType?.toLowerCase().contains('part') ?? false;
        case 'On-site':
          return job.locationPriority?.toLowerCase().contains('on-site') ??
              job.locationPriority?.toLowerCase().contains('onsite') ??
              false;
        case 'Hybrid':
          return job.locationPriority?.toLowerCase().contains('hybrid') ?? false;
        case 'Remote':
          return job.locationPriority?.toLowerCase().contains('remote') ?? false;
        default:
          return true;
      }
    }).toList();
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingLarge,
      ),
      padding: const EdgeInsets.all(AppConstants.paddingLarge * 1.5),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 48,
              color: AppConstants.primaryBlue.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textPrimary,
                ),
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppConstants.textSecondary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreCard({
    required VoidCallback onTap,
    required bool isLoading,
    double? width,
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? 200,
        margin: const EdgeInsets.only(right: AppConstants.paddingMedium),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: AppConstants.primaryBlue.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 48,
                      color: AppConstants.primaryBlue,
                    ),
                    const SizedBox(height: AppConstants.paddingSmall),
                    Text(
                      'Load More',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w600,
                        color: AppConstants.primaryBlue,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

