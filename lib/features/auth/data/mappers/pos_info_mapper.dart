
import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/pos_info_entity.dart';

class PosInfoMapper {
  
  static PosInfoEntity? toEntity({required PosInfoDto? dto}) {

    if(dto == null) return null;

    return PosInfoEntity(
      id: dto.id,
      code: dto.code,
      name: dto.name,
    );
  }
  
}
