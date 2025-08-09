import 'package:taqueria_vargas/core/core.dart';

class EmployeeEntity extends Mappable {

  int id;
  String fullName;
  String phone;
  int userId;
  int companyBranchId;

  EmployeeEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.userId,
    required this.companyBranchId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'phone': phone,
      'user_id': userId,
      'company_branch_id': companyBranchId,
    };
  }

  EmployeeEntity copyWith({
    int? id,
    String? fullName,
    String? phone,
    int? userId,
    int? companyBranchId,
  }) {
    return EmployeeEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      userId: userId ?? this.userId,
      companyBranchId: companyBranchId ?? this.companyBranchId,
    );
  }
  
}
