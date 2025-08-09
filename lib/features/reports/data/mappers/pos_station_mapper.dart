import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_dto.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/pos_station_user_mapper.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/post_station_register_mapper.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';

class PosStationMapper {

  static PosStationEntity fromDto({required PosStationDto dto}) {

    return PosStationEntity(
      id: dto.id,
      openingDate: dto.openingDate,
      active: dto.active,
      closedAt: dto.closedAt,
      shiftStations: PostStationRegisterMapper.toEntityList(dtos: dto.shiftStations),
      createdBy: PostStationUserMapper.toEntity(dto: dto.createdBy),
      closedBy: dto.closedBy != null ? PostStationUserMapper.toEntity(dto: dto.closedBy!) : null,
    );
    
  }

  static List<PosStationEntity> fromDtoList(List<PosStationDto> dtos) {

    return dtos.map((dto) => fromDto(dto:dto)).toList();

  }

}