import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taqueria_vargas/features/reports/application/providers/reports_use_cases_providers.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_orders_admin_request.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_state.dart';
import 'package:taqueria_vargas/features/reports/config/enums/date_filter_type.dart';

part 'reports_provider.g.dart';

@Riverpod(keepAlive: true)
class Reports extends _$Reports {

  @override 
  ReportsState build() => ReportsState();

  ReportsUseCasesProviders get useCases => ref.read(reportsUseCasesProviders);

  Future<void> fetchAllTurns() async {

    final request = GetAllRegisterTurnsRequestEntity(
      companyBranchId: 1,
      page: 1,
      pageSize: 20,
    );

    final result = await useCases.getAllRegisterTurns(request: request);

    result.fold(
      (error){

        state = state.copyWith(isLoading: false);

      }, 
      (data){

        state = state.copyWith(
          isLoading: false,
          list: data
        );

      }
    );

  }

  void toggleValueInList({required int value}) {


    final currentSet = Set<int>.from(state.orderFiltersSelected);
    
    if (currentSet.contains(value)) {

      if(state.orderFiltersSelected.length == 1) return;

      currentSet.remove(value);

    } else {

      currentSet.add(value);

    }

    state = state.copyWith(orderFiltersSelected: currentSet.toList());

  }

  void closeTurn() {

    final updatedList = [
      for (final turn in state.list)
        turn == state.list.first ? turn.copyWith(active: false) : turn
    ];

    state = state.copyWith(list: updatedList);
  
  }

  Future<void> fetchAllOrders() async {

    state = state.copyWith(isLoading: true);

    final request = GetAllOrdersAdminRequest(
      startDate: state.startDate,
      endDate: state.endDate,
    );

    final result = await useCases.getAllOrder(request: request);

    result.fold(
      (error){

        state = state.copyWith(isLoading: false);

      }, 
      (data){

        state = state.copyWith(
          isLoading: false,
          orders: data.orders
        );

      }
    );

  }

  void setCustomDateRange(DateTimeRange dateRange) {

    final startDate = DateTime(dateRange.start.year, dateRange.start.month, dateRange.start.day);
    final endDate = DateTime(dateRange.end.year, dateRange.end.month, dateRange.end.day, 23, 59, 59);

    state = state.copyWith(
      selectedDateFilterType: DateFilterType.custom,
      customDateRange: dateRange,
      startDate: startDate,
      endDate: endDate,
    );

  }
  
  void applyPredefinedDateFilter(DateFilterType filterType) {

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    DateTime startDate;
    DateTime endDate;
    
    switch (filterType) {

      case DateFilterType.today:
        startDate = today;  
        endDate = today.add(Duration(days: 1)).subtract(Duration(milliseconds: 1)); 
        break;
        
      case DateFilterType.week:
        final startOfWeek = today.subtract(Duration(days: now.weekday - 1));
        startDate = startOfWeek;  
        endDate = startOfWeek.add(Duration(days: 6, hours: 23, minutes: 59, seconds: 59)); 
        break;
        
      case DateFilterType.month:
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1, 1).subtract(Duration(milliseconds: 1));
        startDate = startOfMonth; 
        endDate = endOfMonth;     
        break;
        
      case DateFilterType.custom:
        if (state.customDateRange != null) {
          startDate = DateTime(state.customDateRange!.start.year, state.customDateRange!.start.month, state.customDateRange!.start.day);
          endDate = DateTime(state.customDateRange!.end.year, state.customDateRange!.end.month, state.customDateRange!.end.day, 23, 59, 59);
        } else {
          startDate = today;
          endDate = today.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
        }
        break;
    }
    
    state = state.copyWith(
      selectedDateFilterType: filterType,
      startDate: startDate,
      endDate: endDate,
    );
    
  }
  
  void clearDateFilter() {
    state = state.copyWith(
      selectedDateFilterType: DateFilterType.today,
      customDateRange: null,
      startDate: null,
      endDate: null,
    );
  }
  
  Future<void> applyDateFilterAndRefresh(DateFilterType filterType, [DateTimeRange? customRange]) async {
    
    if (filterType == DateFilterType.custom && customRange != null) {

      setCustomDateRange(customRange);

    } else {

      applyPredefinedDateFilter(filterType);

    }


    await fetchAllOrders();
  }

}
