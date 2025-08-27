import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';

class ReportsState {

  final bool isLoading;
  final List<PosStationEntity> list;
  final Map<int, OrderEntity> orders;
  final List<int> orderFiltersSelected;

  

  ReportsState({
    this.isLoading = true,
    this.list = const [],
    this.orders = const {},
    this.orderFiltersSelected = const [3,4,5,15,16]
  }); 

  List<OrderEntity> get getFilteredOrders {

  return orders.values.where((order) => orderFiltersSelected.contains(order.status.id)).toList();

}

  int getTotalOdersByStatus({required int statusId}) {

    return orders.values.where((order) => order.status.id == statusId).length;

  }

  ReportsState copyWith({
    bool? isLoading,
    List<PosStationEntity>? list,
    Map<int, OrderEntity>? orders,
    List<int>? orderFiltersSelected
  }) {
    return ReportsState(
      isLoading: isLoading ?? this.isLoading,
      list: list ?? this.list,
      orders: orders ?? this.orders,
      orderFiltersSelected : orderFiltersSelected ?? this.orderFiltersSelected
    );
  }

  List<OrderEntity> get ordersList => orders.values.toList();

}