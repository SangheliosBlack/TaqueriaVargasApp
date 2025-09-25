import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class OrderCreateNewTicketButton extends ConsumerWidget {

  final OrderEntity order;

  const OrderCreateNewTicketButton({super.key,required this.order});

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      onTap: () async {
        
        await ref.read(printerServiceProvider).printReceipt(order: order);

      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(
              Icons.print,
              color: AppTheme.primary,
            ),
            Text(
              "Imprimir ticket",
              style: GoogleFonts.poppins(
                color: AppTheme.primary,
                fontWeight: FontWeight.w300,
                fontSize: 15
              ),
            ),
          ],
        ),
      ),
    );

  }

}