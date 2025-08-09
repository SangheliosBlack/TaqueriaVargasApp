import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/product_quantity_provider.dart';

class ProductAddedIndicator extends ConsumerWidget {

  final int productId;

  const ProductAddedIndicator({
    super.key,
    required this.productId
  });

  @override
  Widget build(BuildContext context,ref) {

    final int quantityProductCart = ref.watch(productQuantityProvider(productId));

    return Positioned(
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: quantityProductCart > 0 ?  1: 0,
        duration: Duration(
          milliseconds: 100
        ),
        child: AnimatedContainer(
           duration: Duration(
          milliseconds: 400
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
          ),
          child: Row(
            spacing: 5,
            children: [
              Text(
                "${quantityProductCart.toString()} x",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(
                BootstrapIcons.basket,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ),
      )
    );

  }

}