import 'package:flutter/material.dart';
import '../models/filter_model.dart';
import '../models/job_category.dart';
import '../services/filter_service.dart';

class FilterBottomSheet extends StatefulWidget {
  final JobFilter currentFilter;
  final Function(JobFilter) onFilterChanged;

  const FilterBottomSheet({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late JobFilter _tempFilter;
  JobSortOption _sortOption = JobSortOption.newest;

  @override
  void initState() {
    super.initState();
    _tempFilter = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter & Sort',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: _clearAllFilters,
                      child: const Text('Clear All'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _applyFilters,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Apply'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sort Section
                  _buildSortSection(),
                  const SizedBox(height: 24),

                  // Category Filter
                  _buildCategoryFilter(),
                  const SizedBox(height: 24),

                  // Location Filter
                  _buildLocationFilter(),
                  const SizedBox(height: 24),

                  // Job Type Filter
                  _buildJobTypeFilter(),
                  const SizedBox(height: 24),

                  // Salary Range Filter
                  _buildSalaryRangeFilter(),
                  const SizedBox(height: 24),

                  // Date Filter
                  _buildDateFilter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Urutkan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: JobSortOption.values.map((option) {
            final isSelected = _sortOption == option;
            return FilterChip(
              label: Text(option.displayName),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _sortOption = option;
                });
              },
              selectedColor: Colors.indigo.withOpacity(0.2),
              checkmarkColor: Colors.indigo,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLocationFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lokasi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: FilterOptions.locations.map((location) {
            final isSelected = _tempFilter.locations.contains(location);
            return FilterChip(
              label: Text(location),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempFilter = _tempFilter.copyWith(
                      locations: [..._tempFilter.locations, location],
                    );
                  } else {
                    _tempFilter = _tempFilter.copyWith(
                      locations: _tempFilter.locations.where((l) => l != location).toList(),
                    );
                  }
                });
              },
              selectedColor: Colors.indigo.withOpacity(0.2),
              checkmarkColor: Colors.indigo,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildJobTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tipe Pekerjaan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: FilterOptions.jobTypes.map((type) {
            final isSelected = _tempFilter.jobTypes.contains(type);
            return FilterChip(
              label: Text(type),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempFilter = _tempFilter.copyWith(
                      jobTypes: [..._tempFilter.jobTypes, type],
                    );
                  } else {
                    _tempFilter = _tempFilter.copyWith(
                      jobTypes: _tempFilter.jobTypes.where((t) => t != type).toList(),
                    );
                  }
                });
              },
              selectedColor: Colors.indigo.withOpacity(0.2),
              checkmarkColor: Colors.indigo,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSalaryRangeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rentang Gaji',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: FilterOptions.salaryRanges.map((range) {
            final isSelected = _tempFilter.minSalary == range['min'] && 
                             _tempFilter.maxSalary == range['max'];
            return FilterChip(
              label: Text(range['label']),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempFilter = _tempFilter.copyWith(
                      minSalary: range['min'],
                      maxSalary: range['max'],
                    );
                  } else {
                    _tempFilter = _tempFilter.copyWith(clearSalary: true);
                  }
                });
              },
              selectedColor: Colors.indigo.withOpacity(0.2),
              checkmarkColor: Colors.indigo,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tanggal Post',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: FilterOptions.dateRanges.map((range) {
            final isSelected = _tempFilter.maxDaysAgo == range['days'];
            return FilterChip(
              label: Text(range['label']),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempFilter = _tempFilter.copyWith(
                      maxDaysAgo: range['days'],
                    );
                  } else {
                    _tempFilter = _tempFilter.copyWith(clearDaysAgo: true);
                  }
                });
              },
              selectedColor: Colors.indigo.withOpacity(0.2),
              checkmarkColor: Colors.indigo,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: JobCategory.getPopularCategories().map((category) {
            final isSelected = _tempFilter.categories.contains(category.id);
            return FilterChip(
              label: Text(category.name),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempFilter = _tempFilter.copyWith(
                      categories: [..._tempFilter.categories, category.id],
                    );
                  } else {
                    _tempFilter = _tempFilter.copyWith(
                      categories: _tempFilter.categories.where((c) => c != category.id).toList(),
                    );
                  }
                });
              },
              selectedColor: category.color.withValues(alpha: 0.2),
              checkmarkColor: category.color,
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => _showAllCategoriesDialog(),
          child: const Text('Lihat semua kategori'),
        ),
      ],
    );
  }

  void _showAllCategoriesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pilih Kategori'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: JobCategory.categories.map((category) {
                final isSelected = _tempFilter.categories.contains(category.id);
                return FilterChip(
                  label: Text(category.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _tempFilter = _tempFilter.copyWith(
                          categories: [..._tempFilter.categories, category.id],
                        );
                      } else {
                        _tempFilter = _tempFilter.copyWith(
                          categories: _tempFilter.categories.where((c) => c != category.id).toList(),
                        );
                      }
                    });
                    Navigator.pop(context);
                  },
                  selectedColor: category.color.withValues(alpha: 0.2),
                  checkmarkColor: category.color,
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _clearAllFilters() {
    setState(() {
      _tempFilter = JobFilter.empty();
      _sortOption = JobSortOption.newest;
    });
  }

  void _applyFilters() {
    widget.onFilterChanged(_tempFilter);
    Navigator.pop(context);
  }
}

void showFilterBottomSheet(
  BuildContext context,
  JobFilter currentFilter,
  Function(JobFilter) onFilterChanged,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FilterBottomSheet(
      currentFilter: currentFilter,
      onFilterChanged: onFilterChanged,
    ),
  );
}