import 'package:flutter/material.dart';

enum ApplicationStatus {
  submitted,
  reviewed,
  interviewing,
  accepted,
  rejected,
  withdrawn
}

extension ApplicationStatusExtension on ApplicationStatus {
  String get displayName {
    switch (this) {
      case ApplicationStatus.submitted:
        return 'Terkirim';
      case ApplicationStatus.reviewed:
        return 'Sedang Ditinjau';
      case ApplicationStatus.interviewing:
        return 'Tahap Interview';
      case ApplicationStatus.accepted:
        return 'Diterima';
      case ApplicationStatus.rejected:
        return 'Ditolak';
      case ApplicationStatus.withdrawn:
        return 'Dibatalkan';
    }
  }

  String get description {
    switch (this) {
      case ApplicationStatus.submitted:
        return 'Lamaran Anda telah berhasil dikirim';
      case ApplicationStatus.reviewed:
        return 'HR sedang meninjau lamaran Anda';
      case ApplicationStatus.interviewing:
        return 'Anda dipanggil untuk interview';
      case ApplicationStatus.accepted:
        return 'Selamat! Lamaran Anda diterima';
      case ApplicationStatus.rejected:
        return 'Maaf, lamaran Anda belum berhasil kali ini';
      case ApplicationStatus.withdrawn:
        return 'Lamaran dibatalkan oleh pelamar';
    }
  }

  Color get color {
    switch (this) {
      case ApplicationStatus.submitted:
        return Colors.blue;
      case ApplicationStatus.reviewed:
        return Colors.orange;
      case ApplicationStatus.interviewing:
        return Colors.purple;
      case ApplicationStatus.accepted:
        return Colors.green;
      case ApplicationStatus.rejected:
        return Colors.red;
      case ApplicationStatus.withdrawn:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (this) {
      case ApplicationStatus.submitted:
        return Icons.send;
      case ApplicationStatus.reviewed:
        return Icons.visibility;
      case ApplicationStatus.interviewing:
        return Icons.video_call;
      case ApplicationStatus.accepted:
        return Icons.check_circle;
      case ApplicationStatus.rejected:
        return Icons.cancel;
      case ApplicationStatus.withdrawn:
        return Icons.remove_circle;
    }
  }
}

class ApplicationStatusHistory {
  final ApplicationStatus status;
  final DateTime timestamp;
  final String note;

  ApplicationStatusHistory({
    required this.status,
    required this.timestamp,
    this.note = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'timestamp': timestamp.toIso8601String(),
      'note': note,
    };
  }

  factory ApplicationStatusHistory.fromJson(Map<String, dynamic> json) {
    return ApplicationStatusHistory(
      status: ApplicationStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ApplicationStatus.submitted,
      ),
      timestamp: DateTime.parse(json['timestamp']),
      note: json['note'] ?? '',
    );
  }
}

class JobApplication {
  final String id;
  final int jobId;
  final String jobTitle;
  final String companyName;
  final String categoryName;
  final String location;
  final String salary;
  
  // Personal Information
  final String applicantName;
  final String email;
  final String phone;
  final String address;
  final String education;
  final String experience;
  
  // Application Details
  final String coverLetter;
  final String? resumePath;
  final String? resumeFileName;
  final DateTime appliedDate;
  final ApplicationStatus currentStatus;
  final List<ApplicationStatusHistory> statusHistory;
  
  // Additional Info
  final String? notes;
  final DateTime? interviewDate;
  final String? interviewType;
  final String? interviewNotes;

  JobApplication({
    required this.id,
    required this.jobId,
    required this.jobTitle,
    required this.companyName,
    required this.categoryName,
    required this.location,
    required this.salary,
    required this.applicantName,
    required this.email,
    required this.phone,
    required this.address,
    required this.education,
    required this.experience,
    required this.coverLetter,
    this.resumePath,
    this.resumeFileName,
    required this.appliedDate,
    required this.currentStatus,
    required this.statusHistory,
    this.notes,
    this.interviewDate,
    this.interviewType,
    this.interviewNotes,
  });

  JobApplication copyWith({
    String? id,
    int? jobId,
    String? jobTitle,
    String? companyName,
    String? categoryName,
    String? location,
    String? salary,
    String? applicantName,
    String? email,
    String? phone,
    String? address,
    String? education,
    String? experience,
    String? coverLetter,
    String? resumePath,
    String? resumeFileName,
    DateTime? appliedDate,
    ApplicationStatus? currentStatus,
    List<ApplicationStatusHistory>? statusHistory,
    String? notes,
    DateTime? interviewDate,
    String? interviewType,
    String? interviewNotes,
  }) {
    return JobApplication(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      categoryName: categoryName ?? this.categoryName,
      location: location ?? this.location,
      salary: salary ?? this.salary,
      applicantName: applicantName ?? this.applicantName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      coverLetter: coverLetter ?? this.coverLetter,
      resumePath: resumePath ?? this.resumePath,
      resumeFileName: resumeFileName ?? this.resumeFileName,
      appliedDate: appliedDate ?? this.appliedDate,
      currentStatus: currentStatus ?? this.currentStatus,
      statusHistory: statusHistory ?? this.statusHistory,
      notes: notes ?? this.notes,
      interviewDate: interviewDate ?? this.interviewDate,
      interviewType: interviewType ?? this.interviewType,
      interviewNotes: interviewNotes ?? this.interviewNotes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'jobTitle': jobTitle,
      'companyName': companyName,
      'categoryName': categoryName,
      'location': location,
      'salary': salary,
      'applicantName': applicantName,
      'email': email,
      'phone': phone,
      'address': address,
      'education': education,
      'experience': experience,
      'coverLetter': coverLetter,
      'resumePath': resumePath,
      'resumeFileName': resumeFileName,
      'appliedDate': appliedDate.toIso8601String(),
      'currentStatus': currentStatus.name,
      'statusHistory': statusHistory.map((h) => h.toJson()).toList(),
      'notes': notes,
      'interviewDate': interviewDate?.toIso8601String(),
      'interviewType': interviewType,
      'interviewNotes': interviewNotes,
    };
  }

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      id: json['id'],
      jobId: json['jobId'],
      jobTitle: json['jobTitle'],
      companyName: json['companyName'],
      categoryName: json['categoryName'],
      location: json['location'],
      salary: json['salary'],
      applicantName: json['applicantName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      education: json['education'],
      experience: json['experience'],
      coverLetter: json['coverLetter'],
      resumePath: json['resumePath'],
      resumeFileName: json['resumeFileName'],
      appliedDate: DateTime.parse(json['appliedDate']),
      currentStatus: ApplicationStatus.values.firstWhere(
        (e) => e.name == json['currentStatus'],
        orElse: () => ApplicationStatus.submitted,
      ),
      statusHistory: (json['statusHistory'] as List<dynamic>?)
          ?.map((h) => ApplicationStatusHistory.fromJson(h))
          .toList() ?? [],
      notes: json['notes'],
      interviewDate: json['interviewDate'] != null 
          ? DateTime.parse(json['interviewDate'])
          : null,
      interviewType: json['interviewType'],
      interviewNotes: json['interviewNotes'],
    );
  }

  // Helper methods
  bool get hasInterview => interviewDate != null;
  
  bool get isActive => currentStatus != ApplicationStatus.rejected && 
                      currentStatus != ApplicationStatus.withdrawn;
  
  int get daysSinceApplied => DateTime.now().difference(appliedDate).inDays;
  
  String get statusTimeline {
    if (statusHistory.isEmpty) return '';
    
    final latest = statusHistory.last;
    final days = DateTime.now().difference(latest.timestamp).inDays;
    
    if (days == 0) return 'Hari ini';
    if (days == 1) return '1 hari yang lalu';
    return '$days hari yang lalu';
  }
}

class ApplicationStatistics {
  final int totalApplications;
  final int acceptedApplications;
  final int rejectedApplications;
  final int pendingApplications;
  final int interviewingApplications;
  final Map<String, int> applicationsByCompany;
  final Map<String, int> applicationsByCategory;
  final Map<ApplicationStatus, int> applicationsByStatus;
  final double successRate;

  ApplicationStatistics({
    required this.totalApplications,
    required this.acceptedApplications,
    required this.rejectedApplications,
    required this.pendingApplications,
    required this.interviewingApplications,
    required this.applicationsByCompany,
    required this.applicationsByCategory,
    required this.applicationsByStatus,
    required this.successRate,
  });

  factory ApplicationStatistics.fromApplications(List<JobApplication> applications) {
    final total = applications.length;
    final accepted = applications.where((a) => a.currentStatus == ApplicationStatus.accepted).length;
    final rejected = applications.where((a) => a.currentStatus == ApplicationStatus.rejected).length;
    final pending = applications.where((a) => a.currentStatus == ApplicationStatus.submitted || 
                                              a.currentStatus == ApplicationStatus.reviewed).length;
    final interviewing = applications.where((a) => a.currentStatus == ApplicationStatus.interviewing).length;
    
    final byCompany = <String, int>{};
    final byCategory = <String, int>{};
    final byStatus = <ApplicationStatus, int>{};
    
    for (final app in applications) {
      byCompany[app.companyName] = (byCompany[app.companyName] ?? 0) + 1;
      byCategory[app.categoryName] = (byCategory[app.categoryName] ?? 0) + 1;
      byStatus[app.currentStatus] = (byStatus[app.currentStatus] ?? 0) + 1;
    }
    
    final successRate = total > 0 ? (accepted / total) * 100 : 0.0;
    
    return ApplicationStatistics(
      totalApplications: total,
      acceptedApplications: accepted,
      rejectedApplications: rejected,
      pendingApplications: pending,
      interviewingApplications: interviewing,
      applicationsByCompany: byCompany,
      applicationsByCategory: byCategory,
      applicationsByStatus: byStatus,
      successRate: successRate,
    );
  }
}