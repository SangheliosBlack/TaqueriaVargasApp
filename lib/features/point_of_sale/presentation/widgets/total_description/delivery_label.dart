import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryLabel extends ConsumerWidget {

  const DeliveryLabel({super.key});


  @override
  Widget build(BuildContext context,ref) {

    final orderCartState = ref.watch(orderCartProvider).deliveryAdded;

    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Envio",
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 12
            ),
          ),
           AnimatedFlipCounter(
              fractionDigits: 2,
              prefix: "\$",
              duration: const Duration(milliseconds: 300),
              thousandSeparator: ",",
              value: orderCartState ? 30 : 0,
              textStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400
            )
            ),
          
        ],
      ),
    );
  }
}