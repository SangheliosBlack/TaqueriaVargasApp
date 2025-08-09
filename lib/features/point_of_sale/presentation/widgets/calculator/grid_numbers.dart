import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';

class CalculatorGrid extends ConsumerWidget {

  final void Function(String) onPressed;

  CalculatorGrid({super.key, required this.onPressed});

  final List<String> buttons = [
    '7', '8', '9',
    '4', '5', '6',
    '1', '2', '3',
    '.', '0', 'C',
  ];

  @override
  Widget build(BuildContext context,ref) {

    final totalCartAmount = ref.watch(orderCartProvider).calculateTotalAmount();

    final totalDue = ref.watch(enterAmountProvider);

    return Padding(
       padding: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {

          final availableHeight = constraints.maxHeight - 55;
          final availableWidth = constraints.maxWidth;
          final crossAxisCount = 3;
          final itemWidth = (availableWidth - 30) / crossAxisCount; // 30 = crossAxisSpacing * (count - 1)
          final itemHeight = availableHeight / 4; // o cualquier lógica para dividir filas
          final aspectRatio = itemWidth / itemHeight;

          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: buttons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: aspectRatio,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              final label = buttons[index];
          
              return GestureDetector(
                onTap: () => onPressed(label),
                
                child: Container(
                  decoration: BoxDecoration(
                    
                  color: label == "C"  ? Colors.white  : Colors.grey.withAlpha(30),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: label == "." ? 
                  GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: totalDue < totalCartAmount ? () {
          
                    
                  } : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        label,
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          color:  Colors.black,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  ) : label == "C" ?
                    GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    ref.read(enterAmountProvider.notifier).deleteLastDigit();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(
                      Icons.backspace_outlined,
                      color: AppTheme.primary,
                      size: 30,
                    ),
                  ),
                  ) :  Center(
                    child: Text(
                      label,
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color:label == "C"  ? Colors.white  : Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
