class PosInfoDto {

  int id;
  String code;
  String name;

  PosInfoDto({
    required this.id,
    required this.code,
    required this.name,
  });

  factory PosInfoDto.fromJson(Map<String, dynamic> json) => PosInfoDto(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

}
