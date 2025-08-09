import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterAmountWidget extends ConsumerWidget {

  const EnterAmountWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final total = ref.watch(enterAmountProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
        text: TextSpan(
          text: 'Ingrese cantidad',
          style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 18,
          ),
        ),
        ),
        AnimatedFlipCounter(
          fractionDigits: 2,
          prefix: "\$",
          duration: const Duration(milliseconds: 100),
          thousandSeparator: ",",
          value: num.parse(total.toStringAsFixed(2)),
          textStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500
            )
          )
      ],
    );

  }

}