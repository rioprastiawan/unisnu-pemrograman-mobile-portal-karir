import '../models/job.dart';
import '../models/filter_model.dart';

class FilterService {
  static List<Job> applyFilters(List<Job> jobs, JobFilter filter, {String? searchQuery}) {
    if (filter.isEmpty && (searchQuery == null || searchQuery.isEmpty)) {
      return jobs;
    }

    return jobs.where((job) {
      bool passesFilter = true;

      // Search query filter
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        passesFilter = passesFilter &&
            (job.title.toLowerCase().contains(query) ||
                job.company.toLowerCase().contains(query) ||
                job.location.toLowerCase().contains(query) ||
                job.description.toLowerCase().contains(query));
      }

      // Location filter
      if (filter.locations.isNotEmpty) {
        passesFilter = passesFilter &&
            filter.locations.any((location) => 
                job.location.toLowerCase().contains(location.toLowerCase()));
      }

      // Job type filter
      if (filter.jobTypes.isNotEmpty) {
        passesFilter = passesFilter &&
            filter.jobTypes.any((type) => 
                job.type.toLowerCase().contains(type.toLowerCase()));
      }

      // Category filter
      if (filter.categories.isNotEmpty) {
        passesFilter = passesFilter &&
            filter.categories.contains(job.categoryId);
      }

      // Salary range filter
      if (filter.minSalary != null || filter.maxSalary != null) {
        final jobSalary = _parseSalary(job.salary);
        if (jobSalary != null) {
          if (filter.minSalary != null && jobSalary < filter.minSalary!) {
            passesFilter = false;
          }
          if (filter.maxSalary != null && 
              filter.maxSalary! != double.infinity && 
              jobSalary > filter.maxSalary!) {
            passesFilter = false;
          }
        }
      }

      // Date filter
      if (filter.maxDaysAgo != null) {
        final daysDifference = DateTime.now().difference(job.postedDate).inDays;
        passesFilter = passesFilter && daysDifference <= filter.maxDaysAgo!;
      }

      return passesFilter;
    }).toList();
  }

  static double? _parseSalary(String salaryString) {
    // Remove common prefixes and suffixes
    String cleaned = salaryString
        .toLowerCase()
        .replaceAll('rp', '')
        .replaceAll('rupiah', '')
        .replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll(' ', '');

    // Handle ranges (take the minimum value)
    if (cleaned.contains('-')) {
      final parts = cleaned.split('-');
      if (parts.isNotEmpty) {
        cleaned = parts[0];
      }
    }

    // Handle 'juta' and 'ribu' suffixes
    if (cleaned.contains('juta')) {
      cleaned = cleaned.replaceAll('juta', '');
      final value = double.tryParse(cleaned);
      return value != null ? value * 1000000 : null;
    } else if (cleaned.contains('ribu')) {
      cleaned = cleaned.replaceAll('ribu', '');
      final value = double.tryParse(cleaned);
      return value != null ? value * 1000 : null;
    }

    // Try to parse as regular number
    return double.tryParse(cleaned);
  }

  static List<Job> sortJobs(List<Job> jobs, JobSortOption sortOption) {
    final sortedJobs = List<Job>.from(jobs);

    switch (sortOption) {
      case JobSortOption.newest:
        sortedJobs.sort((a, b) => b.postedDate.compareTo(a.postedDate));
        break;
      case JobSortOption.oldest:
        sortedJobs.sort((a, b) => a.postedDate.compareTo(b.postedDate));
        break;
      case JobSortOption.salaryHigh:
        sortedJobs.sort((a, b) {
          final salaryA = _parseSalary(a.salary) ?? 0;
          final salaryB = _parseSalary(b.salary) ?? 0;
          return salaryB.compareTo(salaryA);
        });
        break;
      case JobSortOption.salaryLow:
        sortedJobs.sort((a, b) {
          final salaryA = _parseSalary(a.salary) ?? 0;
          final salaryB = _parseSalary(b.salary) ?? 0;
          return salaryA.compareTo(salaryB);
        });
        break;
      case JobSortOption.company:
        sortedJobs.sort((a, b) => a.company.compareTo(b.company));
        break;
    }

    return sortedJobs;
  }

  static String getFilterSummary(JobFilter filter) {
    List<String> summary = [];

    if (filter.categories.isNotEmpty) {
      summary.add('${filter.categories.length} kategori');
    }

    if (filter.locations.isNotEmpty) {
      summary.add('${filter.locations.length} lokasi');
    }

    if (filter.jobTypes.isNotEmpty) {
      summary.add('${filter.jobTypes.length} tipe');
    }

    if (filter.minSalary != null || filter.maxSalary != null) {
      summary.add('Gaji');
    }

    if (filter.maxDaysAgo != null) {
      summary.add('Tanggal');
    }

    return summary.join(', ');
  }
}

enum JobSortOption {
  newest,
  oldest,
  salaryHigh,
  salaryLow,
  company,
}

extension JobSortOptionExtension on JobSortOption {
  String get displayName {
    switch (this) {
      case JobSortOption.newest:
        return 'Terbaru';
      case JobSortOption.oldest:
        return 'Terlama';
      case JobSortOption.salaryHigh:
        return 'Gaji Tertinggi';
      case JobSortOption.salaryLow:
        return 'Gaji Terendah';
      case JobSortOption.company:
        return 'Perusahaan A-Z';
    }
  }
}