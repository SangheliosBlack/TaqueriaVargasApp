import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/utils/dates/dates_format.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class OrderDetailInfo extends StatelessWidget {

  final OrderEntity order;

  const OrderDetailInfo({super.key,required this.order});

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 15,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){

            context.pop();

          },
          child: Container(
            width:  50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: Icon(Icons.arrow_back)
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #${order.id}",
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22
              ),
            ),
            Text(
              "Creada ${DatesFormat(order.date).formatoFechaHora}",
              style: GoogleFonts.quicksand(
                color: Colors.black.withValues(alpha: .6),
                fontSize: 15
              ),
            ),
          ],
        )
      ],
    );

  }

}