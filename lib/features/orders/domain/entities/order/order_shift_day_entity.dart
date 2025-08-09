class ShiftDayStationEntity {

  int posStationId;

  ShiftDayStationEntity({
      required this.posStationId,
  });

  factory ShiftDayStationEntity.fromJson(Map<String, dynamic> json) => ShiftDayStationEntity(
      posStationId: json["pos_station_id"],
  );
    
}