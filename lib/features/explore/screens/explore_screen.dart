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
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Light blue background
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for jobs and courses',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onSubmitted: (_) => _performSearch(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    initialValue: _selectedFilter,
                    onSelected: (value) {
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_selectedFilter),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'Jobs', child: Text('Jobs')),
                      const PopupMenuItem(value: 'Courses', child: Text('Courses')),
                      const PopupMenuItem(value: 'All', child: Text('All')),
                    ],
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search Results (${searchState.jobs.length})',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextButton(
                onPressed: () {
                  ref.read(searchProvider.notifier).clearSearch();
                  _searchController.clear();
                },
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Expanded(
            child: searchState.jobs.isEmpty
                ? const Center(child: Text('No results found'))
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
            style: Theme.of(context).textTheme.displayMedium,
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
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFilterButton('Jobs for People with Blindness'),
              const SizedBox(height: 8),
              _buildFilterButton('Jobs for People with Deafness'),
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

