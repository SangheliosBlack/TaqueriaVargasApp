import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/labels/currency_text.dart';

class SubTotalLabel extends ConsumerWidget {

  const SubTotalLabel({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final total = ref.watch(orderCartProvider).calculateTotalAmount();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtotal",
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12
          ),
        ),
        CurrencyText(
          price: total,
          textStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600
          ),
        ),
        
      ],
    );

  }

}