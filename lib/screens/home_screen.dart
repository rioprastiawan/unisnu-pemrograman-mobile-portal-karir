import 'package:flutter/material.dart';
import '../models/job.dart';
import '../models/filter_model.dart';
import '../models/job_category.dart';
import '../services/job_service.dart';
import '../services/filter_service.dart';
import '../widgets/job_card.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/categories_grid.dart';
import 'job_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Job> jobs = [];
  List<Job> filteredJobs = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();
  JobFilter currentFilter = JobFilter.empty();
  JobSortOption sortOption = JobSortOption.newest;

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  Future<void> loadJobs() async {
    setState(() {
      isLoading = true;
    });

    try {
      final jobList = await JobService.getAllJobs();
      setState(() {
        jobs = jobList;
        filteredJobs = jobList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading jobs')),
        );
      }
    }
  }

  void searchJobs(String query) {
    setState(() {
      filteredJobs = FilterService.applyFilters(
        jobs, 
        currentFilter, 
        searchQuery: query.trim().isEmpty ? null : query,
      );
      filteredJobs = FilterService.sortJobs(filteredJobs, sortOption);
    });
  }

  void applyFilters(JobFilter filter) {
    setState(() {
      currentFilter = filter;
      final searchQuery = searchController.text.trim();
      filteredJobs = FilterService.applyFilters(
        jobs,
        currentFilter,
        searchQuery: searchQuery.isEmpty ? null : searchQuery,
      );
      filteredJobs = FilterService.sortJobs(filteredJobs, sortOption);
    });
  }

  void clearFilters() {
    setState(() {
      currentFilter = JobFilter.empty();
      searchController.clear();
      filteredJobs = jobs;
      filteredJobs = FilterService.sortJobs(filteredJobs, sortOption);
    });
  }

  void navigateToJobDetail(Job job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailScreen(jobId: job.id),
      ),
    );
  }

  void onCategoryTap(JobCategory category) {
    setState(() {
      // Toggle category selection
      final newCategories = currentFilter.categories.contains(category.id)
          ? currentFilter.categories.where((c) => c != category.id).toList()
          : [...currentFilter.categories, category.id];
      
      currentFilter = currentFilter.copyWith(categories: newCategories);
      
      // Apply filters
      final searchQuery = searchController.text.trim();
      filteredJobs = FilterService.applyFilters(
        jobs,
        currentFilter,
        searchQuery: searchQuery.isEmpty ? null : searchQuery,
      );
      filteredJobs = FilterService.sortJobs(filteredJobs, sortOption);
    });
  }

  List<Widget> _buildActiveFilterChips() {
    List<Widget> chips = [];

    // Category chips
    for (String categoryId in currentFilter.categories) {
      final category = JobCategory.findById(categoryId);
      if (category != null) {
        chips.add(
          Chip(
            label: Text(category.name),
            backgroundColor: category.color.withValues(alpha: 0.1),
            labelStyle: TextStyle(
              color: category.color,
              fontSize: 12,
            ),
            deleteIcon: Icon(Icons.close, size: 16, color: category.color),
            onDeleted: () {
              final newCategories = currentFilter.categories.where((c) => c != categoryId).toList();
              applyFilters(currentFilter.copyWith(categories: newCategories));
            },
          ),
        );
      }
    }

    // Location chips
    for (String location in currentFilter.locations) {
      chips.add(
        Chip(
          label: Text(location),
          backgroundColor: Colors.white.withOpacity(0.9),
          labelStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 12,
          ),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            final newLocations = currentFilter.locations.where((l) => l != location).toList();
            applyFilters(currentFilter.copyWith(locations: newLocations));
          },
        ),
      );
    }

    // Job type chips
    for (String type in currentFilter.jobTypes) {
      chips.add(
        Chip(
          label: Text(type),
          backgroundColor: Colors.white.withOpacity(0.9),
          labelStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 12,
          ),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            final newTypes = currentFilter.jobTypes.where((t) => t != type).toList();
            applyFilters(currentFilter.copyWith(jobTypes: newTypes));
          },
        ),
      );
    }

    // Salary chip
    if (currentFilter.minSalary != null || currentFilter.maxSalary != null) {
      String salaryText = 'Gaji';
      if (currentFilter.minSalary != null && currentFilter.maxSalary != null) {
        if (currentFilter.maxSalary == double.infinity) {
          salaryText = '> ${(currentFilter.minSalary! / 1000000).toInt()} Juta';
        } else {
          salaryText = '${(currentFilter.minSalary! / 1000000).toInt()}-${(currentFilter.maxSalary! / 1000000).toInt()} Juta';
        }
      }
      chips.add(
        Chip(
          label: Text(salaryText),
          backgroundColor: Colors.white.withOpacity(0.9),
          labelStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 12,
          ),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            applyFilters(currentFilter.copyWith(clearSalary: true));
          },
        ),
      );
    }

    // Date chip
    if (currentFilter.maxDaysAgo != null) {
      String dateText = '${currentFilter.maxDaysAgo} hari';
      chips.add(
        Chip(
          label: Text(dateText),
          backgroundColor: Colors.white.withOpacity(0.9),
          labelStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 12,
          ),
          deleteIcon: const Icon(Icons.close, size: 16),
          onDeleted: () {
            applyFilters(currentFilter.copyWith(clearDaysAgo: true));
          },
        ),
      );
    }

    return chips;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Portal Karir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Temukan karir impian Anda!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: searchController,
                    onChanged: searchJobs,
                    decoration: InputDecoration(
                      hintText: 'Cari lowongan kerja...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Filter and Sort buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => showFilterBottomSheet(
                            context,
                            currentFilter,
                            applyFilters,
                          ),
                          icon: const Icon(Icons.filter_list),
                          label: Text(
                            currentFilter.isEmpty
                                ? 'Filter'
                                : 'Filter (${currentFilter.activeFilterCount})',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.indigo,
                            side: const BorderSide(color: Colors.indigo),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!currentFilter.isEmpty)
                        ElevatedButton.icon(
                          onPressed: clearFilters,
                          icon: const Icon(Icons.clear, size: 18),
                          label: const Text('Clear'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[100],
                            foregroundColor: Colors.red[700],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Active filters chips
                  if (!currentFilter.isEmpty)
                    Container(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: _buildActiveFilterChips(),
                      ),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          // Categories Section
          if (!isLoading && jobs.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 16),
                PopularCategoriesSection(
                  onCategoryTap: onCategoryTap,
                  selectedCategories: currentFilter.categories,
                ),
                const SizedBox(height: 16),
              ],
            ),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : filteredJobs.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work_off,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Tidak ada lowongan yang ditemukan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: loadJobs,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredJobs.length,
                          itemBuilder: (context, index) {
                            final job = filteredJobs[index];
                            return JobCard(
                              job: job,
                              onTap: () => navigateToJobDetail(job),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}