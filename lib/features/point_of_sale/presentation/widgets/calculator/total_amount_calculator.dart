import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/labels/currency_text.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalAmountCalculator extends ConsumerWidget {

  const TotalAmountCalculator({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final total = ref.watch(orderCartProvider).calculateTotalAmount();

    return Column(
      children: [
        Text(
          "Total",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 45,
          child: Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrencyText(
                price: total,
                textStyle: GoogleFonts.poppins(
                  color: AppTheme.primary,
                  fontSize: 50,
                  height: .8,
                  fontWeight: FontWeight.w600
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'MXN',
                  style: GoogleFonts.poppins(
                    height: .8,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }

}