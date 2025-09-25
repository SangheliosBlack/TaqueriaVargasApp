import 'package:taqueria_vargas/features/orders/data/dtos/order_dto.dart';
import 'package:taqueria_vargas/features/orders/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class OrderMapper {
  
  static OrderEntity toEntity({required OrderDto dto}) {

    return OrderEntity(
      id: dto.id,
      date: dto.date,
      posStationId: dto.posStationId,
      totalAmount: dto.totalAmount,
      shiftDayStation: ShiftDayStationMapper.toEntity(dto.shiftDayStation),
      typeSale: TypeSaleMapper.toEntity( dto: dto.typeSale),
      status: OrderStatusMapper.toEntity(dto:dto.status),
      orderDetail:  OrderDetailMapper.toEntityList( dtos:dto.detailProducts), 
      orderUser: OrderUserMapper.toEntity(dto: dto.orderUser), 
      posStation: OrderPosStationMapper.toEntity(dto: dto.posStation),
      note: dto.note,
      shiftConsecutive: dto.shiftConsecutive
    );
  }

  static List<OrderEntity> toEntityList({required List<OrderDto> dto}) {

    return dto.map((orderDto) => toEntity(dto: orderDto)).toList();

  }

  static Map<int, OrderEntity> toSaleEntityMap({required List<OrderDto> dtoList}) {
  return {
    
    for (var orderDto in dtoList)
      orderDto.id: toEntity(dto: orderDto)
  };
}
  
}
