import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';

class DecreaseButton extends ConsumerWidget {

  final ProductEntity product;

  const DecreaseButton({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        if(product.quantity == 0){
          return;
        }

        product.quantity = product.quantity - 1;

        if(product.quantity == 0 && product.parciality == 0){

          ref.read(orderCartProvider.notifier).removeProduct(product: product);
          return;

        }

        ref.read(orderCartProvider.notifier).updateProductQuantity(product:product,);

      },
      child: AnimatedContainer(
        width: 25,
        height: 25,
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: product.quantity  == 1 && product.parciality == 0 ? AppTheme.delete : Colors.grey,
            width: 1
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: product.quantity == 1 && product.parciality == 0
              ? Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 4.5
                ),
                child: Icon(
                  BootstrapIcons.trash,
                  size: 12,
                  color: AppTheme.delete,
                ),
              ) 
              : Icon(
                BootstrapIcons.dash,
                color: Colors.grey,
              ),
            )
        )
      ),
    );

  }

}