import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/products/product_card_shimmer.dart';
import 'package:taqueria_vargas/features/products/application/application.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';


class ProductsGrid extends ConsumerWidget {

  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final productState = ref.watch(productsProvider);

    return GridView.builder(
      padding: EdgeInsets.only(top:5),
      scrollDirection: Axis.vertical, 
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (_, i) {
    
        final ProductEntity? product = productState.isLoading ?  null : productState.getAllProducts()[i];
    
        return ProductCardShimmer(product: product);
    
      },
      itemCount: productState.isLoading ? 10 : productState.getAllProducts().length,
    );

  }

}