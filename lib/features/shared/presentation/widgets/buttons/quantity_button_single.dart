import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';

class QuantityButtonSingle extends ConsumerWidget {

  final int quantity;
  final ProductEntity product;
  
  const QuantityButtonSingle({
    super.key,
    required this.quantity,
    required this.product
  });
  
  @override
  Widget build(BuildContext context,ref) {

   return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: (){

      ref.read(orderCartProvider.notifier).addProduct(product: product);

    },
    child: AnimatedContainer(
       padding: EdgeInsets.all(3),
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         color: Colors.white
       ),
       duration: Duration(milliseconds: 300),
       child: Icon(
         BootstrapIcons.plus,
         color: Colors.black,
         size: 20,
       )
     ),
   );

  }

}