import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';

class RolesDto {

  final int id;
  final String code;
  final String description;
  final List<SaleTypeDto> saleTypes;

  RolesDto({
    required this.id,
    required this.code,
    required this.description,
    required this.saleTypes,
  });

  factory RolesDto.fromJson(Map<String, dynamic> json) {
    return RolesDto(
      id: json['id'] as int,
      code: json['code'] as String,
      description: json['description'] as String, 
      saleTypes: SaleTypeDto.fromJsonList(json['saleTypes']),
    );
  }

  static List<RolesDto> fromJsonList(List<dynamic> jsonList) {

    return jsonList.map((json) => RolesDto.fromJson(json as Map<String, dynamic>)).toList();

  }
  
}