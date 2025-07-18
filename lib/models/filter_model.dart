class JobFilter {
  final List<String> locations;
  final List<String> jobTypes;
  final List<String> categories;
  final double? minSalary;
  final double? maxSalary;
  final int? maxDaysAgo;

  JobFilter({
    this.locations = const [],
    this.jobTypes = const [],
    this.categories = const [],
    this.minSalary,
    this.maxSalary,
    this.maxDaysAgo,
  });

  bool get isEmpty =>
      locations.isEmpty &&
      jobTypes.isEmpty &&
      categories.isEmpty &&
      minSalary == null &&
      maxSalary == null &&
      maxDaysAgo == null;

  int get activeFilterCount {
    int count = 0;
    if (locations.isNotEmpty) count++;
    if (jobTypes.isNotEmpty) count++;
    if (categories.isNotEmpty) count++;
    if (minSalary != null || maxSalary != null) count++;
    if (maxDaysAgo != null) count++;
    return count;
  }

  JobFilter copyWith({
    List<String>? locations,
    List<String>? jobTypes,
    List<String>? categories,
    double? minSalary,
    double? maxSalary,
    int? maxDaysAgo,
    bool clearSalary = false,
    bool clearDaysAgo = false,
    bool clearCategories = false,
  }) {
    return JobFilter(
      locations: locations ?? this.locations,
      jobTypes: jobTypes ?? this.jobTypes,
      categories: clearCategories ? [] : (categories ?? this.categories),
      minSalary: clearSalary ? null : (minSalary ?? this.minSalary),
      maxSalary: clearSalary ? null : (maxSalary ?? this.maxSalary),
      maxDaysAgo: clearDaysAgo ? null : (maxDaysAgo ?? this.maxDaysAgo),
    );
  }

  static JobFilter empty() => JobFilter();

  Map<String, dynamic> toJson() {
    return {
      'locations': locations,
      'jobTypes': jobTypes,
      'categories': categories,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
      'maxDaysAgo': maxDaysAgo,
    };
  }

  factory JobFilter.fromJson(Map<String, dynamic> json) {
    return JobFilter(
      locations: List<String>.from(json['locations'] ?? []),
      jobTypes: List<String>.from(json['jobTypes'] ?? []),
      categories: List<String>.from(json['categories'] ?? []),
      minSalary: json['minSalary']?.toDouble(),
      maxSalary: json['maxSalary']?.toDouble(),
      maxDaysAgo: json['maxDaysAgo'],
    );
  }
}

class FilterOptions {
  static const List<String> locations = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Medan',
    'Semarang',
    'Makassar',
    'Palembang',
    'Yogyakarta',
    'Remote',
  ];

  static const List<String> jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Freelance',
    'Internship',
  ];

  static const List<Map<String, dynamic>> salaryRanges = [
    {'label': '< 5 Juta', 'min': 0.0, 'max': 5000000.0},
    {'label': '5 - 10 Juta', 'min': 5000000.0, 'max': 10000000.0},
    {'label': '10 - 15 Juta', 'min': 10000000.0, 'max': 15000000.0},
    {'label': '15 - 20 Juta', 'min': 15000000.0, 'max': 20000000.0},
    {'label': '> 20 Juta', 'min': 20000000.0, 'max': double.infinity},
  ];

  static const List<Map<String, dynamic>> dateRanges = [
    {'label': 'Hari ini', 'days': 1},
    {'label': '3 hari terakhir', 'days': 3},
    {'label': '1 minggu terakhir', 'days': 7},
    {'label': '2 minggu terakhir', 'days': 14},
    {'label': '1 bulan terakhir', 'days': 30},
  ];
}