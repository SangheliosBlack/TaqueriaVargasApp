import 'package:taqueria_vargas/features/orders/data/dtos/shift_day_station_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_shift_day_entity.dart';

class ShiftDayStationMapper {

  static ShiftDayStationEntity toEntity(ShiftDayStationDto dto) {

    return ShiftDayStationEntity(
      posStationId: dto.posStationId,
    );
    
  }

}