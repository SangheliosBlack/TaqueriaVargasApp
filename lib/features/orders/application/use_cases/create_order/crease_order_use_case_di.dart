import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/orders/application/use_cases/create_order/crease_order_use_case.dart';
import 'package:taqueria_vargas/features/orders/domain/repositories/orders_repository_di.dart';

final createOrderUseCaseDi = Provider<CreaseOrderUseCase>((ref) {
  
  final ordersRepository = ref.read(ordersRepositoryDi);
  
  return CreaseOrderUseCase(ordersRepository: ordersRepository);
  
});