import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/detail_order.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/user_sale_detail.dart';

class DetailOrderInfo extends StatelessWidget {

  final OrderEntity order;

  const DetailOrderInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Detalle de la venta",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 24
              ),
            ),
            Divider(
              color: Colors.black.withValues(alpha: .1),
              height: 1,
            ),
            Column(
              spacing: 12,
              children: [
                DetailOrder(
                  label: "Punto de venta", 
                  value: order.posStation.name, 
                  icon: Icons.point_of_sale
                ),
                DetailOrder(
                  label: "Tipo de venta", 
                  value: order.typeSale.description, 
                  icon: Icons.moped_sharp
                ),
                DetailOrder(
                  label: "Estatus", 
                  value: order.status.description, 
                  icon: Icons.schedule
                ),
                
              ],
            ),
            Text(
              "Vendedor",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 24
              ),
            ),
            Divider(
              color: Colors.black.withValues(alpha: .1),
              height: 1,
            ),
            UserSaleDetail(user: order.orderUser,)
          ],
        ),
      ),
    );

  }

}