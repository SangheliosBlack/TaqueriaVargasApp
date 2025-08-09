import 'package:taqueria_vargas/features/auth/domain/entities/entities.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String? imgProfile;

  @HiveField(5)
  final List<RoleEntity> roles;

  @HiveField(6)
  final CompanyEntity company;

  @HiveField(7)
  PosInfoEntity posInfo;

  @HiveField(8)
  final bool isOpenToday;

  bool get isCashier => roles.any((role) => role.code == 'POS');
  bool get isAdmin => roles.any((role) => role.code == 'ADMIN');
  bool get isWaiter => roles.any((role) => role.code == 'MES');

  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    this.imgProfile,
    required this.roles,
    required this.company,
    required this.posInfo,
    required this.isOpenToday
  });

  UserEntity copyWith({
    int? id,
    String? email,
    String? fullName,
    String? phone,
    List<RoleEntity>? roles,
    String? imgProfile,
    CompanyEntity? company,
    PosInfoEntity? posInfo,
    bool? isOpenToday
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      imgProfile: imgProfile ?? this.imgProfile,
      roles: roles ?? this.roles,
      company: company ?? this.company,
      posInfo : posInfo ?? this.posInfo,
      isOpenToday : isOpenToday ?? this.isOpenToday
    );
  }
}
