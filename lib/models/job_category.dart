import 'package:flutter/material.dart';

class JobCategory {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final int jobCount;

  const JobCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.jobCount = 0,
  });

  JobCategory copyWith({
    String? id,
    String? name,
    String? description,
    IconData? icon,
    Color? color,
    int? jobCount,
  }) {
    return JobCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      jobCount: jobCount ?? this.jobCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'jobCount': jobCount,
    };
  }

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    return JobCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: Icons.work, // Default icon
      color: Colors.blue, // Default color
      jobCount: json['jobCount'] ?? 0,
    );
  }

  static const List<JobCategory> categories = [
    // Technology & Engineering
    JobCategory(
      id: 'technology',
      name: 'Teknologi & IT',
      description: 'Software Developer, DevOps, Cybersecurity',
      icon: Icons.computer,
      color: Colors.blue,
    ),
    JobCategory(
      id: 'mobile_dev',
      name: 'Mobile Development',
      description: 'iOS, Android, Flutter, React Native',
      icon: Icons.smartphone,
      color: Colors.cyan,
    ),
    JobCategory(
      id: 'data_science',
      name: 'Data Science & AI',
      description: 'Data Analyst, Machine Learning, AI Engineer',
      icon: Icons.analytics,
      color: Colors.deepPurple,
    ),
    JobCategory(
      id: 'devops',
      name: 'DevOps & Cloud',
      description: 'AWS, Docker, Kubernetes, CI/CD',
      icon: Icons.cloud_queue,
      color: Colors.orange,
    ),
    JobCategory(
      id: 'cybersecurity',
      name: 'Cybersecurity',
      description: 'Security Analyst, Penetration Testing',
      icon: Icons.security,
      color: Colors.red,
    ),

    // Design & Creative
    JobCategory(
      id: 'design',
      name: 'Design & Creative',
      description: 'UI/UX, Graphic Design, Motion Graphics',
      icon: Icons.design_services,
      color: Colors.purple,
    ),
    JobCategory(
      id: 'ui_ux',
      name: 'UI/UX Design',
      description: 'User Interface, User Experience Design',
      icon: Icons.web,
      color: Colors.pink,
    ),
    JobCategory(
      id: 'graphic_design',
      name: 'Graphic Design',
      description: 'Visual Design, Branding, Print Design',
      icon: Icons.palette,
      color: Colors.indigo,
    ),
    JobCategory(
      id: 'video_animation',
      name: 'Video & Animation',
      description: 'Motion Graphics, Video Editor, 3D Animation',
      icon: Icons.video_call,
      color: Colors.deepOrange,
    ),

    // Marketing & Sales
    JobCategory(
      id: 'marketing',
      name: 'Marketing & Sales',
      description: 'Digital Marketing, Content Marketing, SEO',
      icon: Icons.campaign,
      color: Colors.green,
    ),
    JobCategory(
      id: 'digital_marketing',
      name: 'Digital Marketing',
      description: 'SEM, Social Media, Email Marketing',
      icon: Icons.trending_up,
      color: Colors.lightGreen,
    ),
    JobCategory(
      id: 'content_marketing',
      name: 'Content Marketing',
      description: 'Content Writer, Copywriter, SEO Specialist',
      icon: Icons.edit,
      color: Colors.teal,
    ),
    JobCategory(
      id: 'sales',
      name: 'Sales & Business Dev',
      description: 'Account Manager, Sales Representative',
      icon: Icons.handshake,
      color: Colors.amber,
    ),

    // Business & Finance
    JobCategory(
      id: 'finance',
      name: 'Finance & Accounting',
      description: 'Financial Analyst, Accountant, Auditor',
      icon: Icons.account_balance,
      color: Colors.green,
    ),
    JobCategory(
      id: 'consulting',
      name: 'Consulting',
      description: 'Management Consultant, Business Analyst',
      icon: Icons.business_center,
      color: Colors.brown,
    ),
    JobCategory(
      id: 'banking',
      name: 'Banking & Investment',
      description: 'Investment Banking, Wealth Management',
      icon: Icons.account_balance_wallet,
      color: Colors.indigo,
    ),
    JobCategory(
      id: 'insurance',
      name: 'Insurance',
      description: 'Insurance Agent, Risk Management',
      icon: Icons.health_and_safety,
      color: Colors.blueGrey,
    ),

    // Management & Leadership
    JobCategory(
      id: 'management',
      name: 'Management',
      description: 'Project Manager, Team Lead, Operations',
      icon: Icons.supervisor_account,
      color: Colors.indigo,
    ),
    JobCategory(
      id: 'product_management',
      name: 'Product Management',
      description: 'Product Manager, Product Owner, Strategy',
      icon: Icons.inventory,
      color: Colors.deepPurple,
    ),
    JobCategory(
      id: 'operations',
      name: 'Operations',
      description: 'Operations Manager, Process Improvement',
      icon: Icons.settings,
      color: Colors.blueGrey,
    ),

    // Human Resources
    JobCategory(
      id: 'hr',
      name: 'Human Resources',
      description: 'HR Manager, Recruiter, Training Specialist',
      icon: Icons.people,
      color: Colors.orange,
    ),
    JobCategory(
      id: 'recruitment',
      name: 'Recruitment',
      description: 'Talent Acquisition, HR Business Partner',
      icon: Icons.person_search,
      color: Colors.deepOrange,
    ),

    // Education & Training
    JobCategory(
      id: 'education',
      name: 'Education & Training',
      description: 'Teacher, Trainer, Curriculum Developer',
      icon: Icons.school,
      color: Colors.blue,
    ),
    JobCategory(
      id: 'elearning',
      name: 'E-Learning',
      description: 'Instructional Designer, Online Educator',
      icon: Icons.laptop_mac,
      color: Colors.lightBlue,
    ),

    // Healthcare & Medical
    JobCategory(
      id: 'healthcare',
      name: 'Healthcare & Medical',
      description: 'Doctor, Nurse, Medical Technician',
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    JobCategory(
      id: 'pharmacy',
      name: 'Pharmacy',
      description: 'Pharmacist, Pharmaceutical Sales',
      icon: Icons.medical_services,
      color: Colors.green,
    ),

    // Legal & Compliance
    JobCategory(
      id: 'legal',
      name: 'Legal & Compliance',
      description: 'Lawyer, Legal Counsel, Compliance Officer',
      icon: Icons.gavel,
      color: Colors.brown,
    ),

    // Media & Communication
    JobCategory(
      id: 'media',
      name: 'Media & Communication',
      description: 'Journalist, PR Specialist, Communications',
      icon: Icons.mic,
      color: Colors.purple,
    ),
    JobCategory(
      id: 'public_relations',
      name: 'Public Relations',
      description: 'PR Manager, Communications Specialist',
      icon: Icons.campaign,
      color: Colors.pink,
    ),

    // Engineering & Manufacturing
    JobCategory(
      id: 'engineering',
      name: 'Engineering',
      description: 'Mechanical, Civil, Electrical Engineer',
      icon: Icons.engineering,
      color: Colors.orange,
    ),
    JobCategory(
      id: 'manufacturing',
      name: 'Manufacturing',
      description: 'Production Manager, Quality Control',
      icon: Icons.factory,
      color: Colors.brown,
    ),

    // Logistics & Supply Chain
    JobCategory(
      id: 'logistics',
      name: 'Logistics & Supply Chain',
      description: 'Supply Chain Manager, Warehouse Operations',
      icon: Icons.local_shipping,
      color: Colors.indigo,
    ),

    // Customer Service
    JobCategory(
      id: 'customer_service',
      name: 'Customer Service',
      description: 'Customer Support, Call Center, CRM',
      icon: Icons.support_agent,
      color: Colors.teal,
    ),

    // Hospitality & Tourism
    JobCategory(
      id: 'hospitality',
      name: 'Hospitality & Tourism',
      description: 'Hotel Management, Travel Agent, Tourism',
      icon: Icons.hotel,
      color: Colors.amber,
    ),

    // Retail & E-commerce
    JobCategory(
      id: 'retail',
      name: 'Retail & E-commerce',
      description: 'Store Manager, E-commerce Specialist',
      icon: Icons.shopping_bag,
      color: Colors.green,
    ),

    // Real Estate & Property
    JobCategory(
      id: 'real_estate',
      name: 'Real Estate',
      description: 'Property Agent, Real Estate Development',
      icon: Icons.home,
      color: Colors.brown,
    ),

    // Agriculture & Food
    JobCategory(
      id: 'agriculture',
      name: 'Agriculture & Food',
      description: 'Agricultural Specialist, Food Technology',
      icon: Icons.agriculture,
      color: Colors.green,
    ),

    // Transportation
    JobCategory(
      id: 'transportation',
      name: 'Transportation',
      description: 'Driver, Fleet Manager, Logistics Coordinator',
      icon: Icons.directions_bus,
      color: Colors.blue,
    ),

    // Government & Public Service
    JobCategory(
      id: 'government',
      name: 'Government & Public Service',
      description: 'Civil Servant, Public Administration',
      icon: Icons.account_balance,
      color: Colors.indigo,
    ),

    // Others
    JobCategory(
      id: 'others',
      name: 'Others',
      description: 'Miscellaneous opportunities',
      icon: Icons.work,
      color: Colors.grey,
    ),
  ];

  static JobCategory? findById(String id) {
    try {
      return categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<JobCategory> getPopularCategories() {
    return categories.where((category) => [
      'technology',
      'mobile_dev',
      'data_science',
      'design',
      'ui_ux',
      'marketing',
      'digital_marketing',
      'finance',
      'management',
      'hr',
    ].contains(category.id)).toList();
  }

  static List<JobCategory> getTechCategories() {
    return categories.where((category) => [
      'technology',
      'mobile_dev',
      'data_science',
      'devops',
      'cybersecurity',
    ].contains(category.id)).toList();
  }

  static List<JobCategory> getBusinessCategories() {
    return categories.where((category) => [
      'marketing',
      'sales',
      'finance',
      'consulting',
      'banking',
      'management',
      'hr',
    ].contains(category.id)).toList();
  }

  static List<JobCategory> getCreativeCategories() {
    return categories.where((category) => [
      'design',
      'ui_ux',
      'graphic_design',
      'video_animation',
      'content_marketing',
      'media',
    ].contains(category.id)).toList();
  }
}