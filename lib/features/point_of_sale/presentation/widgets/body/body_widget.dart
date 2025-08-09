import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';


class BodyWidget extends StatelessWidget {
  
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 10,
          top: 25
        ),
        child: Column(
          children: [
            HeaderSearchBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 25
                ),
                child: Column(
                  children: [
                    CategoriesWidget(),
                    ProductsWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}