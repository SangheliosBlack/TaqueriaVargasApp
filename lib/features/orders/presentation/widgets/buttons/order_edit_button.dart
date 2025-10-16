import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/screens/po_home_screen.dart';

class OrderEditButton extends ConsumerWidget {

  final OrderEntity order;

  const OrderEditButton({super.key,required this.order});

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      onTap: () async {

        ref.read(orderCartProvider.notifier).setEditOrder(order: order);

        context.push(PoHomeScreen.path);
        

      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(
              Icons.edit,
              color: AppTheme.primary,
            ),
            Text(
              "Editar",
              style: GoogleFonts.poppins(
                color: Colors.black.withValues(alpha: .8),
                fontWeight: FontWeight.w300,
                fontSize: 13
              ),
            ),
          ],
        ),
      ),
    );

  }

}