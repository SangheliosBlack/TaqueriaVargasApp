import 'package:taqueria_vargas/features/orders/domain/repositories/repositories.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/entities.dart';
import 'package:taqueria_vargas/core/core.dart';

class CreaseOrderUseCase {

  final OrdersRepository ordersRepository;

  CreaseOrderUseCase({required this.ordersRepository});
  
  Future<DataState<OrderEntity>> call({required CreateOrderRequestEntity request}){

    return ordersRepository.createOrder(request: request);

  }  

}