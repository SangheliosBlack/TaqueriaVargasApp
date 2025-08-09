class ShiftDayStationDto {

  int posStationId;

  ShiftDayStationDto({
      required this.posStationId,
  });

  factory ShiftDayStationDto.fromJson(Map<String, dynamic> json) => ShiftDayStationDto(
      posStationId: json["pos_station_id"],
  );
    
}