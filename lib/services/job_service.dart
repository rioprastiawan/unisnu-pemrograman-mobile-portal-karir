import '../models/job.dart';

class JobService {
  static final List<Job> _jobs = [
    Job(
      id: 1,
      title: "Software Engineer",
      company: "Tech Innovators",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Kami mencari Software Engineer yang berpengalaman untuk bergabung dengan tim pengembangan kami. Kandidat ideal memiliki pengalaman dalam pengembangan web modern dan passion untuk teknologi.",
      requirements: [
        "Minimal 2 tahun pengalaman sebagai Software Engineer",
        "Menguasai JavaScript, HTML, CSS",
        "Pengalaman dengan framework modern (React, Vue, atau Angular)",
        "Memahami database SQL dan NoSQL",
        "Kemampuan bekerja dalam tim"
      ],
      benefits: [
        "Gaji kompetitif",
        "Asuransi kesehatan",
        "Flexible working hours",
        "Training dan sertifikasi",
        "Bonus tahunan"
      ],
      postedDate: DateTime(2024, 1, 15),
    ),
    Job(
      id: 2,
      title: "UI/UX Designer",
      company: "Creative Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 8.000.000 - 12.000.000",
      description: "Posisi UI/UX Designer untuk merancang interface yang user-friendly dan menarik. Kandidat harus memiliki mata yang tajam untuk detail dan memahami prinsip-prinsip desain yang baik.",
      requirements: [
        "Minimal 1-2 tahun pengalaman di bidang UI/UX",
        "Menguasai tools desain (Figma, Adobe XD, Sketch)",
        "Memahami prinsip User Experience dan User Interface",
        "Portfolio yang menunjukkan kemampuan desain",
        "Kemampuan komunikasi yang baik"
      ],
      benefits: [
        "Lingkungan kerja kreatif",
        "Pelatihan desain reguler",
        "Akses ke software premium",
        "Team building activities",
        "Work from home flexibility"
      ],
      postedDate: DateTime(2024, 1, 10),
    ),
    Job(
      id: 3,
      title: "Digital Marketing Specialist",
      company: "Marketing Pro",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 6.000.000 - 10.000.000",
      description: "Kami membutuhkan Digital Marketing Specialist yang kreatif dan berpengalaman dalam mengelola kampanye digital. Posisi ini ideal untuk seseorang yang passionate tentang digital marketing dan analytics.",
      requirements: [
        "Minimal 1 tahun pengalaman digital marketing",
        "Menguasai Google Ads, Facebook Ads, Instagram Ads",
        "Pemahaman SEO dan SEM",
        "Kemampuan analisis data marketing",
        "Kreatif dan up-to-date dengan tren digital"
      ],
      benefits: [
        "Bonus performance",
        "Training digital marketing",
        "Kesempatan menghadiri seminar/workshop",
        "Fasilitas internet unlimited",
        "Cuti tahunan 12 hari"
      ],
      postedDate: DateTime(2024, 1, 8),
    ),
    Job(
      id: 4,
      title: "Data Analyst",
      company: "Data Insights Corp",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 15.000.000",
      description: "Posisi Data Analyst untuk menganalisis data bisnis dan memberikan insights yang actionable. Kandidat harus memiliki kemampuan analitis yang kuat dan pengalaman dengan tools analisis data.",
      requirements: [
        "Minimal 2 tahun pengalaman sebagai Data Analyst",
        "Menguasai SQL, Python, atau R",
        "Pengalaman dengan tools visualisasi (Tableau, Power BI)",
        "Pemahaman statistik dan machine learning dasar",
        "Kemampuan presentasi yang baik"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Akses ke tools analisis premium",
        "Training data science",
        "Kesempatan sertifikasi internasional",
        "Flexible working arrangement"
      ],
      postedDate: DateTime(2024, 1, 12),
    ),
    Job(
      id: 5,
      title: "Product Manager",
      company: "Startup Innovate",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Kami mencari Product Manager yang berpengalaman untuk memimpin pengembangan produk digital. Posisi ini membutuhkan seseorang yang dapat bekerja lintas tim dan memiliki visi produk yang kuat.",
      requirements: [
        "Minimal 3 tahun pengalaman sebagai Product Manager",
        "Pengalaman dengan metodologi Agile/Scrum",
        "Kemampuan analisis dan problem solving",
        "Leadership dan communication skills yang excellent",
        "Pengalaman dengan product analytics tools"
      ],
      benefits: [
        "Equity/saham perusahaan",
        "Gaji dan bonus yang sangat kompetitif",
        "Budget untuk conference dan training",
        "Laptop dan equipment premium",
        "Unlimited vacation policy"
      ],
      postedDate: DateTime(2024, 1, 5),
    ),
  ];

  static Future<List<Job>> getAllJobs() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _jobs;
  }

  static Future<Job?> getJobById(int id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _jobs.firstWhere((job) => job.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Job>> searchJobs(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (query.trim().isEmpty) {
      return _jobs;
    }
    
    final lowercaseQuery = query.toLowerCase();
    return _jobs.where((job) =>
      job.title.toLowerCase().contains(lowercaseQuery) ||
      job.company.toLowerCase().contains(lowercaseQuery) ||
      job.location.toLowerCase().contains(lowercaseQuery) ||
      job.description.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  static Future<List<Job>> getJobsByLocation(String location) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _jobs.where((job) => 
      job.location.toLowerCase().contains(location.toLowerCase())
    ).toList();
  }

  static Future<List<Job>> getJobsByType(String type) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _jobs.where((job) => 
      job.type.toLowerCase().contains(type.toLowerCase())
    ).toList();
  }
}