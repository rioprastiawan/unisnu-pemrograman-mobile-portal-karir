import 'package:flutter/material.dart';
import '../models/job.dart';
import '../services/bookmark_service.dart';
import '../widgets/job_card.dart';
import 'job_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Job> bookmarkedJobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBookmarkedJobs();
  }

  Future<void> loadBookmarkedJobs() async {
    setState(() {
      isLoading = true;
    });

    try {
      final jobs = await BookmarkService.getBookmarkedJobs();
      setState(() {
        bookmarkedJobs = jobs;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading bookmarked jobs')),
        );
      }
    }
  }

  void navigateToJobDetail(Job job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailScreen(jobId: job.id),
      ),
    ).then((_) {
      loadBookmarkedJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Favorit',
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : bookmarkedJobs.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Belum ada job favorit',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tambahkan job ke favorit untuk melihatnya di sini',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: loadBookmarkedJobs,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: bookmarkedJobs.length,
                    itemBuilder: (context, index) {
                      final job = bookmarkedJobs[index];
                      return JobCard(
                        job: job,
                        onTap: () => navigateToJobDetail(job),
                      );
                    },
                  ),
                ),
    );
  }
}