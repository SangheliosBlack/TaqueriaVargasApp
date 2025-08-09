import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_track_dto.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_track_entity.dart';

class PostStationTrackMapper {

  static PosStationTrackEntity toEntity({required PosStationTrackDto dto}) {

    return PosStationTrackEntity(
      id: dto. id, 
      code: dto. code, 
      name: dto. name, 
      posGuid: dto. posGuid
    );

  }

}