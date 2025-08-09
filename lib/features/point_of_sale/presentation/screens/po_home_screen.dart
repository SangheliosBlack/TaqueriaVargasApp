import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';

class PoHomeScreen extends StatelessWidget {

  static const String path = "/point-of-sale";

  const PoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      key: ValueKey("poScreen"),
      child: Row(
        spacing: 15,
        children: [
          Expanded(
            child: Column(
              spacing: 10,
              children: [
                CategoryList(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: 25
                    ),
                    child: Column(
                      children: [
                        
                        ProductsWidget()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          AccountMenu()
        ],
      ),
    );
  }
}