import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';
import 'package:taqueria_vargas/features/reports/config/enums/date_filter_type.dart';

class ReportsState {

  final bool isLoading;
  final List<PosStationEntity> list;
  final Map<int, OrderEntity> orders;
  final List<int> orderFiltersSelected;
  
  // Filtros de fecha
  final DateFilterType selectedDateFilterType;
  final DateTimeRange? customDateRange;
  final DateTime? startDate;
  final DateTime? endDate;
  

  ReportsState({
    this.isLoading = true,
    this.list = const [],
    this.orders = const {},
    this.orderFiltersSelected = const [3,4,5,15,16],
    this.selectedDateFilterType = DateFilterType.today,
    this.customDateRange,
    this.startDate,
    this.endDate,
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
    List<int>? orderFiltersSelected,
    DateFilterType? selectedDateFilterType,
    DateTimeRange? customDateRange,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ReportsState(
      isLoading: isLoading ?? this.isLoading,
      list: list ?? this.list,
      orders: orders ?? this.orders,
      orderFiltersSelected : orderFiltersSelected ?? this.orderFiltersSelected,
      selectedDateFilterType: selectedDateFilterType ?? this.selectedDateFilterType,
      customDateRange: customDateRange ?? this.customDateRange,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  List<OrderEntity> get ordersList => orders.values.toList();

}