import 'package:flutter/material.dart';
import '../models/job.dart';
import '../models/job_application.dart';
import '../services/application_service.dart';

class JobApplicationScreen extends StatefulWidget {
  final Job job;

  const JobApplicationScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  State<JobApplicationScreen> createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _coverLetterController = TextEditingController();
  
  String? _selectedFilePath;
  String? _selectedFileName;
  bool _isSubmitting = false;
  bool _hasApplied = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _checkApplicationStatus();
  }

  Future<void> _loadUserProfile() async {
    final profile = await ApplicationService.getUserProfile();
    setState(() {
      _nameController.text = profile['name'] ?? '';
      _emailController.text = profile['email'] ?? '';
      _phoneController.text = profile['phone'] ?? '';
      _addressController.text = profile['address'] ?? '';
      _educationController.text = profile['education'] ?? '';
      _experienceController.text = profile['experience'] ?? '';
    });
  }

  Future<void> _checkApplicationStatus() async {
    final hasApplied = await ApplicationService.hasAppliedToJob(widget.job.id);
    setState(() {
      _hasApplied = hasApplied;
    });
  }

  Future<void> _pickFile() async {
    // Simulasi file picker untuk demo
    // Dalam implementasi nyata, gunakan file_picker plugin
    setState(() {
      _selectedFileName = 'resume_example.pdf';
      _selectedFilePath = '/demo/path/resume_example.pdf';
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resume berhasil dipilih (simulasi)'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _submitApplication() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final personalInfo = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
        'education': _educationController.text,
        'experience': _experienceController.text,
      };

      // Save user profile for future use
      await ApplicationService.saveUserProfile(personalInfo);

      // Create application
      final application = await ApplicationService.createApplicationFromJob(
        widget.job,
        personalInfo,
        _coverLetterController.text,
        resumePath: _selectedFilePath,
        resumeFileName: _selectedFileName,
      );

      // Save resume file if selected
      if (_selectedFilePath != null) {
        final savedPath = await ApplicationService.saveResumeFile(
          _selectedFilePath!,
          application.id,
        );
        if (savedPath != null) {
          // Update application with saved resume path
          // This would be handled in a real implementation
        }
      }

      // Save application
      final success = await ApplicationService.saveApplication(application);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lamaran berhasil dikirim!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate back or to application status screen
        Navigator.pop(context, true);
      } else {
        throw Exception('Gagal menyimpan lamaran');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _coverLetterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lamar Pekerjaan'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _hasApplied ? _buildAlreadyAppliedView() : _buildApplicationForm(),
    );
  }

  Widget _buildAlreadyAppliedView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          const Text(
            'Anda sudah melamar untuk pekerjaan ini',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Cek status lamaran Anda di halaman riwayat',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Information Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.job.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.job.company,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          widget.job.location,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          widget.job.salary,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Personal Information Section
            const Text(
              'Informasi Personal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!value.contains('@')) {
                  return 'Email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor telepon tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Alamat tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Education & Experience Section
            const Text(
              'Pendidikan & Pengalaman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _educationController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Pendidikan Terakhir',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
                hintText: 'Contoh: S1 Teknik Informatika, Universitas XYZ',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pendidikan tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _experienceController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Pengalaman Kerja',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
                hintText: 'Deskripsikan pengalaman kerja Anda...',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pengalaman kerja tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Resume Upload Section
            const Text(
              'Upload Resume',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  if (_selectedFileName != null) ...[
                    Row(
                      children: [
                        const Icon(Icons.description, color: Colors.blue),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _selectedFileName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _selectedFileName = null;
                              _selectedFilePath = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ] else ...[
                    const Icon(Icons.upload_file, size: 48, color: Colors.grey),
                    const SizedBox(height: 8),
                    const Text(
                      'Pilih file resume Anda',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Format yang didukung: PDF, DOC, DOCX',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _pickFile,
                    icon: const Icon(Icons.upload),
                    label: Text(_selectedFileName != null ? 'Ganti File' : 'Pilih File'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Cover Letter Section
            const Text(
              'Surat Lamaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _coverLetterController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Surat Lamaran',
                border: OutlineInputBorder(),
                hintText: 'Tuliskan surat lamaran Anda...',
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Surat lamaran tidak boleh kosong';
                }
                if (value.length < 50) {
                  return 'Surat lamaran minimal 50 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitApplication,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Kirim Lamaran',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}