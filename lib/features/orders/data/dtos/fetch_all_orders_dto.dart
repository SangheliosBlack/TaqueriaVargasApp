import 'package:taqueria_vargas/core/resources/pagination_dto.dart';
import 'package:taqueria_vargas/features/orders/data/dtos/order_dto.dart';

class FetchAllOrdersResponseDto {

  final List<OrderDto> orders;
  final Meta? meta;

  FetchAllOrdersResponseDto({required this.orders,required this.meta});

  factory FetchAllOrdersResponseDto.fromJson({required List<dynamic> data,required Meta meta}) {

    return FetchAllOrdersResponseDto(
      orders: data.map((json) => OrderDto.fromJson(json)).toList(),
      meta: meta
    );

  }
  
}