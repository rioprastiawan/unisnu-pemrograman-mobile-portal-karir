import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/job.dart';
import 'job_service.dart';

class BookmarkService {
  static const String _bookmarksKey = 'bookmarked_jobs';
  
  static Future<List<int>> getBookmarkedJobIds() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarksJson = prefs.getString(_bookmarksKey);
    
    if (bookmarksJson == null) {
      return [];
    }
    
    final List<dynamic> bookmarksList = json.decode(bookmarksJson);
    return bookmarksList.cast<int>();
  }
  
  static Future<bool> isBookmarked(int jobId) async {
    final bookmarkedIds = await getBookmarkedJobIds();
    return bookmarkedIds.contains(jobId);
  }
  
  static Future<void> addBookmark(int jobId) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedIds = await getBookmarkedJobIds();
    
    if (!bookmarkedIds.contains(jobId)) {
      bookmarkedIds.add(jobId);
      await prefs.setString(_bookmarksKey, json.encode(bookmarkedIds));
    }
  }
  
  static Future<void> removeBookmark(int jobId) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedIds = await getBookmarkedJobIds();
    
    bookmarkedIds.remove(jobId);
    await prefs.setString(_bookmarksKey, json.encode(bookmarkedIds));
  }
  
  static Future<void> toggleBookmark(int jobId) async {
    final isCurrentlyBookmarked = await isBookmarked(jobId);
    
    if (isCurrentlyBookmarked) {
      await removeBookmark(jobId);
    } else {
      await addBookmark(jobId);
    }
  }
  
  static Future<List<Job>> getBookmarkedJobs() async {
    final bookmarkedIds = await getBookmarkedJobIds();
    final List<Job> bookmarkedJobs = [];
    
    for (final id in bookmarkedIds) {
      final job = await JobService.getJobById(id);
      if (job != null) {
        bookmarkedJobs.add(job);
      }
    }
    
    return bookmarkedJobs;
  }
}