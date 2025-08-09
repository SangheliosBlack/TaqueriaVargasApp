import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/buttons/button.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorContinueButton extends ConsumerWidget {

  const CalculatorContinueButton({super.key});

  @override
  Widget build(BuildContext context,ref) {


    final totalCartAmount = ref.watch(orderCartProvider).calculateTotalAmount();

    final totalDue = ref.watch(enterAmountProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: Button(
        onTap: () async {},
        borderRadius: 100,
        locked: totalDue < totalCartAmount,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            "Continuar",
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
        ),
      )
    );

  }

}