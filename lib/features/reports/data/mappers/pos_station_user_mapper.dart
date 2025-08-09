import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_user_dto.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_user_entity.dart';

class PostStationUserMapper {

  static PosStationUserEntity toEntity({required PosStationUserDto dto}) {

    return PosStationUserEntity(
      id: dto.id, 
      fullName: dto.fullName,
      phone: dto.phone, 
      email: dto.email
    );

  }

}