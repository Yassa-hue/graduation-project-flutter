enum UserRole {
  donor,
  volunteer,
  organization,
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final UserRole role;
  final String profileImageUrl;


  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.profileImageUrl,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: _parseUserRole(json['role']),
      profileImageUrl: json['profileImageUrl'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last,
      'profileImageUrl': profileImageUrl,
    };
  }

  static UserRole _parseUserRole(String role) {
    switch (role) {
      case 'donor':
        return UserRole.donor;
      case 'volunteer':
        return UserRole.volunteer;
      case 'organization':
        return UserRole.organization;
      default:
        throw ArgumentError('Invalid user role: $role');
    }
  }
}
