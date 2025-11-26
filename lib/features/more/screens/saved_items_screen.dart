import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/job_card.dart';
import '../../../widgets/course_card.dart';
import '../../../state/saved_items_provider.dart';
import '../../../state/auth_provider.dart';

class SavedItemsScreen extends ConsumerStatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  ConsumerState<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends ConsumerState<SavedItemsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Add listener to rebuild when tab changes
    _tabController.addListener(() {
      setState(() {});
    });
    
    // Load saved items when screen opens
    Future.microtask(() {
      ref.read(savedItemsProvider.notifier).loadAll();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Tab(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppConstants.textPrimary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppConstants.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final savedItemsState = ref.watch(savedItemsProvider);

    return Scaffold(
      backgroundColor: AppConstants.cardColor,
      appBar: AppBar(
        title: Text('Bookmarks', style: TextStyle(fontSize: 20, fontFamily: 'DM Sans', fontWeight: FontWeight.w600, color: AppConstants.textPrimary),),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppConstants.unselectedTabColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppConstants.primaryBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelPadding: EdgeInsets.zero,
              tabs: [
                _buildTab(
                  icon: Icons.cases_outlined,
                  label: 'Saved Jobs',
                  isSelected: _tabController.index == 0,
                ),
                _buildTab(
                  icon: Icons.menu_book_outlined,
                  label: 'Saved Courses',
                  isSelected: _tabController.index == 1,
                ),
              ],
            ),
          ),
        ),
      ),
      body: savedItemsState.isLoading && !savedItemsState.jobsLoaded && !savedItemsState.coursesLoaded
          ? const Center(child: CircularProgressIndicator())
          : savedItemsState.error != null
              ? _buildErrorState(savedItemsState.error!)
              : TabBarView(
                  controller: _tabController,
                  children: [
                    // Saved Jobs Tab
                    _buildJobsList(savedItemsState.savedJobs),
                    // Saved Courses Tab
                    _buildCoursesList(savedItemsState.savedCourses),
                  ],
                ),
    );
  }

  Widget _buildJobsList(List jobs) {
    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppConstants.unselectedTabColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bookmark_border,
                size: 56,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No saved jobs yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimary,
                fontFamily: 'DM Sans',
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Start exploring and save jobs to see them here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'DM Sans',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(savedItemsProvider.notifier).loadSavedJobs(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: JobCard(job: jobs[index]),
          );
        },
      ),
    );
  }

  Widget _buildCoursesList(List courses) {
    if (courses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppConstants.unselectedTabColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bookmark_border,
                size: 56,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No saved courses yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimary,
                fontFamily: 'DM Sans',
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Start exploring and save courses to see them here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'DM Sans',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(savedItemsProvider.notifier).loadSavedCourses(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CourseCard(course: courses[index]),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(SavedItemsError error) {
    IconData errorIcon;
    Color errorColor;
    String buttonText;
    VoidCallback onButtonPressed;

    switch (error.type) {
      case SavedItemsErrorType.unauthorized:
        errorIcon = Icons.lock_outline;
        errorColor = Colors.orange;
        buttonText = 'Log In Again';
        onButtonPressed = () async {
          // Clear auth state and navigate to login
          await ref.read(authProvider.notifier).logout();
          if (mounted) {
            context.go('/auth/phone');
          }
        };
        break;
      case SavedItemsErrorType.network:
        errorIcon = Icons.wifi_off_outlined;
        errorColor = Colors.red;
        buttonText = 'Retry';
        onButtonPressed = () {
          ref.read(savedItemsProvider.notifier).loadAll();
        };
        break;
      case SavedItemsErrorType.server:
        errorIcon = Icons.cloud_off_outlined;
        errorColor = Colors.purple;
        buttonText = 'Try Again';
        onButtonPressed = () {
          ref.read(savedItemsProvider.notifier).loadAll();
        };
        break;
      case SavedItemsErrorType.unknown:
        errorIcon = Icons.error_outline;
        errorColor = Colors.grey;
        buttonText = 'Retry';
        onButtonPressed = () {
          ref.read(savedItemsProvider.notifier).loadAll();
        };
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: errorColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                errorIcon,
                size: 56,
                color: errorColor,
              ),
            ),
            const SizedBox(height: 32),

            // Error Title
            Text(
              _getErrorTitle(error.type),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppConstants.textPrimary,
                fontFamily: 'DM Sans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Error Message
            Text(
              error.message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'DM Sans',
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Action Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: errorColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      error.type == SavedItemsErrorType.unauthorized
                          ? Icons.login
                          : Icons.refresh,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Secondary Action (Cancel/Back)
            if (error.type == SavedItemsErrorType.unauthorized) ...[
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getErrorTitle(SavedItemsErrorType type) {
    switch (type) {
      case SavedItemsErrorType.unauthorized:
        return 'Session Expired';
      case SavedItemsErrorType.network:
        return 'Connection Problem';
      case SavedItemsErrorType.server:
        return 'Server Error';
      case SavedItemsErrorType.unknown:
        return 'Something Went Wrong';
    }
  }
}

