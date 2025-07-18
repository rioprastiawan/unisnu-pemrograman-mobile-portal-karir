import '../models/job.dart';

class JobService {
  static final List<Job> _jobs = [
    // Technology & IT Jobs
    Job(
      id: 1,
      title: "Senior Software Engineer",
      company: "Tech Innovators",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Kami mencari Senior Software Engineer yang berpengalaman untuk memimpin tim pengembangan aplikasi web modern. Kandidat ideal memiliki pengalaman dalam arsitektur software dan mentoring junior developers.",
      requirements: [
        "Minimal 4 tahun pengalaman sebagai Software Engineer",
        "Menguasai JavaScript, TypeScript, Node.js, React",
        "Pengalaman dengan cloud services (AWS, GCP, Azure)",
        "Memahami microservices architecture",
        "Leadership dan mentoring skills",
        "Pengalaman dengan CI/CD pipelines"
      ],
      benefits: [
        "Gaji kompetitif dengan equity",
        "Asuransi kesehatan premium",
        "Flexible working hours",
        "Budget training dan conference",
        "Laptop MacBook Pro",
        "Bonus tahunan hingga 3x gaji"
      ],
      postedDate: DateTime(2024, 1, 15),
      categoryId: 'technology',
      categoryName: 'Teknologi & IT',
    ),
    Job(
      id: 2,
      title: "Full Stack Developer",
      company: "Digital Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Posisi Full Stack Developer untuk mengembangkan aplikasi web end-to-end. Kandidat harus memiliki pengalaman dengan frontend dan backend development.",
      requirements: [
        "Minimal 2-3 tahun pengalaman full stack development",
        "Menguasai React, Node.js, MongoDB/PostgreSQL",
        "Pengalaman dengan RESTful APIs dan GraphQL",
        "Pemahaman Git dan version control",
        "Kemampuan problem solving yang baik"
      ],
      benefits: [
        "Gaji kompetitif",
        "Work from home hybrid",
        "Training dan sertifikasi",
        "Team building activities",
        "Asuransi kesehatan",
        "Cuti tahunan 12 hari"
      ],
      postedDate: DateTime(2024, 1, 12),
      categoryId: 'technology',
      categoryName: 'Teknologi & IT',
    ),
    Job(
      id: 3,
      title: "Backend Developer",
      company: "Fintech Pioneer",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 13.000.000 - 20.000.000",
      description: "Backend Developer untuk mengembangkan sistem backend yang scalable dan secure untuk aplikasi fintech. Fokus pada performance optimization dan security.",
      requirements: [
        "Minimal 3 tahun pengalaman backend development",
        "Menguasai Java/Python/Go, Spring Boot/Django/Gin",
        "Pengalaman dengan database design dan optimization",
        "Pemahaman security best practices",
        "Pengalaman dengan message queues (RabbitMQ, Kafka)"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Stock options",
        "Asuransi kesehatan dan jiwa",
        "Flexible working arrangement",
        "Budget untuk course dan certification"
      ],
      postedDate: DateTime(2024, 1, 10),
      categoryId: 'technology',
      categoryName: 'Teknologi & IT',
    ),

    // Mobile Development Jobs
    Job(
      id: 4,
      title: "Flutter Developer",
      company: "Mobile Apps Studio",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Flutter Developer untuk mengembangkan aplikasi mobile cross-platform. Kandidat harus memiliki pengalaman dalam pengembangan aplikasi mobile dengan Flutter.",
      requirements: [
        "Minimal 2 tahun pengalaman Flutter development",
        "Menguasai Dart programming language",
        "Pengalaman dengan state management (Provider, Riverpod, Bloc)",
        "Pemahaman REST APIs dan JSON parsing",
        "Pengalaman publishing apps ke Play Store/App Store"
      ],
      benefits: [
        "Gaji kompetitif",
        "Device allowance untuk testing",
        "Flexible working hours",
        "Training Flutter advanced",
        "Health insurance",
        "Annual performance bonus"
      ],
      postedDate: DateTime(2024, 1, 8),
      categoryId: 'mobile_dev',
      categoryName: 'Mobile Development',
    ),
    Job(
      id: 5,
      title: "iOS Developer",
      company: "Apple Development House",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "iOS Developer untuk mengembangkan aplikasi native iOS. Kandidat harus memiliki pengalaman dengan Swift dan iOS SDK.",
      requirements: [
        "Minimal 3 tahun pengalaman iOS development",
        "Menguasai Swift dan Objective-C",
        "Pengalaman dengan UIKit, SwiftUI",
        "Pemahaman iOS design patterns (MVC, MVVM)",
        "Pengalaman dengan Core Data, UserDefaults"
      ],
      benefits: [
        "MacBook Pro dan iPhone untuk development",
        "Gaji kompetitif dengan equity",
        "WWDC conference attendance",
        "Flexible working arrangement",
        "Health and dental insurance"
      ],
      postedDate: DateTime(2024, 1, 6),
      categoryId: 'mobile_dev',
      categoryName: 'Mobile Development',
    ),
    Job(
      id: 6,
      title: "Android Developer",
      company: "Android Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 11.000.000 - 18.000.000",
      description: "Android Developer untuk mengembangkan aplikasi Android native. Fokus pada performance optimization dan modern Android development practices.",
      requirements: [
        "Minimal 2-3 tahun pengalaman Android development",
        "Menguasai Kotlin dan Java",
        "Pengalaman dengan Android Jetpack components",
        "Pemahaman MVVM architecture pattern",
        "Pengalaman dengan Room Database, Retrofit"
      ],
      benefits: [
        "Android devices untuk testing",
        "Gaji kompetitif",
        "Google I/O conference attendance",
        "Flexible working hours",
        "Training dan certification budget"
      ],
      postedDate: DateTime(2024, 1, 4),
      categoryId: 'mobile_dev',
      categoryName: 'Mobile Development',
    ),

    // Data Science & AI Jobs
    Job(
      id: 7,
      title: "Data Scientist",
      company: "AI Analytics Corp",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 18.000.000 - 30.000.000",
      description: "Data Scientist untuk menganalisis big data dan mengembangkan model machine learning. Kandidat harus memiliki pengalaman dengan statistical analysis dan predictive modeling.",
      requirements: [
        "Minimal 3 tahun pengalaman sebagai Data Scientist",
        "Menguasai Python, R, SQL",
        "Pengalaman dengan ML frameworks (TensorFlow, PyTorch, Scikit-learn)",
        "Pemahaman statistik dan matematika yang kuat",
        "Pengalaman dengan big data tools (Spark, Hadoop)"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan bonus",
        "Akses ke GPU clusters untuk training",
        "Conference dan workshop budget",
        "Flexible working arrangement",
        "Research publication opportunities"
      ],
      postedDate: DateTime(2024, 1, 14),
      categoryId: 'data_science',
      categoryName: 'Data Science & AI',
    ),
    Job(
      id: 8,
      title: "Machine Learning Engineer",
      company: "ML Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 16.000.000 - 25.000.000",
      description: "Machine Learning Engineer untuk mengimplementasikan dan deploy model ML ke production. Fokus pada MLOps dan model optimization.",
      requirements: [
        "Minimal 2-3 tahun pengalaman ML engineering",
        "Menguasai Python, Docker, Kubernetes",
        "Pengalaman dengan ML pipelines dan MLOps",
        "Pemahaman cloud platforms (AWS, GCP, Azure)",
        "Pengalaman dengan model deployment dan monitoring"
      ],
      benefits: [
        "Gaji kompetitif dengan equity",
        "Cloud credits untuk experimentation",
        "Conference attendance budget",
        "Flexible working hours",
        "Cutting-edge technology exposure"
      ],
      postedDate: DateTime(2024, 1, 11),
      categoryId: 'data_science',
      categoryName: 'Data Science & AI',
    ),
    Job(
      id: 9,
      title: "Data Analyst",
      company: "Business Intelligence Pro",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 10.000.000 - 15.000.000",
      description: "Data Analyst untuk menganalisis data bisnis dan memberikan insights yang actionable. Kandidat harus memiliki kemampuan analitis yang kuat dan pengalaman dengan tools visualisasi.",
      requirements: [
        "Minimal 2 tahun pengalaman sebagai Data Analyst",
        "Menguasai SQL, Python, Excel",
        "Pengalaman dengan tools visualisasi (Tableau, Power BI)",
        "Pemahaman statistik dan business intelligence",
        "Kemampuan presentasi yang baik"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Akses ke tools analisis premium",
        "Training data science",
        "Kesempatan sertifikasi internasional",
        "Flexible working arrangement"
      ],
      postedDate: DateTime(2024, 1, 9),
      categoryId: 'data_science',
      categoryName: 'Data Science & AI',
    ),

    // DevOps & Cloud Jobs
    Job(
      id: 10,
      title: "DevOps Engineer",
      company: "Cloud Infrastructure",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 14.000.000 - 22.000.000",
      description: "DevOps Engineer untuk mengelola infrastructure dan CI/CD pipelines. Kandidat harus memiliki pengalaman dengan cloud platforms dan automation tools.",
      requirements: [
        "Minimal 3 tahun pengalaman DevOps",
        "Menguasai AWS/GCP/Azure, Docker, Kubernetes",
        "Pengalaman dengan CI/CD tools (Jenkins, GitLab CI)",
        "Pemahaman Infrastructure as Code (Terraform, Ansible)",
        "Pengalaman dengan monitoring tools (Prometheus, Grafana)"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Cloud certification budget",
        "Flexible working arrangement",
        "Latest technology exposure",
        "Conference attendance opportunities"
      ],
      postedDate: DateTime(2024, 1, 7),
      categoryId: 'devops',
      categoryName: 'DevOps & Cloud',
    ),
    Job(
      id: 11,
      title: "Cloud Solutions Architect",
      company: "Enterprise Cloud",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 20.000.000 - 35.000.000",
      description: "Cloud Solutions Architect untuk merancang arsitektur cloud yang scalable dan cost-effective. Posisi senior dengan tanggung jawab strategic.",
      requirements: [
        "Minimal 5 tahun pengalaman cloud architecture",
        "Certified AWS/GCP/Azure Solutions Architect",
        "Pengalaman dengan enterprise architecture",
        "Pemahaman security dan compliance",
        "Leadership dan client-facing skills"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan equity",
        "Certification dan training budget",
        "Conference speaking opportunities",
        "Flexible working arrangement",
        "Stock options"
      ],
      postedDate: DateTime(2024, 1, 5),
      categoryId: 'devops',
      categoryName: 'DevOps & Cloud',
    ),

    // Cybersecurity Jobs
    Job(
      id: 12,
      title: "Cybersecurity Analyst",
      company: "Security Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Cybersecurity Analyst untuk monitoring dan analisis keamanan sistem. Kandidat harus memiliki pengalaman dalam threat detection dan incident response.",
      requirements: [
        "Minimal 2-3 tahun pengalaman cybersecurity",
        "Memahami network security dan protocols",
        "Pengalaman dengan SIEM tools",
        "Pemahaman threat intelligence",
        "Sertifikasi keamanan (CISSP, CEH, atau sejenisnya)"
      ],
      benefits: [
        "Gaji kompetitif dengan allowance",
        "Security training dan certification",
        "Flexible working hours",
        "Health insurance premium",
        "Annual security conference attendance"
      ],
      postedDate: DateTime(2024, 1, 3),
      categoryId: 'cybersecurity',
      categoryName: 'Cybersecurity',
    ),

    // Design & Creative Jobs
    Job(
      id: 13,
      title: "Senior UI/UX Designer",
      company: "Creative Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Senior UI/UX Designer untuk memimpin tim desain dan merancang pengalaman pengguna yang exceptional. Kandidat harus memiliki portfolio yang kuat dan pengalaman leadership.",
      requirements: [
        "Minimal 4 tahun pengalaman UI/UX design",
        "Menguasai tools desain (Figma, Adobe XD, Sketch)",
        "Pemahaman mendalam tentang design thinking",
        "Pengalaman dengan user research dan usability testing",
        "Leadership dan team management skills",
        "Portfolio yang menunjukkan hasil design impact"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus creative",
        "Akses ke software premium unlimited",
        "Budget untuk design conference",
        "Flexible working arrangement",
        "Creative workspace dengan latest equipment"
      ],
      postedDate: DateTime(2024, 1, 13),
      categoryId: 'design',
      categoryName: 'Design & Creative',
    ),
    Job(
      id: 14,
      title: "UI/UX Designer",
      company: "Digital Design Studio",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "UI/UX Designer untuk merancang interface yang user-friendly dan menarik. Kandidat harus memiliki mata yang tajam untuk detail dan memahami prinsip-prinsip desain yang baik.",
      requirements: [
        "Minimal 2 tahun pengalaman di bidang UI/UX",
        "Menguasai tools desain (Figma, Adobe XD, Sketch)",
        "Memahami prinsip User Experience dan User Interface",
        "Pengalaman dengan wireframing dan prototyping",
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
      categoryId: 'ui_ux',
      categoryName: 'UI/UX Design',
    ),
    Job(
      id: 15,
      title: "Product Designer",
      company: "Product Innovation",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Product Designer untuk mengembangkan desain produk digital end-to-end. Fokus pada user research, design system, dan product strategy.",
      requirements: [
        "Minimal 3 tahun pengalaman product design",
        "Menguasai design tools dan prototyping",
        "Pengalaman dengan user research methods",
        "Pemahaman design systems dan atomic design",
        "Kemampuan berkolaborasi dengan product team"
      ],
      benefits: [
        "Gaji kompetitif dengan equity",
        "Design conference budget",
        "Flexible working arrangement",
        "Latest design equipment",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 8),
      categoryId: 'ui_ux',
      categoryName: 'UI/UX Design',
    ),

    // Graphic Design Jobs
    Job(
      id: 16,
      title: "Graphic Designer",
      company: "Creative Agency",
      location: "Yogyakarta",
      type: "Full-time",
      salary: "Rp 6.000.000 - 10.000.000",
      description: "Graphic Designer untuk membuat desain visual yang menarik untuk berbagai media. Kandidat harus kreatif dan memiliki kemampuan storytelling visual.",
      requirements: [
        "Minimal 2 tahun pengalaman graphic design",
        "Menguasai Adobe Creative Suite (Photoshop, Illustrator, InDesign)",
        "Pemahaman typography dan color theory",
        "Pengalaman dengan print dan digital design",
        "Portfolio yang menunjukkan kreativitas"
      ],
      benefits: [
        "Lingkungan kerja kreatif",
        "Adobe Creative Cloud license",
        "Flexible working hours",
        "Design workshop opportunities",
        "Team creative retreats"
      ],
      postedDate: DateTime(2024, 1, 6),
      categoryId: 'graphic_design',
      categoryName: 'Graphic Design',
    ),
    Job(
      id: 17,
      title: "Brand Designer",
      company: "Branding Experts",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 9.000.000 - 15.000.000",
      description: "Brand Designer untuk mengembangkan identitas visual brand yang kuat dan memorable. Fokus pada brand strategy dan visual identity development.",
      requirements: [
        "Minimal 3 tahun pengalaman brand design",
        "Menguasai Adobe Creative Suite",
        "Pemahaman brand strategy dan positioning",
        "Pengalaman dengan brand guidelines development",
        "Portfolio brand identity yang kuat"
      ],
      benefits: [
        "Gaji kompetitif",
        "Brand design conference budget",
        "Flexible working arrangement",
        "Creative equipment allowance",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 4),
      categoryId: 'graphic_design',
      categoryName: 'Graphic Design',
    ),

    // Video & Animation Jobs
    Job(
      id: 18,
      title: "Motion Graphics Designer",
      company: "Animation Studio",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Motion Graphics Designer untuk membuat animasi dan video content yang engaging. Kandidat harus memiliki pengalaman dengan software animasi dan storytelling visual.",
      requirements: [
        "Minimal 2 tahun pengalaman motion graphics",
        "Menguasai After Effects, Premiere Pro, Cinema 4D",
        "Pemahaman animation principles",
        "Pengalaman dengan 2D dan 3D animation",
        "Portfolio motion graphics yang strong"
      ],
      benefits: [
        "Gaji kompetitif",
        "High-end workstation untuk animation",
        "Software license unlimited",
        "Animation conference budget",
        "Creative team environment"
      ],
      postedDate: DateTime(2024, 1, 2),
      categoryId: 'video_animation',
      categoryName: 'Video & Animation',
    ),

    // Marketing & Sales Jobs
    Job(
      id: 19,
      title: "Digital Marketing Manager",
      company: "Marketing Pro",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Digital Marketing Manager untuk memimpin strategi pemasaran digital dan mengelola tim marketing. Kandidat harus memiliki pengalaman leadership dan strategic thinking.",
      requirements: [
        "Minimal 4 tahun pengalaman digital marketing",
        "Pengalaman team leadership dan management",
        "Menguasai Google Ads, Facebook Ads, LinkedIn Ads",
        "Pemahaman marketing analytics dan ROI optimization",
        "Pengalaman dengan marketing automation tools",
        "Strategic thinking dan data-driven decision making"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Marketing conference budget",
        "Flexible working arrangement",
        "Team leadership training",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 14),
      categoryId: 'marketing',
      categoryName: 'Marketing & Sales',
    ),
    Job(
      id: 20,
      title: "Digital Marketing Specialist",
      company: "Growth Marketing",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 7.000.000 - 12.000.000",
      description: "Digital Marketing Specialist untuk mengelola kampanye pemasaran digital dan mengoptimalkan conversion rate. Fokus pada performance marketing dan growth hacking.",
      requirements: [
        "Minimal 2 tahun pengalaman digital marketing",
        "Menguasai Google Ads, Facebook Ads, Instagram Ads",
        "Pemahaman SEO dan SEM",
        "Pengalaman dengan Google Analytics dan marketing tools",
        "Kemampuan analisis data marketing",
        "Kreatif dan up-to-date dengan tren digital"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Training digital marketing",
        "Kesempatan menghadiri seminar/workshop",
        "Fasilitas internet unlimited",
        "Flexible working hours"
      ],
      postedDate: DateTime(2024, 1, 11),
      categoryId: 'digital_marketing',
      categoryName: 'Digital Marketing',
    ),
    Job(
      id: 21,
      title: "Social Media Manager",
      company: "Social Media Agency",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 6.000.000 - 10.000.000",
      description: "Social Media Manager untuk mengelola akun media sosial klien dan mengembangkan strategi content marketing. Kandidat harus kreatif dan memahami tren social media.",
      requirements: [
        "Minimal 2 tahun pengalaman social media management",
        "Menguasai platform social media (Instagram, TikTok, Twitter, LinkedIn)",
        "Pengalaman dengan content creation dan scheduling tools",
        "Pemahaman social media analytics",
        "Kemampuan copywriting dan storytelling"
      ],
      benefits: [
        "Gaji kompetitif",
        "Social media tools subscription",
        "Content creation equipment",
        "Social media conference budget",
        "Creative team environment"
      ],
      postedDate: DateTime(2024, 1, 9),
      categoryId: 'digital_marketing',
      categoryName: 'Digital Marketing',
    ),

    // Content Marketing Jobs
    Job(
      id: 22,
      title: "Content Marketing Manager",
      company: "Content Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Content Marketing Manager untuk mengembangkan dan mengelola strategi content marketing. Kandidat harus memiliki pengalaman dalam content strategy dan team management.",
      requirements: [
        "Minimal 3 tahun pengalaman content marketing",
        "Pengalaman team management dan leadership",
        "Kemampuan content strategy dan planning",
        "Pemahaman SEO dan content optimization",
        "Pengalaman dengan content management systems"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Content tools dan software budget",
        "Flexible working arrangement",
        "Content marketing conference",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 7),
      categoryId: 'content_marketing',
      categoryName: 'Content Marketing',
    ),
    Job(
      id: 23,
      title: "Content Writer",
      company: "Digital Content",
      location: "Remote",
      type: "Full-time",
      salary: "Rp 5.000.000 - 9.000.000",
      description: "Content Writer untuk membuat konten berkualitas tinggi untuk berbagai platform digital. Kandidat harus memiliki kemampuan menulis yang excellent dan pemahaman SEO.",
      requirements: [
        "Minimal 2 tahun pengalaman content writing",
        "Kemampuan menulis yang excellent dalam Bahasa Indonesia dan Inggris",
        "Pemahaman SEO writing dan keyword optimization",
        "Pengalaman dengan CMS (WordPress, etc.)",
        "Portfolio writing yang diverse"
      ],
      benefits: [
        "Gaji kompetitif",
        "100% remote working",
        "Writing tools subscription",
        "Flexible working hours",
        "Writing workshop opportunities"
      ],
      postedDate: DateTime(2024, 1, 5),
      categoryId: 'content_marketing',
      categoryName: 'Content Marketing',
    ),
    Job(
      id: 24,
      title: "SEO Specialist",
      company: "SEO Masters",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "SEO Specialist untuk mengoptimalkan website dan meningkatkan organic traffic. Kandidat harus memiliki pengalaman dalam technical SEO dan content optimization.",
      requirements: [
        "Minimal 2-3 tahun pengalaman SEO",
        "Menguasai SEO tools (SEMrush, Ahrefs, Google Analytics)",
        "Pemahaman technical SEO dan on-page optimization",
        "Pengalaman dengan keyword research dan content optimization",
        "Kemampuan analisis dan reporting"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "SEO tools subscription",
        "SEO conference budget",
        "Flexible working arrangement",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 3),
      categoryId: 'content_marketing',
      categoryName: 'Content Marketing',
    ),

    // Sales & Business Development Jobs
    Job(
      id: 25,
      title: "Sales Manager",
      company: "Sales Excellence",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Sales Manager untuk memimpin tim sales dan mencapai target penjualan. Kandidat harus memiliki pengalaman leadership dan track record penjualan yang excellent.",
      requirements: [
        "Minimal 4 tahun pengalaman sales dengan 2 tahun management",
        "Track record mencapai atau melebihi target sales",
        "Pengalaman team leadership dan coaching",
        "Pemahaman sales process dan CRM systems",
        "Excellent communication dan negotiation skills"
      ],
      benefits: [
        "Gaji kompetitif dengan commission uncapped",
        "Sales incentives dan bonus",
        "Company car atau car allowance",
        "Sales training dan conference",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 12),
      categoryId: 'sales',
      categoryName: 'Sales & Business Dev',
    ),
    Job(
      id: 26,
      title: "Business Development Manager",
      company: "Growth Partners",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Business Development Manager untuk mengidentifikasi peluang bisnis baru dan mengembangkan partnership strategis. Fokus pada business growth dan expansion.",
      requirements: [
        "Minimal 3-4 tahun pengalaman business development",
        "Pengalaman dalam partnership dan strategic alliances",
        "Pemahaman market analysis dan competitive intelligence",
        "Excellent presentation dan negotiation skills",
        "Network yang luas dalam industri"
      ],
      benefits: [
        "Gaji kompetitif dengan equity",
        "Business development budget",
        "Flexible working arrangement",
        "Networking events budget",
        "Career growth opportunities"
      ],
      postedDate: DateTime(2024, 1, 10),
      categoryId: 'sales',
      categoryName: 'Sales & Business Dev',
    ),
    Job(
      id: 27,
      title: "Account Manager",
      company: "Client Success",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 9.000.000 - 15.000.000",
      description: "Account Manager untuk mengelola klien existing dan mengembangkan relationship jangka panjang. Fokus pada client satisfaction dan account growth.",
      requirements: [
        "Minimal 2-3 tahun pengalaman account management",
        "Pengalaman dalam client relationship management",
        "Pemahaman customer success dan retention strategies",
        "Excellent communication dan problem-solving skills",
        "Pengalaman dengan CRM tools"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus retention",
        "Client entertainment budget",
        "Flexible working hours",
        "Account management training",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 8),
      categoryId: 'sales',
      categoryName: 'Sales & Business Dev',
    ),

    // Finance & Accounting Jobs
    Job(
      id: 28,
      title: "Financial Analyst",
      company: "Finance Corp",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Financial Analyst untuk menganalisis data keuangan dan memberikan insights untuk decision making. Kandidat harus memiliki kemampuan analisis yang kuat dan pemahaman financial modeling.",
      requirements: [
        "Minimal 2-3 tahun pengalaman financial analysis",
        "Menguasai Excel advanced dan financial modeling",
        "Pemahaman financial statements dan ratio analysis",
        "Pengalaman dengan financial software (SAP, Oracle)",
        "Kemampuan presentasi dan reporting"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Financial software training",
        "CFA certification support",
        "Flexible working arrangement",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 13),
      categoryId: 'finance',
      categoryName: 'Finance & Accounting',
    ),
    Job(
      id: 29,
      title: "Senior Accountant",
      company: "Accounting Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Senior Accountant untuk mengelola proses akuntansi dan financial reporting. Kandidat harus memiliki pengalaman dalam full-cycle accounting dan tax compliance.",
      requirements: [
        "Minimal 3-4 tahun pengalaman accounting",
        "Menguasai software akuntansi (SAP, Accurate, Zahir)",
        "Pemahaman tax regulations dan compliance",
        "Pengalaman dengan audit dan financial reporting",
        "Sertifikasi akuntansi (CPA, CA) preferred"
      ],
      benefits: [
        "Gaji kompetitif",
        "Accounting software training",
        "Professional certification support",
        "Health insurance",
        "Annual performance bonus"
      ],
      postedDate: DateTime(2024, 1, 11),
      categoryId: 'finance',
      categoryName: 'Finance & Accounting',
    ),
    Job(
      id: 30,
      title: "Tax Consultant",
      company: "Tax Advisory",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Tax Consultant untuk memberikan advisory services dalam bidang perpajakan. Kandidat harus memiliki pemahaman mendalam tentang tax regulations dan compliance.",
      requirements: [
        "Minimal 4 tahun pengalaman tax consulting",
        "Menguasai tax regulations dan tax planning",
        "Pengalaman dengan tax compliance dan reporting",
        "Bersertifikat Brevet A/B",
        "Excellent analytical dan communication skills"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "Tax certification support",
        "Professional development budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 9),
      categoryId: 'finance',
      categoryName: 'Finance & Accounting',
    ),

    // Management & Leadership Jobs
    Job(
      id: 31,
      title: "Product Manager",
      company: "Product Innovation",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 18.000.000 - 30.000.000",
      description: "Product Manager untuk memimpin pengembangan produk digital dan mengkordinasikan tim lintas fungsi. Kandidat harus memiliki pengalaman dalam product strategy dan execution.",
      requirements: [
        "Minimal 4 tahun pengalaman product management",
        "Pengalaman dengan product lifecycle management",
        "Pemahaman Agile/Scrum methodologies",
        "Kemampuan data analysis dan product metrics",
        "Excellent leadership dan communication skills"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan equity",
        "Product management training",
        "Conference attendance budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 15),
      categoryId: 'product_management',
      categoryName: 'Product Management',
    ),
    Job(
      id: 32,
      title: "Project Manager",
      company: "Project Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Project Manager untuk mengelola proyek dari initiation hingga completion. Kandidat harus memiliki pengalaman dalam project management dan team coordination.",
      requirements: [
        "Minimal 3-4 tahun pengalaman project management",
        "Sertifikasi PMP atau equivalent preferred",
        "Pengalaman dengan project management tools (Jira, Asana, MS Project)",
        "Pemahaman Agile dan Waterfall methodologies",
        "Excellent organizational dan leadership skills"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "PMP certification support",
        "Project management tools access",
        "Flexible working arrangement",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 12),
      categoryId: 'management',
      categoryName: 'Management',
    ),
    Job(
      id: 33,
      title: "Operations Manager",
      company: "Operations Excellence",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Operations Manager untuk mengoptimalkan proses operasional dan meningkatkan efisiensi. Kandidat harus memiliki pengalaman dalam process improvement dan team management.",
      requirements: [
        "Minimal 4 tahun pengalaman operations management",
        "Pengalaman dalam process improvement dan optimization",
        "Pemahaman lean manufacturing dan six sigma",
        "Excellent analytical dan problem-solving skills",
        "Leadership dan team management experience"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Operations training dan certification",
        "Flexible working arrangement",
        "Career advancement opportunities",
        "Health insurance premium"
      ],
      postedDate: DateTime(2024, 1, 10),
      categoryId: 'operations',
      categoryName: 'Operations',
    ),

    // Human Resources Jobs
    Job(
      id: 34,
      title: "HR Manager",
      company: "Human Capital",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "HR Manager untuk memimpin fungsi HR dan mengembangkan people strategy. Kandidat harus memiliki pengalaman dalam HR management dan employee development.",
      requirements: [
        "Minimal 4 tahun pengalaman HR management",
        "Pengalaman dalam recruitment, performance management, training",
        "Pemahaman employment law dan HR compliance",
        "Excellent interpersonal dan communication skills",
        "Pengalaman dengan HRIS dan HR analytics"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "HR certification support",
        "Professional development budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 14),
      categoryId: 'hr',
      categoryName: 'Human Resources',
    ),
    Job(
      id: 35,
      title: "Talent Acquisition Specialist",
      company: "Recruitment Pro",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Talent Acquisition Specialist untuk mengelola proses recruitment dan sourcing kandidat berkualitas. Kandidat harus memiliki pengalaman dalam full-cycle recruiting.",
      requirements: [
        "Minimal 2-3 tahun pengalaman talent acquisition",
        "Pengalaman dengan sourcing techniques dan tools",
        "Pemahaman employer branding dan candidate experience",
        "Excellent interviewing dan assessment skills",
        "Pengalaman dengan ATS dan recruiting tools"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus hiring",
        "Recruiting tools access",
        "Professional development budget",
        "Flexible working arrangement",
        "Career growth opportunities"
      ],
      postedDate: DateTime(2024, 1, 11),
      categoryId: 'recruitment',
      categoryName: 'Recruitment',
    ),
    Job(
      id: 36,
      title: "HR Business Partner",
      company: "Strategic HR",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "HR Business Partner untuk memberikan strategic HR support kepada business units. Kandidat harus memiliki pengalaman dalam HR consulting dan business partnering.",
      requirements: [
        "Minimal 3-4 tahun pengalaman HR business partnering",
        "Pengalaman dalam organizational development",
        "Pemahaman business strategy dan HR analytics",
        "Excellent consulting dan influencing skills",
        "Pengalaman dengan change management"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus",
        "HR certification support",
        "Business training budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 9),
      categoryId: 'hr',
      categoryName: 'Human Resources',
    ),

    // Education & Training Jobs
    Job(
      id: 37,
      title: "Corporate Trainer",
      company: "Learning Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Corporate Trainer untuk mengembangkan dan deliver training programs. Kandidat harus memiliki pengalaman dalam instructional design dan adult learning principles.",
      requirements: [
        "Minimal 3 tahun pengalaman corporate training",
        "Pengalaman dalam instructional design dan curriculum development",
        "Excellent presentation dan facilitation skills",
        "Pemahaman adult learning principles",
        "Pengalaman dengan e-learning platforms"
      ],
      benefits: [
        "Gaji kompetitif",
        "Training certification support",
        "Professional development budget",
        "Flexible working arrangement",
        "Career growth opportunities"
      ],
      postedDate: DateTime(2024, 1, 7),
      categoryId: 'education',
      categoryName: 'Education & Training',
    ),
    Job(
      id: 38,
      title: "Instructional Designer",
      company: "E-Learning Pro",
      location: "Remote",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Instructional Designer untuk merancang dan mengembangkan pembelajaran digital. Kandidat harus memiliki pengalaman dalam e-learning development dan learning technologies.",
      requirements: [
        "Minimal 2-3 tahun pengalaman instructional design",
        "Menguasai e-learning authoring tools (Articulate, Adobe Captivate)",
        "Pemahaman learning theories dan pedagogy",
        "Pengalaman dengan LMS dan learning analytics",
        "Portfolio e-learning projects"
      ],
      benefits: [
        "Gaji kompetitif",
        "100% remote working",
        "E-learning tools access",
        "Professional development budget",
        "Flexible working hours"
      ],
      postedDate: DateTime(2024, 1, 5),
      categoryId: 'elearning',
      categoryName: 'E-Learning',
    ),

    // Customer Service Jobs
    Job(
      id: 39,
      title: "Customer Success Manager",
      company: "Customer Excellence",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Customer Success Manager untuk memastikan kepuasan dan retensi pelanggan. Kandidat harus memiliki pengalaman dalam customer relationship management.",
      requirements: [
        "Minimal 3 tahun pengalaman customer success",
        "Pengalaman dalam customer onboarding dan retention",
        "Pemahaman customer health metrics dan churn prevention",
        "Excellent communication dan problem-solving skills",
        "Pengalaman dengan CRM dan customer success tools"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus retention",
        "Customer success training",
        "Professional development budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 8),
      categoryId: 'customer_service',
      categoryName: 'Customer Service',
    ),
    Job(
      id: 40,
      title: "Customer Support Specialist",
      company: "Support Solutions",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 5.000.000 - 8.000.000",
      description: "Customer Support Specialist untuk memberikan support berkualitas tinggi kepada pelanggan. Kandidat harus memiliki patience dan excellent communication skills.",
      requirements: [
        "Minimal 1-2 tahun pengalaman customer support",
        "Excellent communication skills dalam Bahasa Indonesia dan Inggris",
        "Pengalaman dengan ticketing systems dan live chat",
        "Problem-solving dan conflict resolution skills",
        "Patience dan empathy dalam berinteraksi dengan customer"
      ],
      benefits: [
        "Gaji kompetitif",
        "Customer service training",
        "Health insurance",
        "Flexible working hours",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 6),
      categoryId: 'customer_service',
      categoryName: 'Customer Service',
    ),

    // Additional jobs across various categories...
    // (Adding more jobs to reach a substantial number)

    // Engineering Jobs
    Job(
      id: 41,
      title: "Mechanical Engineer",
      company: "Engineering Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Mechanical Engineer untuk merancang dan mengembangkan sistem mekanis. Kandidat harus memiliki pengalaman dalam mechanical design dan manufacturing processes.",
      requirements: [
        "Minimal 3 tahun pengalaman mechanical engineering",
        "Menguasai CAD software (AutoCAD, SolidWorks)",
        "Pemahaman manufacturing processes dan material science",
        "Pengalaman dengan project management",
        "Problem-solving dan analytical skills"
      ],
      benefits: [
        "Gaji kompetitif",
        "Engineering software license",
        "Professional development budget",
        "Health insurance",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 4),
      categoryId: 'engineering',
      categoryName: 'Engineering',
    ),

    // Healthcare Jobs
    Job(
      id: 42,
      title: "Registered Nurse",
      company: "Healthcare Center",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 8.000.000 - 12.000.000",
      description: "Registered Nurse untuk memberikan perawatan kesehatan berkualitas. Kandidat harus memiliki lisensi praktik dan pengalaman dalam patient care.",
      requirements: [
        "Lulusan D3/S1 Keperawatan",
        "Memiliki STR (Surat Tanda Registrasi) aktif",
        "Minimal 2 tahun pengalaman sebagai perawat",
        "Kemampuan communication dan empathy yang baik",
        "Mampu bekerja dalam tim dan situasi emergency"
      ],
      benefits: [
        "Gaji kompetitif",
        "Asuransi kesehatan premium",
        "Continuing education support",
        "Shift allowance",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 2),
      categoryId: 'healthcare',
      categoryName: 'Healthcare & Medical',
    ),

    // Legal Jobs
    Job(
      id: 43,
      title: "Legal Counsel",
      company: "Law Firm",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Legal Counsel untuk memberikan advisory legal dan menangani legal matters. Kandidat harus memiliki pengalaman dalam corporate law dan litigation.",
      requirements: [
        "Lulusan Sarjana Hukum",
        "Minimal 4 tahun pengalaman sebagai lawyer",
        "Memiliki sertifikat advokat",
        "Pengalaman dalam corporate law dan contract drafting",
        "Excellent analytical dan writing skills"
      ],
      benefits: [
        "Gaji sangat kompetitif",
        "Legal research tools access",
        "Professional development budget",
        "Flexible working arrangement",
        "Partnership track opportunities"
      ],
      postedDate: DateTime(2024, 1, 1),
      categoryId: 'legal',
      categoryName: 'Legal & Compliance',
    ),

    // Media & Communication Jobs
    Job(
      id: 44,
      title: "Public Relations Manager",
      company: "PR Agency",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Public Relations Manager untuk mengelola komunikasi publik dan media relations. Kandidat harus memiliki pengalaman dalam PR strategy dan crisis communication.",
      requirements: [
        "Minimal 3-4 tahun pengalaman PR",
        "Pengalaman dalam media relations dan press releases",
        "Excellent writing dan communication skills",
        "Pemahaman digital PR dan social media",
        "Crisis communication experience"
      ],
      benefits: [
        "Gaji kompetitif",
        "PR tools dan media monitoring access",
        "Professional development budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 3),
      categoryId: 'public_relations',
      categoryName: 'Public Relations',
    ),

    // Retail & E-commerce Jobs
    Job(
      id: 45,
      title: "E-commerce Manager",
      company: "Online Retail",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "E-commerce Manager untuk mengelola online store dan mengoptimalkan penjualan digital. Kandidat harus memiliki pengalaman dalam e-commerce platforms dan digital marketing.",
      requirements: [
        "Minimal 3 tahun pengalaman e-commerce",
        "Pengalaman dengan e-commerce platforms (Shopify, WooCommerce)",
        "Pemahaman digital marketing dan conversion optimization",
        "Analytical skills dan data-driven thinking",
        "Pengalaman dengan inventory management"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus sales",
        "E-commerce tools access",
        "Professional development budget",
        "Flexible working arrangement",
        "Career growth opportunities"
      ],
      postedDate: DateTime(2024, 1, 5),
      categoryId: 'retail',
      categoryName: 'Retail & E-commerce',
    ),

    // Additional diverse jobs across all categories
    
    // Manufacturing Jobs
    Job(
      id: 46,
      title: "Production Supervisor",
      company: "Manufacturing Excellence",
      location: "Karawang",
      type: "Full-time",
      salary: "Rp 11.000.000 - 17.000.000",
      description: "Production Supervisor untuk mengawasi proses produksi dan memastikan kualitas produk. Kandidat harus memiliki pengalaman dalam lean manufacturing dan continuous improvement.",
      requirements: [
        "Minimal 3 tahun pengalaman production supervision",
        "Pemahaman lean manufacturing dan 5S",
        "Pengalaman dengan quality control systems",
        "Leadership dan problem-solving skills",
        "Kemampuan bekerja dalam shift"
      ],
      benefits: [
        "Gaji kompetitif dengan shift allowance",
        "Asuransi kesehatan dan jiwa",
        "Bonus production target",
        "Transportation allowance",
        "Career development opportunities"
      ],
      postedDate: DateTime(2024, 1, 16),
      categoryId: 'manufacturing',
      categoryName: 'Manufacturing',
    ),
    Job(
      id: 47,
      title: "Quality Control Inspector",
      company: "Precision Manufacturing",
      location: "Bekasi",
      type: "Full-time",
      salary: "Rp 7.000.000 - 11.000.000",
      description: "Quality Control Inspector untuk memastikan standar kualitas produk sesuai dengan spesifikasi. Kandidat harus detail-oriented dan memiliki pengalaman dengan testing equipment.",
      requirements: [
        "Minimal 2 tahun pengalaman quality control",
        "Pemahaman ISO 9001 dan quality standards",
        "Pengalaman dengan measuring instruments",
        "Detail-oriented dan analytical thinking",
        "Kemampuan dokumentasi yang baik"
      ],
      benefits: [
        "Gaji kompetitif",
        "Quality bonus incentive",
        "Health insurance",
        "Training dan certification",
        "Stable working environment"
      ],
      postedDate: DateTime(2024, 1, 14),
      categoryId: 'manufacturing',
      categoryName: 'Manufacturing',
    ),

    // Transportation & Logistics Jobs
    Job(
      id: 48,
      title: "Fleet Manager",
      company: "Logistics Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 14.000.000 - 22.000.000",
      description: "Fleet Manager untuk mengelola armada kendaraan dan mengoptimalkan operasi logistik. Kandidat harus memiliki pengalaman dalam fleet management dan cost optimization.",
      requirements: [
        "Minimal 4 tahun pengalaman fleet management",
        "Pengalaman dengan fleet management systems",
        "Pemahaman vehicle maintenance dan compliance",
        "Analytical skills untuk cost optimization",
        "Leadership dan team management"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Company car allowance",
        "Health insurance premium",
        "Fuel allowance",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 13),
      categoryId: 'logistics',
      categoryName: 'Logistics & Supply Chain',
    ),
    Job(
      id: 49,
      title: "Supply Chain Coordinator",
      company: "Global Supply Chain",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 9.000.000 - 14.000.000",
      description: "Supply Chain Coordinator untuk mengkoordinasikan alur barang dari supplier ke customer. Kandidat harus memiliki pengalaman dalam supply chain management dan vendor relations.",
      requirements: [
        "Minimal 2-3 tahun pengalaman supply chain",
        "Pemahaman procurement dan vendor management",
        "Pengalaman dengan ERP systems",
        "Excellent communication dan coordination skills",
        "Problem-solving dan analytical thinking"
      ],
      benefits: [
        "Gaji kompetitif",
        "Performance bonus",
        "Health insurance",
        "Transportation allowance",
        "Professional development opportunities"
      ],
      postedDate: DateTime(2024, 1, 12),
      categoryId: 'logistics',
      categoryName: 'Logistics & Supply Chain',
    ),
    Job(
      id: 50,
      title: "Warehouse Operations Manager",
      company: "Distribution Center",
      location: "Tangerang",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Warehouse Operations Manager untuk mengelola operasi gudang dan distribusi. Kandidat harus memiliki pengalaman dalam warehouse management dan inventory control.",
      requirements: [
        "Minimal 3-4 tahun pengalaman warehouse management",
        "Pengalaman dengan WMS (Warehouse Management System)",
        "Pemahaman inventory management dan cycle counting",
        "Leadership dan team management skills",
        "Kemampuan optimasi layout dan process"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus target",
        "Health insurance dan BPJS",
        "Overtime allowance",
        "Career development program",
        "Annual performance review"
      ],
      postedDate: DateTime(2024, 1, 11),
      categoryId: 'logistics',
      categoryName: 'Logistics & Supply Chain',
    ),

    // Real Estate & Property Jobs
    Job(
      id: 51,
      title: "Property Sales Agent",
      company: "Prime Real Estate",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 6.000.000 - 15.000.000",
      description: "Property Sales Agent untuk menjual properti residensial dan komersial. Kandidat harus memiliki kemampuan sales yang excellent dan pemahaman tentang real estate market.",
      requirements: [
        "Minimal 2 tahun pengalaman property sales",
        "Pemahaman real estate market dan regulations",
        "Excellent sales dan negotiation skills",
        "Network yang luas dalam industri property",
        "Kemampuan presentasi dan communication"
      ],
      benefits: [
        "Basic salary plus commission unlimited",
        "Sales incentives dan bonus",
        "Health insurance",
        "Transportation allowance",
        "Training dan development program"
      ],
      postedDate: DateTime(2024, 1, 10),
      categoryId: 'real_estate',
      categoryName: 'Real Estate',
    ),
    Job(
      id: 52,
      title: "Property Development Manager",
      company: "Urban Development",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 18.000.000 - 28.000.000",
      description: "Property Development Manager untuk mengelola proyek pengembangan properti dari planning hingga completion. Kandidat harus memiliki pengalaman dalam project management dan construction.",
      requirements: [
        "Minimal 5 tahun pengalaman property development",
        "Pengalaman dengan project management dan construction",
        "Pemahaman zoning regulations dan permits",
        "Leadership dan stakeholder management",
        "Financial analysis dan budgeting skills"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan bonus project",
        "Health insurance premium",
        "Company car",
        "Professional development budget",
        "Stock options in development projects"
      ],
      postedDate: DateTime(2024, 1, 9),
      categoryId: 'real_estate',
      categoryName: 'Real Estate',
    ),

    // Agriculture & Food Jobs
    Job(
      id: 53,
      title: "Agricultural Engineer",
      company: "AgriTech Solutions",
      location: "Bogor",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Agricultural Engineer untuk mengembangkan teknologi pertanian modern dan sustainable farming practices. Kandidat harus memiliki background engineering dan passion untuk agriculture.",
      requirements: [
        "Lulusan Teknik Pertanian atau Agricultural Engineering",
        "Minimal 2-3 tahun pengalaman agricultural technology",
        "Pemahaman precision farming dan IoT agriculture",
        "Problem-solving dan innovation skills",
        "Kemampuan field work dan research"
      ],
      benefits: [
        "Gaji kompetitif",
        "Field work allowance",
        "Health insurance",
        "Research budget",
        "Conference attendance opportunities"
      ],
      postedDate: DateTime(2024, 1, 8),
      categoryId: 'agriculture',
      categoryName: 'Agriculture & Food',
    ),
    Job(
      id: 54,
      title: "Food Safety Specialist",
      company: "Food Processing Indonesia",
      location: "Malang",
      type: "Full-time",
      salary: "Rp 8.000.000 - 13.000.000",
      description: "Food Safety Specialist untuk memastikan keamanan dan kualitas produk makanan. Kandidat harus memiliki pengalaman dalam food safety regulations dan HACCP implementation.",
      requirements: [
        "Lulusan Food Technology atau Nutrition",
        "Minimal 2 tahun pengalaman food safety",
        "Sertifikasi HACCP dan food safety standards",
        "Pemahaman regulations BPOM dan international standards",
        "Detail-oriented dan analytical thinking"
      ],
      benefits: [
        "Gaji kompetitif",
        "Food safety certification support",
        "Health insurance",
        "Professional development budget",
        "Safe working environment"
      ],
      postedDate: DateTime(2024, 1, 7),
      categoryId: 'agriculture',
      categoryName: 'Agriculture & Food',
    ),

    // Government & Public Service Jobs
    Job(
      id: 55,
      title: "Public Policy Analyst",
      company: "Government Agency",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Public Policy Analyst untuk menganalisis kebijakan publik dan memberikan rekomendasi perbaikan. Kandidat harus memiliki background dalam public administration atau policy studies.",
      requirements: [
        "Lulusan Public Administration, Political Science, atau Economics",
        "Minimal 3 tahun pengalaman policy analysis",
        "Pemahaman government processes dan regulations",
        "Excellent research dan writing skills",
        "Statistical analysis dan data interpretation"
      ],
      benefits: [
        "Gaji kompetitif sesuai golongan",
        "Tunjangan jabatan dan family",
        "Health insurance dan pension",
        "Training dan development program",
        "Job security dan career progression"
      ],
      postedDate: DateTime(2024, 1, 6),
      categoryId: 'government',
      categoryName: 'Government & Public Service',
    ),
    Job(
      id: 56,
      title: "Civil Servant - Administrative Officer",
      company: "Ministry of Education",
      location: "Yogyakarta",
      type: "Full-time",
      salary: "Rp 6.000.000 - 12.000.000",
      description: "Civil Servant Administrative Officer untuk mengelola administrasi dan pelayanan publik. Kandidat harus memiliki dedikasi untuk melayani masyarakat dan kemampuan administrative yang baik.",
      requirements: [
        "Lulusan S1 dari jurusan apapun",
        "Lulus seleksi CPNS",
        "Kemampuan administrative dan documentation",
        "Service-oriented mindset",
        "Kemampuan bekerja dalam tim"
      ],
      benefits: [
        "Gaji dan tunjangan sesuai golongan",
        "Asuransi kesehatan dan jiwa",
        "Tunjangan hari raya",
        "Cuti tahunan dan study leave",
        "Pension dan retirement benefits"
      ],
      postedDate: DateTime(2024, 1, 5),
      categoryId: 'government',
      categoryName: 'Government & Public Service',
    ),

    // Insurance Jobs
    Job(
      id: 57,
      title: "Insurance Underwriter",
      company: "Insurance Pro",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 9.000.000 - 15.000.000",
      description: "Insurance Underwriter untuk mengevaluasi risiko dan menentukan premium asuransi. Kandidat harus memiliki analytical skills yang kuat dan pemahaman tentang insurance principles.",
      requirements: [
        "Minimal 2-3 tahun pengalaman underwriting",
        "Pemahaman insurance principles dan risk assessment",
        "Analytical skills dan attention to detail",
        "Pengalaman dengan underwriting software",
        "Sertifikasi insurance preferred"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Health insurance comprehensive",
        "Professional certification support",
        "Career development opportunities",
        "Flexible working arrangement"
      ],
      postedDate: DateTime(2024, 1, 4),
      categoryId: 'insurance',
      categoryName: 'Insurance',
    ),
    Job(
      id: 58,
      title: "Claims Adjuster",
      company: "General Insurance",
      location: "Surabaya",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Claims Adjuster untuk menginvestigasi dan mengevaluasi klaim asuransi. Kandidat harus memiliki investigative skills dan kemampuan untuk bekerja di lapangan.",
      requirements: [
        "Minimal 2 tahun pengalaman claims handling",
        "Pemahaman insurance claims procedures",
        "Investigative dan analytical skills",
        "Kemampuan field work dan travel",
        "Excellent communication dan negotiation skills"
      ],
      benefits: [
        "Gaji kompetitif dengan field allowance",
        "Transportation dan travel allowance",
        "Health insurance",
        "Training dan certification",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2024, 1, 3),
      categoryId: 'insurance',
      categoryName: 'Insurance',
    ),

    // Banking & Investment Jobs
    Job(
      id: 59,
      title: "Investment Advisor",
      company: "Wealth Management",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 15.000.000 - 30.000.000",
      description: "Investment Advisor untuk memberikan konsultasi investasi kepada high-net-worth clients. Kandidat harus memiliki pengalaman dalam wealth management dan investment analysis.",
      requirements: [
        "Minimal 3 tahun pengalaman investment advisory",
        "Sertifikasi financial planning (CFP, CFA preferred)",
        "Pemahaman investment products dan market analysis",
        "Excellent client relationship management",
        "Strong analytical dan presentation skills"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan commission",
        "Performance bonus unlimited",
        "Health insurance premium",
        "Professional development budget",
        "Networking opportunities dengan HNW clients"
      ],
      postedDate: DateTime(2024, 1, 2),
      categoryId: 'banking',
      categoryName: 'Banking & Investment',
    ),
    Job(
      id: 60,
      title: "Credit Analyst",
      company: "Commercial Bank",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 10.000.000 - 16.000.000",
      description: "Credit Analyst untuk menganalisis kelayakan kredit dan menilai risiko peminjaman. Kandidat harus memiliki analytical skills yang kuat dan pemahaman tentang credit risk management.",
      requirements: [
        "Minimal 2-3 tahun pengalaman credit analysis",
        "Pemahaman financial statement analysis",
        "Risk assessment dan credit scoring",
        "Pengalaman dengan banking software",
        "Attention to detail dan analytical thinking"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus target",
        "Banking benefits dan employee loan",
        "Health insurance",
        "Professional banking certification",
        "Career development dalam banking"
      ],
      postedDate: DateTime(2024, 1, 1),
      categoryId: 'banking',
      categoryName: 'Banking & Investment',
    ),

    // Consulting Jobs
    Job(
      id: 61,
      title: "Management Consultant",
      company: "Strategic Consulting",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 16.000.000 - 28.000.000",
      description: "Management Consultant untuk memberikan advisory services kepada klien korporat. Kandidat harus memiliki analytical skills yang excellent dan pengalaman dalam business strategy.",
      requirements: [
        "Minimal 3-4 tahun pengalaman consulting",
        "MBA atau equivalent business degree",
        "Excellent analytical dan problem-solving skills",
        "Client-facing dan presentation skills",
        "Pengalaman dengan strategy development"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan bonus",
        "Travel allowance dan per diem",
        "Health insurance premium",
        "Professional development budget",
        "International assignment opportunities"
      ],
      postedDate: DateTime(2023, 12, 30),
      categoryId: 'consulting',
      categoryName: 'Consulting',
    ),
    Job(
      id: 62,
      title: "Business Analyst",
      company: "Business Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 11.000.000 - 18.000.000",
      description: "Business Analyst untuk menganalisis proses bisnis dan memberikan rekomendasi improvement. Kandidat harus memiliki analytical skills dan pengalaman dalam process optimization.",
      requirements: [
        "Minimal 2-3 tahun pengalaman business analysis",
        "Pemahaman process mapping dan business modeling",
        "Analytical skills dan data interpretation",
        "Pengalaman dengan business analysis tools",
        "Excellent communication dan documentation"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus performance",
        "Health insurance",
        "Professional development budget",
        "Flexible working arrangement",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2023, 12, 29),
      categoryId: 'consulting',
      categoryName: 'Consulting',
    ),

    // Pharmacy Jobs
    Job(
      id: 63,
      title: "Clinical Pharmacist",
      company: "Hospital Pharmacy",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 18.000.000",
      description: "Clinical Pharmacist untuk memberikan pharmaceutical care di rumah sakit. Kandidat harus memiliki lisensi apoteker dan pengalaman dalam clinical pharmacy practice.",
      requirements: [
        "Lulusan Farmasi dengan ijazah Apoteker",
        "Memiliki STRA (Surat Tanda Registrasi Apoteker) aktif",
        "Minimal 2 tahun pengalaman clinical pharmacy",
        "Pemahaman clinical guidelines dan drug interactions",
        "Excellent communication dengan healthcare team"
      ],
      benefits: [
        "Gaji kompetitif dengan tunjangan profesi",
        "Health insurance premium",
        "Continuing education support",
        "Professional development budget",
        "Stable healthcare environment"
      ],
      postedDate: DateTime(2023, 12, 28),
      categoryId: 'pharmacy',
      categoryName: 'Pharmacy',
    ),
    Job(
      id: 64,
      title: "Regulatory Affairs Specialist",
      company: "Pharmaceutical Company",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 13.000.000 - 20.000.000",
      description: "Regulatory Affairs Specialist untuk mengelola regulatory compliance dan drug registration. Kandidat harus memiliki pengalaman dalam pharmaceutical regulations dan BPOM processes.",
      requirements: [
        "Lulusan Farmasi atau Life Sciences",
        "Minimal 3 tahun pengalaman regulatory affairs",
        "Pemahaman BPOM regulations dan international guidelines",
        "Pengalaman drug registration dan clinical trials",
        "Detail-oriented dan project management skills"
      ],
      benefits: [
        "Gaji kompetitif dengan bonus regulatory",
        "Health insurance",
        "Professional certification support",
        "Training dan conference attendance",
        "Career development opportunities"
      ],
      postedDate: DateTime(2023, 12, 27),
      categoryId: 'pharmacy',
      categoryName: 'Pharmacy',
    ),

    // Media & Communication Jobs
    Job(
      id: 65,
      title: "Journalist",
      company: "News Media",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 7.000.000 - 12.000.000",
      description: "Journalist untuk meliput berita dan menulis artikel investigative. Kandidat harus memiliki passion untuk journalism dan kemampuan writing yang excellent.",
      requirements: [
        "Lulusan Jurnalistik, Komunikasi, atau related field",
        "Minimal 2 tahun pengalaman journalism",
        "Excellent writing dan reporting skills",
        "Kemampuan investigative research",
        "Media ethics dan objectivity"
      ],
      benefits: [
        "Gaji kompetitif dengan byline bonus",
        "Press card dan media privileges",
        "Health insurance",
        "Travel allowance untuk coverage",
        "Professional journalism development"
      ],
      postedDate: DateTime(2023, 12, 26),
      categoryId: 'media',
      categoryName: 'Media & Communication',
    ),
    Job(
      id: 66,
      title: "Content Creator",
      company: "Digital Media Agency",
      location: "Bandung",
      type: "Full-time",
      salary: "Rp 6.000.000 - 11.000.000",
      description: "Content Creator untuk membuat konten digital yang engaging di berbagai platform. Kandidat harus kreatif dan memiliki pengalaman dalam content creation dan social media.",
      requirements: [
        "Minimal 2 tahun pengalaman content creation",
        "Kemampuan video editing dan photography",
        "Pemahaman social media platforms dan trends",
        "Creative thinking dan storytelling skills",
        "Portfolio content creation yang strong"
      ],
      benefits: [
        "Gaji kompetitif",
        "Content creation equipment allowance",
        "Creative workspace environment",
        "Social media tools subscription",
        "Flexible working hours"
      ],
      postedDate: DateTime(2023, 12, 25),
      categoryId: 'media',
      categoryName: 'Media & Communication',
    ),

    // Hospitality & Tourism Jobs
    Job(
      id: 67,
      title: "Hotel Manager",
      company: "Luxury Resort",
      location: "Bali",
      type: "Full-time",
      salary: "Rp 15.000.000 - 25.000.000",
      description: "Hotel Manager untuk mengelola operasi hotel dan memastikan kepuasan tamu. Kandidat harus memiliki pengalaman dalam hospitality management dan leadership skills.",
      requirements: [
        "Minimal 5 tahun pengalaman hotel management",
        "Pengalaman dalam luxury hospitality",
        "Leadership dan team management skills",
        "Guest service excellence dan problem-solving",
        "Multi-language capabilities preferred"
      ],
      benefits: [
        "Gaji sangat kompetitif dengan bonus performance",
        "Accommodation allowance",
        "Health insurance premium",
        "Hotel industry networking",
        "International career opportunities"
      ],
      postedDate: DateTime(2023, 12, 24),
      categoryId: 'hospitality',
      categoryName: 'Hospitality & Tourism',
    ),
    Job(
      id: 68,
      title: "Tour Guide",
      company: "Adventure Tours",
      location: "Yogyakarta",
      type: "Part-time",
      salary: "Rp 3.000.000 - 7.000.000",
      description: "Tour Guide untuk memandu wisatawan mengunjungi destinasi wisata. Kandidat harus memiliki pengetahuan luas tentang sejarah dan budaya lokal.",
      requirements: [
        "Minimal 1 tahun pengalaman tour guiding",
        "Pengetahuan luas tentang sejarah dan budaya Yogyakarta",
        "Excellent communication dan presentation skills",
        "Multi-language capabilities",
        "Energetic dan customer service oriented"
      ],
      benefits: [
        "Gaji per tour plus tips",
        "Transportation allowance",
        "Tour guide certification support",
        "Flexible working schedule",
        "Tourism industry networking"
      ],
      postedDate: DateTime(2023, 12, 23),
      categoryId: 'hospitality',
      categoryName: 'Hospitality & Tourism',
    ),

    // Additional Technology Jobs
    Job(
      id: 69,
      title: "Technical Writer",
      company: "Tech Documentation",
      location: "Remote",
      type: "Full-time",
      salary: "Rp 8.000.000 - 14.000.000",
      description: "Technical Writer untuk membuat dokumentasi teknis yang comprehensive. Kandidat harus memiliki kemampuan menulis yang excellent dan pemahaman tentang teknologi.",
      requirements: [
        "Minimal 2 tahun pengalaman technical writing",
        "Excellent writing skills dalam Bahasa Indonesia dan Inggris",
        "Pemahaman software development dan API documentation",
        "Pengalaman dengan documentation tools",
        "Ability to simplify complex technical concepts"
      ],
      benefits: [
        "Gaji kompetitif",
        "100% remote working",
        "Documentation tools subscription",
        "Professional development budget",
        "Flexible working hours"
      ],
      postedDate: DateTime(2023, 12, 22),
      categoryId: 'technology',
      categoryName: 'Teknologi & IT',
    ),
    Job(
      id: 70,
      title: "Database Administrator",
      company: "Data Solutions",
      location: "Jakarta",
      type: "Full-time",
      salary: "Rp 12.000.000 - 20.000.000",
      description: "Database Administrator untuk mengelola dan mengoptimalkan database systems. Kandidat harus memiliki pengalaman dalam database management dan performance tuning.",
      requirements: [
        "Minimal 3 tahun pengalaman database administration",
        "Expertise dalam MySQL, PostgreSQL, Oracle, atau SQL Server",
        "Pengalaman dengan database optimization dan tuning",
        "Backup dan disaster recovery planning",
        "Monitoring dan troubleshooting skills"
      ],
      benefits: [
        "Gaji kompetitif dengan on-call allowance",
        "Database certification support",
        "Health insurance",
        "Professional development budget",
        "Career advancement opportunities"
      ],
      postedDate: DateTime(2023, 12, 21),
      categoryId: 'technology',
      categoryName: 'Teknologi & IT',
    )
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
      job.description.toLowerCase().contains(lowercaseQuery) ||
      job.categoryName.toLowerCase().contains(lowercaseQuery)
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

  static Future<List<Job>> getJobsByCategory(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _jobs.where((job) => 
      job.categoryId == categoryId
    ).toList();
  }

  static Future<Map<String, int>> getCategoryJobCounts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    Map<String, int> counts = {};
    
    for (var job in _jobs) {
      counts[job.categoryId] = (counts[job.categoryId] ?? 0) + 1;
    }
    
    return counts;
  }

  static Future<List<Job>> getRecentJobs({int limit = 10}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final sortedJobs = List<Job>.from(_jobs);
    sortedJobs.sort((a, b) => b.postedDate.compareTo(a.postedDate));
    return sortedJobs.take(limit).toList();
  }

  static Future<List<Job>> getJobsByCompany(String company) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _jobs.where((job) => 
      job.company.toLowerCase().contains(company.toLowerCase())
    ).toList();
  }
}