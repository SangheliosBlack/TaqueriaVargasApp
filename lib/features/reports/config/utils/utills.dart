import 'package:taqueria_vargas/features/reports/config/constants/order_status_data.dart';

class ReportsUtils {
 
  static List<OrderStatusViewModel> filtersAdded({required List<int> selectedFilters, required List<OrderStatusViewModel> allFilters}) {

    if(selectedFilters.isEmpty) return allFilters;

    return allFilters.where((filter) => selectedFilters.contains(filter.id)).toList();

  }

}