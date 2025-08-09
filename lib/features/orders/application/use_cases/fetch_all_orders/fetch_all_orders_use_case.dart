import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/domain/repositories/orders_repository.dart';

class FetchAllOrdersUseCase {

  final OrdersRepository ordersRepository;

  FetchAllOrdersUseCase({required this.ordersRepository});

  Future<DataState<Map<int, OrderEntity>>> execute(){

    return ordersRepository.fetchAllOrders();

  }  

}