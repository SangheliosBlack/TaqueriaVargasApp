
import 'package:taqueria_vargas/features/auth/data/dtos/sale_type_dto.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/sale_type_entity.dart';

class SaleTypeMapper {
  static SaleTypeEntity toEntity(SaleTypeDto dto) {
    return SaleTypeEntity(
      id: dto.id,
      code: dto.code,
      description: dto.description, 
      value: dto.value,
    );
  }

  static List<SaleTypeEntity> toEntityList(List<SaleTypeDto> dtoList) {
    return dtoList.map(toEntity).toList();
  }
}
