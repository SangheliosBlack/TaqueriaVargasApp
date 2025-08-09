class OrderPosStationDto {

  int id;
  String name;

  OrderPosStationDto({
    required this.id,
    required this.name,
  });

  factory OrderPosStationDto.fromJson(Map<String, dynamic> json) => OrderPosStationDto(
      id: json["id"],
      name: json["name"],
  );

}
