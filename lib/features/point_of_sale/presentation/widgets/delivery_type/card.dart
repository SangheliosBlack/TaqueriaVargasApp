import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';

class PaymentMethodCard extends StatelessWidget {

  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 32,
        padding: EdgeInsets.symmetric(
      ),
      child: DeliveryMethodList(),
    );

  }

}