

import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';

class UserDTO {

  final int id;
  final String email;
  final String fullName;
  final String phone;
  final String? imgProfile;
  final List<RolesDto> roles;
  final CompanyDto company;
  final PosInfoDto? posInfo;
  final bool? isOpenToday;
  final bool? isOpenPosStation;

  UserDTO({
    required this.id,
    required this.email, 
    required this.fullName, 
    required this.phone,
    required this. imgProfile,
    required this.roles,
    required this.company,
    required this.posInfo,
    required this.isOpenToday,
    required this.isOpenPosStation
  });

  factory UserDTO.fromJson(Map<String, dynamic> map) {

    return UserDTO(
      id: map['id'],
      email: map['email'],
      fullName: map['full_name'],
      phone: map['phone'],
      imgProfile : map['img_profile'], 
      roles: RolesDto.fromJsonList(map['roles']), 
      company: CompanyDto.fromJson(map['company']), 
      posInfo: map['pos'] != null ? PosInfoDto.fromJson(map['pos']) : null, 
      isOpenToday: map['isOpenToday'] ?? false, 
      isOpenPosStation: map['isOpenPosStation'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
    };
  }

}