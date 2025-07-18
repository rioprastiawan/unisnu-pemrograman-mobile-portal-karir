import '../models/job_category.dart';
import '../models/job.dart';
import 'job_service.dart';

class CategoryService {
  /// Get all available categories
  static Future<List<JobCategory>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return JobCategory.categories;
  }

  /// Get popular categories
  static Future<List<JobCategory>> getPopularCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return JobCategory.getPopularCategories();
  }

  /// Get categories by group
  static Future<List<JobCategory>> getTechCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return JobCategory.getTechCategories();
  }

  static Future<List<JobCategory>> getBusinessCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return JobCategory.getBusinessCategories();
  }

  static Future<List<JobCategory>> getCreativeCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return JobCategory.getCreativeCategories();
  }

  /// Get jobs by category
  static Future<List<Job>> getJobsByCategory(String categoryId) async {
    return await JobService.getJobsByCategory(categoryId);
  }

  /// Get job counts per category
  static Future<Map<String, int>> getCategoryJobCounts() async {
    return await JobService.getCategoryJobCounts();
  }

  /// Get categories with job counts
  static Future<List<JobCategory>> getCategoriesWithJobCounts() async {
    final categories = await getCategories();
    final jobCounts = await getCategoryJobCounts();
    
    return categories.map((category) {
      return category.copyWith(jobCount: jobCounts[category.id] ?? 0);
    }).toList();
  }

  /// Search categories by name
  static Future<List<JobCategory>> searchCategories(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    if (query.trim().isEmpty) {
      return JobCategory.categories;
    }
    
    final lowercaseQuery = query.toLowerCase();
    return JobCategory.categories.where((category) =>
      category.name.toLowerCase().contains(lowercaseQuery) ||
      category.description.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  /// Get category by ID
  static Future<JobCategory?> getCategoryById(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return JobCategory.findById(categoryId);
  }

  /// Get category statistics
  static Future<Map<String, dynamic>> getCategoryStats() async {
    final jobCounts = await getCategoryJobCounts();
    final totalJobs = jobCounts.values.fold(0, (sum, count) => sum + count);
    final activeCategories = jobCounts.entries.where((entry) => entry.value > 0).length;
    
    return {
      'totalCategories': JobCategory.categories.length,
      'activeCategories': activeCategories,
      'totalJobs': totalJobs,
      'avgJobsPerCategory': totalJobs / JobCategory.categories.length,
      'mostPopularCategory': jobCounts.entries.isEmpty 
          ? null 
          : jobCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key,
      'jobCounts': jobCounts,
    };
  }

  /// Get trending categories (categories with most jobs posted recently)
  static Future<List<JobCategory>> getTrendingCategories({int limit = 5}) async {
    final jobCounts = await getCategoryJobCounts();
    final sortedEntries = jobCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    final trendingCategoryIds = sortedEntries
        .take(limit)
        .map((entry) => entry.key)
        .toList();
    
    return JobCategory.categories
        .where((category) => trendingCategoryIds.contains(category.id))
        .map((category) => category.copyWith(jobCount: jobCounts[category.id] ?? 0))
        .toList();
  }

  /// Get recommended categories based on user preferences
  static Future<List<JobCategory>> getRecommendedCategories(
    List<String> userPreferences,
    {int limit = 5}
  ) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    if (userPreferences.isEmpty) {
      return getPopularCategories();
    }
    
    // Simple recommendation: return categories that match user preferences
    final recommended = JobCategory.categories
        .where((category) => userPreferences.contains(category.id))
        .toList();
    
    if (recommended.length < limit) {
      // Fill with popular categories if not enough recommendations
      final popular = await getPopularCategories();
      recommended.addAll(
        popular.where((category) => !recommended.contains(category))
      );
    }
    
    return recommended.take(limit).toList();
  }
}