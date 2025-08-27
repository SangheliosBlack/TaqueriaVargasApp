import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/reports/config/constants/order_status_data.dart';
import 'package:taqueria_vargas/features/reports/config/utils/utills.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/reports/presentation/widgets/order_status_filter_button.dart';

class OrdersList extends ConsumerStatefulWidget {
  const OrdersList({super.key});

  @override
  ConsumerState<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends ConsumerState<OrdersList> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  late List<OrderStatusViewModel> _items;

  @override
  void initState() {
    super.initState();
  }

  void removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1, 0), 
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: OrderStatusFilterButton(status: removedItem),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {

    final orderStatus = OrderStatusData.orderStatusList;

    final selectedOptions = ref.watch(reportsProvider).orderFiltersSelected;


    return Expanded(
  child: SizedBox(
    height: 46,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: ReportsUtils.filtersAdded(
        allFilters: orderStatus,
        selectedFilters: selectedOptions,
      ).length,
      separatorBuilder: (_, __) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        final status = ReportsUtils.filtersAdded(
          allFilters: orderStatus,
          selectedFilters: selectedOptions,
        )[index];

        return GestureDetector(
          onTap: () {
            ref.read(reportsProvider.notifier).toggleValueInList(value: status.id);
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: selectedOptions.contains(status.id) ? 1 : 0.0,
            child: OrderStatusFilterButton(
              status: status, 
            ),
          ),
        );
      },
    ),
  ),
);
  }
}
