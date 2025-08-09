
class SaleTypeDto {

  int id;
  String code;
  String description;
  String value;

  SaleTypeDto({
    required this.id,
    required this.code,
    required this.description,
    required this.value
  });

  factory SaleTypeDto.fromJson(Map<String, dynamic> json) => SaleTypeDto(
    id: json["id"],
    code: json["code"],
    description: json["description"],
    value: json["value"] ?? "",
  );

  static List<SaleTypeDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SaleTypeDto.fromJson(json as Map<String, dynamic>)).toList();
  }


}

