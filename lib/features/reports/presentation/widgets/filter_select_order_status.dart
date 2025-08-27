import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:taqueria_vargas/features/reports/config/constants/order_status_data.dart';
import 'package:taqueria_vargas/features/reports/config/utils/utills.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/reports/presentation/widgets/order_list_status.dart';

class FilterSelectOrderStatus extends ConsumerStatefulWidget {

  const FilterSelectOrderStatus({super.key});

  @override
  ConsumerState<FilterSelectOrderStatus> createState() => _FilterSelectOrderStatusState();

}

class _FilterSelectOrderStatusState extends ConsumerState<FilterSelectOrderStatus> {

  @override
  Widget build(BuildContext context) {

    final orderStatus = OrderStatusData.orderStatusList;

    final selectedOptions = ref.watch(reportsProvider).orderFiltersSelected;

    final filtersAdded = ReportsUtils.filtersAdded(allFilters: orderStatus, selectedFilters: selectedOptions);

    return Expanded(
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            
            child: DropdownButton2<int>(
              isExpanded: true,
              underline: Divider(
                color: Colors.red,
                height: 10,
              ),
              customButton: _buildCustomButton(filtersAdded: filtersAdded),
              items: _buildDropdownItems(orderStatus,selectedOptions),
              value: 5,
              onChanged: (int? value) {
          
                ref.read(reportsProvider.notifier).toggleValueInList(value:value!);
          
              },
              menuItemStyleData: const MenuItemStyleData(
                height: 50,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
              dropdownStyleData: _buildDropdownStyleData(),
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                height: 40,
                width: 140,
              ),
            ),
          ),
          OrdersList()
        ],
      ),
    );
  }

  Widget _buildCustomButton({required List<OrderStatusViewModel> filtersAdded}) {

    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withValues(alpha: .3),
                  width: 1
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estatus de pedido",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
            ),
          ),
        ),
        
      ],
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems( List<OrderStatusViewModel> commercialFigures, List<int> selection) {

    
    return commercialFigures.map((OrderStatusViewModel item) {

      final isSelected = selection.contains(item.id);

        return DropdownMenuItem<int>(
        value: item.id,
        child: SizedBox(
          height: 40,
          child: Row(
            spacing: 15,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: isSelected ? AppTheme.primary : Colors.grey.withValues(alpha: .5),
                    width: 1
                  )
                ),
                child: Container(
                  width:  17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.primary : Colors.grey.withValues(alpha: .5),
                    shape: BoxShape.circle,
                    border: Border.all(
                    color: Colors.white,
                    width: 2,
                    ),
                  ),
                  child: Icon(
                      Icons.check,
                      color: isSelected ? AppTheme.primary : Colors.grey.withValues(alpha: .5),
                      size: 16,
                    ),
                  ),
              ),
              Text(
                item.value,
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      );

      }
    ).toList();

  }

  DropdownStyleData _buildDropdownStyleData() {
    return DropdownStyleData(
      elevation: 0,
      width: 180,
      openInterval: Interval(0.1,0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5)
          )
        ]
      ),
      offset: const Offset(10, -10),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(6),
        thumbVisibility: WidgetStateProperty.all(true),
      ),
      
    );
  }

}
