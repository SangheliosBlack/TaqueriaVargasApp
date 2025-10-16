import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/cart/cart.dart';

class CartProductList extends ConsumerWidget {

  const CartProductList({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final productsList = ref.watch(orderCartProvider).productList;

    final clientState = ref.watch(orderCartProvider);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: productsList.isEmpty 
      ? EmptyCartCard()
      : Align(
        alignment: Alignment.topCenter,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 15,
            bottom:  clientState.selectedSaleTypeId != 6 ?  80 : 15,
          ),
          itemBuilder: (_, index) { 
    
            final product = productsList.values.elementAt(index);
        
            return CartProductItem(product: product);
        
          }, 
          separatorBuilder: (_,__) => Gap(15), 
          itemCount: productsList.length,
        ),
      ),
    );

  }

}