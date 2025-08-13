import 'package:taqueria_vargas/features/auth/domain/entities/entities.dart';
import 'package:hive/hive.dart';

part 'role_entity.g.dart';

@HiveType(typeId: 1)
class RoleEntity {
  
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String description;

  @HiveField(3)
  List<SaleTypeEntity> saleTypes;

  RoleEntity({
    required this.id,
    required this.code,
    required this.description,
    required this.saleTypes,
  });

  RoleEntity copyWith({
    int? id,
    String? code,
    String? description,
    List<SaleTypeEntity>? saleTypes
  }) {
    return RoleEntity(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      saleTypes: saleTypes ?? this.saleTypes,
    );
  }
  
}