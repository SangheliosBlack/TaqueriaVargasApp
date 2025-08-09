import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/orders/application/use_cases/use_cases.dart';

class OrdersUseCases {

  final Ref ref; 

  OrdersUseCases({required this.ref});
  
  FetchAllOrdersUseCase get fetchAllOrders => ref.read(fetchAllUseCaseOrdersDi);

  CreaseOrderUseCase get createOrder => ref.read(createOrderUseCaseDi);

}

final useCasesOrders = Provider((ref) => OrdersUseCases(ref: ref) );