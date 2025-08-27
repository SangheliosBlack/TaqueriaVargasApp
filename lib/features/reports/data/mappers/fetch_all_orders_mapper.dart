import 'package:taqueria_vargas/features/orders/data/dtos/fetch_all_orders_dto.dart';
import 'package:taqueria_vargas/features/orders/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/fetch_all_orders_response_entity.dart';

class FetchAllOrdersMapper {

  static FetchAllOrdersResponseEntity toEntity({required FetchAllOrdersResponseDto dto}) {

    return FetchAllOrdersResponseEntity(
      orders: OrderMapper.toSaleEntityMap(dtoList: dto.orders),
      meta: dto.meta,
    );

  }

}