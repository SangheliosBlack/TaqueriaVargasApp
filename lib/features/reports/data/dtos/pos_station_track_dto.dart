class PosStationTrackDto {
  final int id;
  final String code;
  final String name;
  final String posGuid;

  PosStationTrackDto({
    required this.id,
    required this.code,
    required this.name,
    required this.posGuid,
  });

  factory PosStationTrackDto.fromJson(Map<String, dynamic> json) {
    return PosStationTrackDto(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      posGuid: json['pos_guid'] as String,
    );
  }
}