class Job {
  final int id;
  final String title;
  final String company;
  final String location;
  final String type;
  final String salary;
  final String description;
  final List<String> requirements;
  final List<String> benefits;
  final DateTime postedDate;
  final String categoryId;
  final String categoryName;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.salary,
    required this.description,
    required this.requirements,
    required this.benefits,
    required this.postedDate,
    required this.categoryId,
    required this.categoryName,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      type: json['type'],
      salary: json['salary'],
      description: json['description'],
      requirements: List<String>.from(json['requirements']),
      benefits: List<String>.from(json['benefits']),
      postedDate: DateTime.parse(json['postedDate']),
      categoryId: json['categoryId'] ?? 'others',
      categoryName: json['categoryName'] ?? 'Others',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'type': type,
      'salary': salary,
      'description': description,
      'requirements': requirements,
      'benefits': benefits,
      'postedDate': postedDate.toIso8601String(),
      'categoryId': categoryId,
      'categoryName': categoryName,
    };
  }
}