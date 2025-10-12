class GetAllOrdersAdminRequest {

  final DateTime? startDate;
  final DateTime? endDate;

  GetAllOrdersAdminRequest({this.startDate, this.endDate});

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
    };
  }

}