import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/labels/currency_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorChangeAmount extends ConsumerWidget {

  const CalculatorChangeAmount({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final totalCartAmount = ref.watch(orderCartProvider).calculateTotalAmount();

    final totalDue = ref.watch(enterAmountProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
        text: TextSpan(
          text: 'Su cambio',
          style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 18,
          ),
        ),
        ),
        CurrencyText(
          price: (totalDue - totalCartAmount) < 0 ? 0 : (totalDue - totalCartAmount),
          textStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );

  }

}