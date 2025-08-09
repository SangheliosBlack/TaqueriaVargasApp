import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncreaseButton extends ConsumerWidget {

  final ProductEntity product;

  const IncreaseButton({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        product.quantity = product.quantity + 1;

        ref.read(orderCartProvider.notifier).updateProductQuantity(product:product);

      },
      child: AnimatedContainer(
        width:  25,
        height: 25,
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.primary,
            width: 1
          ),
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.plus,
            size: 10,
            color: AppTheme.primary,
          )
        ),
      ),
    );

  }

}