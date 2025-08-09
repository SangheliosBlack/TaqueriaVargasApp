class GetAllRegisterTurnsRequestDto {

  final int companyBranchId;
  final int page;
  final int pageSize;

  GetAllRegisterTurnsRequestDto({
    required this.companyBranchId,
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'company_branch_id': companyBranchId,
      'page': page,
      'pageSize': pageSize,
    };
  }

}