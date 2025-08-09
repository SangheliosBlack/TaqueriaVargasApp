import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/utils/extensions/media_query_extension.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/cards/product_detail.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/detail_order.dart';

class DetailOrderProducts extends StatelessWidget {

  final OrderEntity order;

  const DetailOrderProducts({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Container(
        height: context.height - 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (_, int i) { 
              
                  final product = order.orderDetail[i];
              
              
                  return ProductDetail(product: product);
              
                }, 
                separatorBuilder: (_,__) => Gap(10), 
                itemCount: order.orderDetail.length,
                shrinkWrap: true,
              ),
            ),
            Divider(
              color: Colors.black.withValues(alpha: .1),
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16
              ),
              child: Column(
                spacing: 12,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "Envio",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14
                        ),
                      ),
                      Expanded(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.grey.withValues(alpha: .6),
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),
                        Text(
                          "\$ ${order.totalAmount} MXN",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                          ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14
                        ),
                      ),
                      Expanded(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.grey.withValues(alpha: .6),
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),
                        Text(
                          "\$ ${order.totalAmount} MXN",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

}