import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/data/data.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/entities.dart';

abstract interface class OrdersRepository{

  Future<DataState<OrderEntity>> createOrder({required CreateOrderRequestEntity request});
  Future<DataState<Map<int, OrderEntity>>> fetchAllOrders();
  Future<DataState<ProductDetailOrderDto>> getDetailOrder({required int orderId});

}
