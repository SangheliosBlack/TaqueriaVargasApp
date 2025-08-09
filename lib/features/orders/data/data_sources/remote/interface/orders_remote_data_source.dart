import 'package:taqueria_vargas/features/orders/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';
import 'package:taqueria_vargas/core/core.dart';

abstract interface class OrdersRemoteDataSource {

  Future<DataState<OrderDto>> createOrder({required CreateOrderRequestEntity request});
  Future<DataState<FetchAllOrdersResponseDto>> fetchAllOrders();
  Future<DataState<ProductDetailOrderDto>> getDetailOrder({required int orderId});

}