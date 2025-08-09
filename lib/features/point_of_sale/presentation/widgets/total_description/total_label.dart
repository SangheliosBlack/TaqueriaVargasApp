import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalLabel extends ConsumerWidget {

  const TotalLabel({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final total = ref.watch(orderCartProvider).calculateTotalAmount();

   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        AnimatedFlipCounter(
              fractionDigits: 2,
              prefix: "\$",
              duration: const Duration(milliseconds: 300),
              thousandSeparator: ",",
              value: total,
              textStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600
            )
            ),
      ],
    );
  }

}