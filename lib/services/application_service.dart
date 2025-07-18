import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/job_application.dart';
import '../models/job.dart';

class ApplicationService {
  static const String _applicationsKey = 'job_applications';
  static const String _userProfileKey = 'user_profile';
  static const String _applicationCountKey = 'application_count';

  /// Get all applications
  static Future<List<JobApplication>> getAllApplications() async {
    final prefs = await SharedPreferences.getInstance();
    final applicationsJson = prefs.getString(_applicationsKey);
    
    if (applicationsJson == null) return [];
    
    final applicationsList = jsonDecode(applicationsJson) as List<dynamic>;
    return applicationsList
        .map((json) => JobApplication.fromJson(json))
        .toList()
        ..sort((a, b) => b.appliedDate.compareTo(a.appliedDate));
  }

  /// Save application
  static Future<bool> saveApplication(JobApplication application) async {
    try {
      final applications = await getAllApplications();
      
      // Check if already applied to this job
      final existingIndex = applications.indexWhere((app) => app.jobId == application.jobId);
      
      if (existingIndex != -1) {
        // Update existing application
        applications[existingIndex] = application;
      } else {
        // Add new application
        applications.add(application);
      }
      
      await _saveApplicationsList(applications);
      await _incrementApplicationCount();
      
      // Simulate status progression for demo
      _scheduleStatusUpdate(application.id);
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get application by ID
  static Future<JobApplication?> getApplicationById(String id) async {
    final applications = await getAllApplications();
    try {
      return applications.firstWhere((app) => app.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get applications by job ID
  static Future<JobApplication?> getApplicationByJobId(int jobId) async {
    final applications = await getAllApplications();
    try {
      return applications.firstWhere((app) => app.jobId == jobId);
    } catch (e) {
      return null;
    }
  }

  /// Check if user has applied to a job
  static Future<bool> hasAppliedToJob(int jobId) async {
    final application = await getApplicationByJobId(jobId);
    return application != null;
  }

  /// Delete application
  static Future<bool> deleteApplication(String id) async {
    try {
      final applications = await getAllApplications();
      applications.removeWhere((app) => app.id == id);
      await _saveApplicationsList(applications);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Update application status
  static Future<bool> updateApplicationStatus(String id, ApplicationStatus newStatus, {String note = ''}) async {
    try {
      final applications = await getAllApplications();
      final index = applications.indexWhere((app) => app.id == id);
      
      if (index == -1) return false;
      
      final application = applications[index];
      final newStatusHistory = List<ApplicationStatusHistory>.from(application.statusHistory);
      
      // Add new status to history
      newStatusHistory.add(ApplicationStatusHistory(
        status: newStatus,
        timestamp: DateTime.now(),
        note: note,
      ));
      
      // Update application
      applications[index] = application.copyWith(
        currentStatus: newStatus,
        statusHistory: newStatusHistory,
      );
      
      await _saveApplicationsList(applications);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get applications by status
  static Future<List<JobApplication>> getApplicationsByStatus(ApplicationStatus status) async {
    final applications = await getAllApplications();
    return applications.where((app) => app.currentStatus == status).toList();
  }

  /// Get applications by company
  static Future<List<JobApplication>> getApplicationsByCompany(String companyName) async {
    final applications = await getAllApplications();
    return applications.where((app) => app.companyName == companyName).toList();
  }

  /// Get application statistics
  static Future<ApplicationStatistics> getApplicationStatistics() async {
    final applications = await getAllApplications();
    return ApplicationStatistics.fromApplications(applications);
  }

  /// Save user profile
  static Future<bool> saveUserProfile(Map<String, String> profile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userProfileKey, jsonEncode(profile));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get user profile
  static Future<Map<String, String>> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = prefs.getString(_userProfileKey);
    
    if (profileJson == null) {
      return {
        'name': '',
        'email': '',
        'phone': '',
        'address': '',
        'education': '',
        'experience': '',
      };
    }
    
    final profile = jsonDecode(profileJson) as Map<String, dynamic>;
    return profile.map((key, value) => MapEntry(key, value.toString()));
  }

  /// Generate unique application ID
  static String generateApplicationId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(9999);
    return 'app_${timestamp}_$random';
  }

  /// Create application from job
  static Future<JobApplication> createApplicationFromJob(Job job, Map<String, String> personalInfo, String coverLetter, {String? resumePath, String? resumeFileName}) async {
    final id = generateApplicationId();
    final now = DateTime.now();
    
    final initialStatus = ApplicationStatusHistory(
      status: ApplicationStatus.submitted,
      timestamp: now,
      note: 'Lamaran berhasil dikirim',
    );
    
    return JobApplication(
      id: id,
      jobId: job.id,
      jobTitle: job.title,
      companyName: job.company,
      categoryName: job.categoryName,
      location: job.location,
      salary: job.salary,
      applicantName: personalInfo['name'] ?? '',
      email: personalInfo['email'] ?? '',
      phone: personalInfo['phone'] ?? '',
      address: personalInfo['address'] ?? '',
      education: personalInfo['education'] ?? '',
      experience: personalInfo['experience'] ?? '',
      coverLetter: coverLetter,
      resumePath: resumePath,
      resumeFileName: resumeFileName,
      appliedDate: now,
      currentStatus: ApplicationStatus.submitted,
      statusHistory: [initialStatus],
    );
  }

  /// Save resume file (demo version)
  static Future<String?> saveResumeFile(String sourcePath, String applicationId) async {
    try {
      final directory = await getApplicationDirectory();
      final fileName = 'resume_${applicationId}_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final destinationPath = '${directory.path}/$fileName';
      
      // In real implementation, copy the actual file
      // await file.copy(destinationPath);
      
      return destinationPath;
    } catch (e) {
      return null;
    }
  }

  /// Get application directory
  static Future<Directory> getApplicationDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final applicationDir = Directory('${appDir.path}/applications');
    
    if (!await applicationDir.exists()) {
      await applicationDir.create(recursive: true);
    }
    
    return applicationDir;
  }

  /// Get total application count
  static Future<int> getTotalApplicationCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_applicationCountKey) ?? 0;
  }

  /// Private helper methods
  static Future<void> _saveApplicationsList(List<JobApplication> applications) async {
    final prefs = await SharedPreferences.getInstance();
    final applicationsJson = jsonEncode(applications.map((app) => app.toJson()).toList());
    await prefs.setString(_applicationsKey, applicationsJson);
  }

  static Future<void> _incrementApplicationCount() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_applicationCountKey) ?? 0;
    await prefs.setInt(_applicationCountKey, currentCount + 1);
  }

  /// Simulate status progression for demo purposes
  static void _scheduleStatusUpdate(String applicationId) {
    // Simulate realistic status progression
    Future.delayed(const Duration(hours: 24), () {
      // After 1 day, mark as reviewed
      updateApplicationStatus(applicationId, ApplicationStatus.reviewed, note: 'Lamaran Anda sedang ditinjau oleh tim HR');
    });
    
    Future.delayed(const Duration(days: 3), () {
      // After 3 days, random chance for interview or rejection
      final random = Random();
      if (random.nextDouble() < 0.7) { // 70% chance of interview
        updateApplicationStatus(applicationId, ApplicationStatus.interviewing, note: 'Anda dipanggil untuk interview');
      } else {
        updateApplicationStatus(applicationId, ApplicationStatus.rejected, note: 'Terima kasih atas lamaran Anda');
      }
    });
    
    Future.delayed(const Duration(days: 7), () async {
      // After 7 days, final decision for interviewing candidates
      final application = await getApplicationById(applicationId);
      if (application?.currentStatus == ApplicationStatus.interviewing) {
        final random = Random();
        if (random.nextDouble() < 0.4) { // 40% chance of acceptance
          updateApplicationStatus(applicationId, ApplicationStatus.accepted, note: 'Selamat! Anda diterima bekerja');
        } else {
          updateApplicationStatus(applicationId, ApplicationStatus.rejected, note: 'Maaf, Anda belum berhasil kali ini');
        }
      }
    });
  }

  /// Clear all applications (for testing/demo)
  static Future<void> clearAllApplications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_applicationsKey);
    await prefs.remove(_applicationCountKey);
  }

  /// Export applications to JSON
  static Future<String> exportApplicationsToJson() async {
    final applications = await getAllApplications();
    final statistics = await getApplicationStatistics();
    
    final exportData = {
      'exportDate': DateTime.now().toIso8601String(),
      'totalApplications': applications.length,
      'statistics': {
        'totalApplications': statistics.totalApplications,
        'acceptedApplications': statistics.acceptedApplications,
        'rejectedApplications': statistics.rejectedApplications,
        'pendingApplications': statistics.pendingApplications,
        'successRate': statistics.successRate,
      },
      'applications': applications.map((app) => app.toJson()).toList(),
    };
    
    return jsonEncode(exportData);
  }
}