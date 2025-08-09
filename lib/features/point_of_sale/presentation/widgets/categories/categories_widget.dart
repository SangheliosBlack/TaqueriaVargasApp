import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/categories/categories.dart';

class CategoriesWidget extends StatelessWidget {

  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CategoryList()
      ],
    );

  }

}