class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final String? photoURL;
  final String? phone;
  final String? address;
  final String? education;
  final String? experience;
  final String? skills;
  final String? bio;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEmailVerified;
  final Map<String, dynamic>? preferences;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    this.photoURL,
    this.phone,
    this.address,
    this.education,
    this.experience,
    this.skills,
    this.bio,
    required this.createdAt,
    required this.updatedAt,
    this.isEmailVerified = false,
    this.preferences,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'photoURL': photoURL,
      'phone': phone,
      'address': address,
      'education': education,
      'experience': experience,
      'skills': skills,
      'bio': bio,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isEmailVerified': isEmailVerified,
      'preferences': preferences,
    };
  }

  // Create from Map (Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      photoURL: map['photoURL'],
      phone: map['phone'],
      address: map['address'],
      education: map['education'],
      experience: map['experience'],
      skills: map['skills'],
      bio: map['bio'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isEmailVerified: map['isEmailVerified'] ?? false,
      preferences: map['preferences'],
    );
  }

  // Copy with method for updates
  UserModel copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? photoURL,
    String? phone,
    String? address,
    String? education,
    String? experience,
    String? skills,
    String? bio,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    Map<String, dynamic>? preferences,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      photoURL: photoURL ?? this.photoURL,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      skills: skills ?? this.skills,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      preferences: preferences ?? this.preferences,
    );
  }

  // Get display name
  String get displayName => fullName.isNotEmpty ? fullName : email.split('@')[0];

  // Get initials for avatar
  String get initials {
    if (fullName.isEmpty) return email.substring(0, 1).toUpperCase();
    
    List<String> names = fullName.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    } else {
      return names[0].substring(0, 1).toUpperCase();
    }
  }

  // Check if profile is complete
  bool get isProfileComplete {
    return fullName.isNotEmpty &&
           phone != null &&
           address != null &&
           education != null &&
           experience != null;
  }

  // Get completion percentage
  double get profileCompletionPercentage {
    int completedFields = 0;
    int totalFields = 7; // fullName, phone, address, education, experience, skills, bio

    if (fullName.isNotEmpty) completedFields++;
    if (phone != null && phone!.isNotEmpty) completedFields++;
    if (address != null && address!.isNotEmpty) completedFields++;
    if (education != null && education!.isNotEmpty) completedFields++;
    if (experience != null && experience!.isNotEmpty) completedFields++;
    if (skills != null && skills!.isNotEmpty) completedFields++;
    if (bio != null && bio!.isNotEmpty) completedFields++;

    return (completedFields / totalFields) * 100;
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;
}