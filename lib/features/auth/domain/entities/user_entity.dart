import 'package:taqueria_vargas/features/auth/domain/entities/entities.dart';
import 'package:hive/hive.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/orders_screen.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/screens/po_home_screen.dart';
import 'package:taqueria_vargas/features/reports/presentation/screens/reports_screen.dart';
import 'package:taqueria_vargas/features/table_management/presentation/screens/table_management_screen.dart';

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
  PosInfoEntity? posInfo;

  @HiveField(8)
  final bool? isOpenToday;

  bool get isCashier => roles.any((role) => role.code == 'POS');
  bool get isAdmin => roles.any((role) => role.code == 'ADMIN');
  bool get isWaiter => roles.any((role) => role.code == 'MES');

  bool hasAcces({required String path}){

    final role = roles.first.code;

    if(role == "POS"){

      if(path == OrdersScreen.path || path == ReportsScreen.path){

        return true;

      }

      return false;


    }

    if(role == "MES"){

       if(path == OrdersScreen.path || path == ReportsScreen.path || path == TableManagementScreen.path || path == PoHomeScreen.path ){

        return true;

      }

      return false;     

    }

    if(role == "ADMIN") {

       if(path == PoHomeScreen.path) return false;

       return true;

    }

    return false;

  }

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
