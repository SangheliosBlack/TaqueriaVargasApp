import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_product_detail_order_entity.dart';

class ProductDetail extends StatelessWidget {

  final  ProductDetailOrderEntity product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width:  60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.withValues(alpha: .2)
                    ),
                    color: Colors.grey.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                )      ,
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    width:  20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        product.amount.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  )
                ),
                Text(
                  "Producto",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withValues(alpha: .6),
                  )
                ),
              ],
            ),
          ],
        ),
        Text(
          "\$ ${product.price} x ${product.amount}",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          )
        ),
      ],
    );

  }

}