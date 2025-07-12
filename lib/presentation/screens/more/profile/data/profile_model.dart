class UserModelProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatar;
  final String role;

  UserModelProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatar,
    required this.role,
  });

  // تحويل الـ JSON إلى نموذج
  factory UserModelProfile.fromJson(Map<String, dynamic> json) {
    return UserModelProfile(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'],
      role: json['role'] ?? '',
    );
  }

  // تحويل النموذج إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'avatar': avatar,
      'role': role,
    };
  }

  // إرجاع الاسم الكامل للمستخدم
  String get fullName => '$firstName $lastName';
}
