import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_user_dto.dart';
import 'package:taqueria_vargas/features/reports/data/dtos/post_station_register_dto.dart';

class PosStationDto {
  final int id;
  final DateTime openingDate;
  final bool active;
  final DateTime? closedAt;
  final List<PostStationRegisterDto> shiftStations;
  final PosStationUserDto createdBy;  
  final PosStationUserDto? closedBy;
  

  PosStationDto({
    required this.id,
    required this.openingDate,
    required this.active,
    this.closedAt,
    required this.shiftStations,
    required this.createdBy,
    this.closedBy,
  });

  factory PosStationDto.fromJson(Map<String, dynamic> json) {

    return PosStationDto(
      id: json['id'] as int,
      openingDate: DateTime.parse(json['opening_date']),
      active: json['active'] as bool,
      closedAt: json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null,
      shiftStations: (json['shiftStations'] as List<dynamic>).map((e) => PostStationRegisterDto.fromJson(e as Map<String, dynamic>)).toList(), 
      createdBy: PosStationUserDto.fromJson(json['createdBy'] as Map<String, dynamic>),
      closedBy: json['closedBy'] != null ? PosStationUserDto.fromJson(json['closedBy'] as Map<String, dynamic>) : null,
    );
  }

  static List<PosStationDto> fromJsonList(List<dynamic> jsonList) {

    return jsonList.map((json) => PosStationDto.fromJson(json as Map<String, dynamic>)).toList();
    
  }
}