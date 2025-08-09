import 'package:taqueria_vargas/features/reports/data/dtos/post_station_register_dto.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/pos_station_user_mapper.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/post_station_track_mapper.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/post_station_register_entity.dart';

class PostStationRegisterMapper {

  static PostStationRegisterEntity toEntity({required PostStationRegisterDto dto}) {
    return PostStationRegisterEntity(
      id: dto.id,
      startTime: dto.startTime,
      endTime: dto.endTime,
      initialAmount: dto.initialAmount,
      finalAmount: dto.finalAmount,
      posStation: PostStationTrackMapper.toEntity(dto: dto.posStation),
      user: PostStationUserMapper.toEntity(dto: dto.user),
      closedBy: dto.closedBy != null ? PostStationUserMapper.toEntity(dto: dto.closedBy!) : null,
    );
  }

  static List<PostStationRegisterEntity> toEntityList({required List<PostStationRegisterDto> dtos}) {
    return dtos.map((dto) => toEntity(dto: dto)).toList();
  }

}