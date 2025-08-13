import 'dart:math';

import 'package:taqueria_vargas/core/resources/mappable.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_user_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/post_station_register_entity.dart';

class PosStationEntity extends Mappable {

  final int id; 
  final DateTime openingDate;
  bool active;
  final DateTime? closedAt;
  final List<PostStationRegisterEntity> shiftStations;
  final PosStationUserEntity createdBy;
  final PosStationUserEntity? closedBy;

  PosStationEntity({
    required this.id,
    required this.openingDate,
    required this.active,
    this.closedAt,
    required this.shiftStations,
    required this.createdBy,
    this.closedBy
  });

  int get posActive {

    if(shiftStations.isEmpty) return 0;

    final count = shiftStations.where((e) => e.endTime != null).length;

    return count;

  }
  
  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  PosStationEntity copyWith({
    int? id,
    DateTime? openingDate,
    bool? active,
    DateTime? closedAt,
    List<PostStationRegisterEntity>? shiftStations,
    PosStationUserEntity? createdBy,
    PosStationUserEntity? closedBy,
  }) {
    return PosStationEntity(
      id: id ?? this.id,
      openingDate: openingDate ?? this.openingDate,
      active: active ?? this.active,
      closedAt: closedAt ?? this.closedAt,
      shiftStations: shiftStations ?? this.shiftStations,
      createdBy: createdBy ?? this.createdBy,
      closedBy: closedBy ?? this.closedBy,
    );
  }


}