class EmployeeDto {

  int id;
  String fullName;
  String phone;
  int userId;
  int companyBranchId;

  EmployeeDto({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.userId,
    required this.companyBranchId,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) => EmployeeDto(
    id: json["id"],
    fullName: json["full_name"],
    phone: json["phone"],
    userId: json["user_id"],
    companyBranchId: json["company_branch_id"],
  );

}
