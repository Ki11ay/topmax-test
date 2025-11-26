import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/search_chip.dart';
import '../../../widgets/job_card.dart';
import '../../../state/search_provider.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final _searchController = TextEditingController();
  String _selectedFilter = 'Jobs';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text;
    if (query.isEmpty) return;
    
    print('🔍 Search Query: $query, Filter: $_selectedFilter');
    
    // Call the actual search API
    ref.read(searchProvider.notifier).search(
      keyword: query,
      jobType: _selectedFilter == 'Jobs' ? null : 'course',
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);
    final hasSearchResults = searchState.query != null && searchState.query!.isNotEmpty;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppConstants.sliverAppBarGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // SliverAppBar with search bar
              SliverAppBar(
                expandedHeight: hasSearchResults ? 158 : 120,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      // Search bar
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Search for jobs and courses',
                                    hintStyle: TextStyle(
                                      color: AppConstants.textSecondary,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    isDense: true,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: AppConstants.textPrimary,
                                  ),
                                  cursorColor: AppConstants.primaryBlue,
                                  onSubmitted: (_) => _performSearch(),
                                ),
                              ),
                              if (hasSearchResults) ...[
                                IconButton(
                                  onPressed: () {
                                    ref.read(searchProvider.notifier).clearSearch();
                                    _searchController.clear();
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                child: PopupMenuButton<String>(
                                  initialValue: _selectedFilter,
                                  onSelected: (value) {
                                    setState(() {
                                      _selectedFilter = value;
                                    });
                                  },
                                  offset: const Offset(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          _selectedFilter,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'Jobs',
                                      child: Text('Jobs'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'Courses',
                                      child: Text('Courses'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'All',
                                      child: Text('All'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Filter chips (only show when there are search results)
                      if (hasSearchResults) ...[
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.paddingMedium,
                          ),
                          child: Row(
                            children: [
                              _buildFilterChip('Easy Apply', false),
                              const SizedBox(width: 8),
                              _buildFilterChip('Location', true),
                              const SizedBox(width: 8),
                              _buildFilterChip('Date Posted', true),
                              const SizedBox(width: 8),
                              _buildFilterChip('Salary', true),
                              const SizedBox(width: 8),
                              _buildFilterChip('Experience', false),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              
              // Content as Sliver
              SliverFillRemaining(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppConstants.paddingLarge),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool hasCloseIcon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hasCloseIcon ? 12 : 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              color: AppConstants.textSecondary,
            ),
          ),
          if (hasCloseIcon) ...[
            const SizedBox(width: 4),
              Image.asset(
                'assets/icons/envelope.png',
                width: 10,
                height: 10,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildContent() {
    final searchState = ref.watch(searchProvider);

    // Show search results if available
    if (searchState.query != null && searchState.query!.isNotEmpty) {
      if (searchState.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (searchState.error != null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${searchState.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(searchProvider.notifier).clearSearch();
                  _searchController.clear();
                },
                child: const Text('Clear Search'),
              ),
            ],
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Results: ${searchState.jobs.length}',
            style: const TextStyle(
              fontSize: 14,
              color: AppConstants.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Expanded(
            child: searchState.jobs.isEmpty
                ? const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppConstants.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: searchState.jobs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: JobCard(job: searchState.jobs[index]),
                      );
                    },
                  ),
          ),
        ],
      );
    }

    // Show default content (popular searches, quick filters)
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Popular Searches
          Text(
            'Popular Searches',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SearchChip(
                label: 'Remote Jobs',
                onTap: () {
                  _searchController.text = 'Remote Jobs';
                  _performSearch();
                },
              ),
              SearchChip(
                label: 'Free Courses',
                onTap: () {
                  _searchController.text = 'Free Courses';
                  _performSearch();
                },
              ),
              SearchChip(
                label: 'Entry-Level Data Entry',
                onTap: () {
                  _searchController.text = 'Data Entry';
                  _performSearch();
                },
              ),
              SearchChip(
                label: 'Artificial Intelligence',
                onTap: () {
                  _searchController.text = 'AI';
                  _performSearch();
                },
              ),
              SearchChip(
                label: 'Sign Language Supported Courses',
                onTap: () {
                  _searchController.text = 'Sign Language';
                  _performSearch();
                },
              ),
              SearchChip(
                label: 'Urgent Hiring',
                onTap: () {
                  _searchController.text = 'Urgent';
                  _performSearch();
                },
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingLarge),
          
          // Quick Filter
          Text(
            'Quick Filter',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SearchChip(label: 'Jobs for People with Blindness', onTap: () {
                _searchController.text = 'Blindness';
                _performSearch();
              }),
              SearchChip(label: 'Jobs for People with Deafness', onTap: () {
                _searchController.text = 'Deafness';
                _performSearch();
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return OutlinedButton(
      onPressed: () {
        _searchController.text = label;
        _performSearch();
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppConstants.textPrimary,
          fontSize: 15,
        ),
      ),
    );
  }
}

