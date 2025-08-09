import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'total_description.dart';

class TotalDescription extends StatelessWidget {

  const TotalDescription({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, -10)
          )
        ],
        border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 1.0
          ),
        )
      ),
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: Column(
        spacing: 10,
        children: [
          //SelectClientCard(),
          DeliveryLabel(),
          //SubTotalLabel(),
          //DiscountLabel(),
          //TaxesLabel(),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.grey.withValues(alpha: 0.6),
            dashRadius: 0,
            dashGapLength: 3.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
      
          ),
          TotalLabel()
        ],
      ),
    );

  }

}