import 'package:flutter/material.dart';
import '../models/job_category.dart';
import '../services/job_service.dart';
import 'category_card.dart';

class CategoriesGrid extends StatefulWidget {
  final List<JobCategory> categories;
  final Function(JobCategory) onCategoryTap;
  final List<String> selectedCategories;
  final bool showJobCounts;

  const CategoriesGrid({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    this.selectedCategories = const [],
    this.showJobCounts = true,
  });

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  Map<String, int> jobCounts = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.showJobCounts) {
      loadJobCounts();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadJobCounts() async {
    try {
      final counts = await JobService.getCategoryJobCounts();
      setState(() {
        jobCounts = counts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        final category = widget.categories[index];
        final categoryWithCount = category.copyWith(
          jobCount: jobCounts[category.id] ?? 0,
        );
        final isSelected = widget.selectedCategories.contains(category.id);

        return CategoryCard(
          category: categoryWithCount,
          onTap: () => widget.onCategoryTap(category),
          isSelected: isSelected,
        );
      },
    );
  }
}

class HorizontalCategoriesList extends StatefulWidget {
  final List<JobCategory> categories;
  final Function(JobCategory) onCategoryTap;
  final List<String> selectedCategories;
  final bool showJobCounts;

  const HorizontalCategoriesList({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    this.selectedCategories = const [],
    this.showJobCounts = true,
  });

  @override
  State<HorizontalCategoriesList> createState() => _HorizontalCategoriesListState();
}

class _HorizontalCategoriesListState extends State<HorizontalCategoriesList> {
  Map<String, int> jobCounts = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.showJobCounts) {
      loadJobCounts();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadJobCounts() async {
    try {
      final counts = await JobService.getCategoryJobCounts();
      setState(() {
        jobCounts = counts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final categoryWithCount = category.copyWith(
            jobCount: jobCounts[category.id] ?? 0,
          );
          final isSelected = widget.selectedCategories.contains(category.id);

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == widget.categories.length - 1 ? 16 : 0,
            ),
            child: CompactCategoryCard(
              category: categoryWithCount,
              onTap: () => widget.onCategoryTap(category),
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class PopularCategoriesSection extends StatelessWidget {
  final Function(JobCategory) onCategoryTap;
  final List<String> selectedCategories;

  const PopularCategoriesSection({
    super.key,
    required this.onCategoryTap,
    this.selectedCategories = const [],
  });

  @override
  Widget build(BuildContext context) {
    final popularCategories = JobCategory.getPopularCategories();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Kategori Populer',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        HorizontalCategoriesList(
          categories: popularCategories,
          onCategoryTap: onCategoryTap,
          selectedCategories: selectedCategories,
        ),
      ],
    );
  }
}

class AllCategoriesSection extends StatelessWidget {
  final Function(JobCategory) onCategoryTap;
  final List<String> selectedCategories;

  const AllCategoriesSection({
    super.key,
    required this.onCategoryTap,
    this.selectedCategories = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Semua Kategori',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CategoriesGrid(
            categories: JobCategory.categories,
            onCategoryTap: onCategoryTap,
            selectedCategories: selectedCategories,
          ),
        ),
      ],
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final Function(JobCategory) onCategoryTap;
  final List<String> selectedCategories;
  final bool showAllCategories;

  const CategoriesSection({
    super.key,
    required this.onCategoryTap,
    this.selectedCategories = const [],
    this.showAllCategories = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularCategoriesSection(
          onCategoryTap: onCategoryTap,
          selectedCategories: selectedCategories,
        ),
        if (showAllCategories) ...[
          const SizedBox(height: 24),
          AllCategoriesSection(
            onCategoryTap: onCategoryTap,
            selectedCategories: selectedCategories,
          ),
        ],
      ],
    );
  }
}