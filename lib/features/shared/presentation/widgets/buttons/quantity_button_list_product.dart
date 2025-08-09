import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/product_quantity_provider.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/buttons/quantity_button_multiple.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/buttons/quantity_button_single.dart';

class QuantityButtonListProduct extends ConsumerWidget {

  final ProductEntity product;

  const QuantityButtonListProduct({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    final int quantityProductCart = ref.watch(productQuantityProvider(product.id));

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color:quantityProductCart == 0 ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(50)

      ),
      child: AnimatedSize(
      duration: Duration(milliseconds: 100),
      child: quantityProductCart == 0 ?
        QuantityButtonSingle(
          key: ValueKey<String>("QBS"),
          quantity: quantityProductCart,
          product: product,
        ) :
        QuantityButtonMultiple(
          key: ValueKey<String>("QBM"),
          quantity: quantityProductCart,
          product: product,
        )
    )
    );

    

  }

}