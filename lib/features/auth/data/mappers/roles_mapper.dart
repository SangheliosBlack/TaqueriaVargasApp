import 'package:taqueria_vargas/features/auth/data/data.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';

class RolesMapper {

  static List<RoleEntity> fromDtoList(List<RolesDto> rolesDto) {
    return rolesDto.map((roleDto) => RoleEntity(
      id: roleDto.id,
      code: roleDto.code, 
      description: roleDto.description, 
      saleTypes: SaleTypeMapper.toEntityList(roleDto.saleTypes),
    )).toList();
  }

}