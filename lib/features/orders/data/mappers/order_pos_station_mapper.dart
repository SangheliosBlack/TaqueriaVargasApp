import 'package:taqueria_vargas/features/orders/data/dtos/order_pos_station_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_pos_station_entity.dart';

class OrderPosStationMapper {

  static OrderPosStationEntity toEntity({required OrderPosStationDto dto}) {
    return OrderPosStationEntity(
      id: dto.id,
      name: dto.name,
    );
  }


}
