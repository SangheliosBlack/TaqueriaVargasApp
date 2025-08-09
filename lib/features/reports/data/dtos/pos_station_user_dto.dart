class PosStationUserDto {
  final int id;
  final String fullName;
  final String phone;
  final String email;

  PosStationUserDto({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
  });

  factory PosStationUserDto.fromJson(Map<String, dynamic> json) {
    return PosStationUserDto(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }
}