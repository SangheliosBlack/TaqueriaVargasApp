import 'package:taqueria_vargas/core/resources/pagination_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class FetchAllOrdersResponseEntity {

  final Map<int, OrderEntity> orders;
  final Meta? meta;

  FetchAllOrdersResponseEntity({
    required this.orders,
    required this.meta
  });
  
}