import 'package:taqueria_vargas/features/reports/data/dtos/dtos.dart';

class PostStationRegisterDto {

  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final String initialAmount;
  final String? finalAmount;
  final PosStationTrackDto posStation;
  final PosStationUserDto user;
  final PosStationUserDto? closedBy;

  PostStationRegisterDto({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.initialAmount,
    this.finalAmount,
    required this.posStation,
    required this.user,
    this.closedBy,
  });

  factory PostStationRegisterDto.fromJson(Map<String, dynamic> json) {

    return PostStationRegisterDto(
      id: json['id'] as int,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time'] as String) : null,
      initialAmount: json['initial_amount'] as String,
      finalAmount: json['final_amount'] as String?,
      posStation: PosStationTrackDto.fromJson(json['posStation'] as Map<String, dynamic>),
      user: PosStationUserDto.fromJson(json['user'] as Map<String, dynamic>),
      closedBy: json['closedBy'] != null ? PosStationUserDto.fromJson(json['closedBy'] as Map<String, dynamic>) : null,
    );

  }

  static List<PostStationRegisterDto> fromJsonList(List<dynamic> list) {

    return list.map((item) => PostStationRegisterDto.fromJson(item as Map<String, dynamic>)).toList();

  }

}