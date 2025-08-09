import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_track_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_user_entity.dart';

class PostStationRegisterEntity {

  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final String initialAmount;
  final String? finalAmount;
  final PosStationTrackEntity posStation;
  final PosStationUserEntity user;
  final PosStationUserEntity?closedBy;

  PostStationRegisterEntity({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.initialAmount,
    this.finalAmount,
    required this.posStation,
    required this.user,
    this.closedBy,
  });

}