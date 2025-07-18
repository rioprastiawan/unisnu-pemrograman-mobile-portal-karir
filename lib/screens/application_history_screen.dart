import 'package:flutter/material.dart';
import '../models/job_application.dart';
import '../services/application_service.dart';
import '../widgets/application_card.dart';

class ApplicationHistoryScreen extends StatefulWidget {
  const ApplicationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationHistoryScreen> createState() => _ApplicationHistoryScreenState();
}

class _ApplicationHistoryScreenState extends State<ApplicationHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<JobApplication> _applications = [];
  ApplicationStatistics? _statistics;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _loadApplications();
  }

  Future<void> _loadApplications() async {
    setState(() => _isLoading = true);
    
    try {
      final applications = await ApplicationService.getAllApplications();
      final statistics = await ApplicationService.getApplicationStatistics();
      
      setState(() {
        _applications = applications;
        _statistics = statistics;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading applications: ${e.toString()}')),
      );
    }
  }

  List<JobApplication> _getApplicationsByStatus(ApplicationStatus? status) {
    if (status == null) return _applications;
    return _applications.where((app) => app.currentStatus == status).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Lamaran'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(text: 'Semua (${_applications.length})'),
            Tab(text: 'Terkirim (${_getApplicationsByStatus(ApplicationStatus.submitted).length})'),
            Tab(text: 'Ditinjau (${_getApplicationsByStatus(ApplicationStatus.reviewed).length})'),
            Tab(text: 'Interview (${_getApplicationsByStatus(ApplicationStatus.interviewing).length})'),
            Tab(text: 'Diterima (${_getApplicationsByStatus(ApplicationStatus.accepted).length})'),
            Tab(text: 'Ditolak (${_getApplicationsByStatus(ApplicationStatus.rejected).length})'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (_statistics != null) _buildStatisticsCard(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildApplicationsList(_applications),
                      _buildApplicationsList(_getApplicationsByStatus(ApplicationStatus.submitted)),
                      _buildApplicationsList(_getApplicationsByStatus(ApplicationStatus.reviewed)),
                      _buildApplicationsList(_getApplicationsByStatus(ApplicationStatus.interviewing)),
                      _buildApplicationsList(_getApplicationsByStatus(ApplicationStatus.accepted)),
                      _buildApplicationsList(_getApplicationsByStatus(ApplicationStatus.rejected)),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatisticsCard() {
    final stats = _statistics!;
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistik Lamaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Total', stats.totalApplications, Colors.blue),
              _buildStatItem('Diterima', stats.acceptedApplications, Colors.green),
              _buildStatItem('Ditolak', stats.rejectedApplications, Colors.red),
              _buildStatItem('Pending', stats.pendingApplications, Colors.orange),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.trending_up, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              Text(
                'Success Rate: ${stats.successRate.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationsList(List<JobApplication> applications) {
    if (applications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada lamaran',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadApplications,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];
          return ApplicationCard(
            application: application,
            onTap: () => _showApplicationDetails(application),
            onDelete: () => _deleteApplication(application),
          );
        },
      ),
    );
  }

  void _showApplicationDetails(JobApplication application) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ApplicationDetailSheet(application: application),
    );
  }

  Future<void> _deleteApplication(JobApplication application) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Lamaran'),
        content: Text('Apakah Anda yakin ingin menghapus lamaran untuk ${application.jobTitle}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await ApplicationService.deleteApplication(application.id);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lamaran berhasil dihapus')),
        );
        _loadApplications();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal menghapus lamaran')),
        );
      }
    }
  }
}

class ApplicationDetailSheet extends StatelessWidget {
  final JobApplication application;

  const ApplicationDetailSheet({
    Key? key,
    required this.application,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Job Information
                Text(
                  application.jobTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  application.companyName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Status
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: application.currentStatus.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: application.currentStatus.color),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        application.currentStatus.icon,
                        size: 16,
                        color: application.currentStatus.color,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        application.currentStatus.displayName,
                        style: TextStyle(
                          color: application.currentStatus.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Application Info
                _buildInfoSection('Informasi Lamaran', [
                  _buildInfoItem('Tanggal Lamar', _formatDate(application.appliedDate)),
                  _buildInfoItem('Kategori', application.categoryName),
                  _buildInfoItem('Lokasi', application.location),
                  _buildInfoItem('Gaji', application.salary),
                ]),
                
                // Personal Info
                _buildInfoSection('Informasi Personal', [
                  _buildInfoItem('Nama', application.applicantName),
                  _buildInfoItem('Email', application.email),
                  _buildInfoItem('Telepon', application.phone),
                  _buildInfoItem('Alamat', application.address),
                  _buildInfoItem('Pendidikan', application.education),
                ]),
                
                // Cover Letter
                _buildInfoSection('Surat Lamaran', [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Text(
                      application.coverLetter,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
                ]),
                
                // Resume
                if (application.resumeFileName != null)
                  _buildInfoSection('Resume', [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.description, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                            application.resumeFileName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
                
                // Status History
                _buildStatusHistory(),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Riwayat Status',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...application.statusHistory.map((history) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                history.status.icon,
                size: 20,
                color: history.status.color,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      history.status.displayName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: history.status.color,
                      ),
                    ),
                    if (history.note.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        history.note,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(history.timestamp),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}