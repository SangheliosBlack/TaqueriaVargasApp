import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class OrdersState {
  
  final Map<int, OrderEntity> orderList;
  final bool isLoading;
  final String errorMessage;

  OrdersState({
    this.orderList = const {},
    this.isLoading = false,
    this.errorMessage = 'JaMON',
  });

  OrdersState copyWith({
    Map<int, OrderEntity>? orderList,
    bool? isLoading,
    String? errorMessage
  }) {
    return OrdersState(
      orderList: orderList ?? this.orderList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
