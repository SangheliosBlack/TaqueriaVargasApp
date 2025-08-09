import 'package:taqueria_vargas/features/orders/application/use_cases/fetch_all_orders/fetch_all_orders_use_case.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final fetchAllUseCaseOrdersDi  = Provider<FetchAllOrdersUseCase>((ref) {

  final ordersRepository = ref.read(ordersRepositoryDi);

    return FetchAllOrdersUseCase(
      ordersRepository: ordersRepository,
    );
  },
  
);