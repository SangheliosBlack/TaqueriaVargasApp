import 'package:taqueria_vargas/features/auth/data/dtos/user_dto.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/company_mapper.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/pos_info_mapper.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/roles_mapper.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';


class UserMapper {
  
  static UserEntity toEntity(UserDTO dto) {

    return UserEntity(
      id: dto.id,
      fullName: dto.fullName,
      email: dto.email, 
      phone: dto.phone, 
      roles: RolesMapper.fromDtoList(dto.roles), 
      company: CompanyMapper.fromDto(dto.company),
      posInfo: PosInfoMapper.toEntity(dto: dto.posInfo),
      isOpenToday: dto.isOpenToday,
    );

  }

}

