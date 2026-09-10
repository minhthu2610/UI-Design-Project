class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String role; // 'HocVien', 'GiaoVien', etc.
  final String? avatar;
  final String? phone;
  final String? gender;
  final String? birthDate;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    this.avatar,
    this.phone,
    this.gender,
    this.birthDate,
  });
}
