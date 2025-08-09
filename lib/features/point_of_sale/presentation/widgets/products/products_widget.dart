import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/products/products.dart';

class ProductsWidget extends StatelessWidget {

  const ProductsWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        //ProductsHeader(),
        ProductsGrid()
      ],
    );

  }

}