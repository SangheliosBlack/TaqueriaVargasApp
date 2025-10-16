import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/content/detail_order_info.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/widgets.dart';

class OrderDetail extends ConsumerWidget {

  final OrderEntity order;

  static const String path = "/point-of-sale/sales/order";

  const OrderDetail({
    super.key,
    required this.order
  });

  @override
  Widget build(BuildContext context,ref) {

    return Container(
      color: AppTheme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: 10
        ),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderDetailInfo(order: order),
                Row(
                  spacing: 15,
                  children: [
                    OrderCreateNewTicketButton(order: order),
                    OrderEditButton(order: order)
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  DetailOrderInfo(order: order),
                  DetailOrderProducts(order: order)
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}