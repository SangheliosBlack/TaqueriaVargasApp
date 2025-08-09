import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/images/adaptive_image.dart';

class ProductOrderDetailCard extends StatelessWidget {

  final OrderEntity order;

  const ProductOrderDetailCard({
    super.key,
    required this.order
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: AdaptiveImage(
            borderRadius: 10,
            imageUrl: "https://images.mrcook.app/recipe-image/01913f05-baf1-7c44-87e5-8c6525a24caa?cacheKey=U3VuLCAxMSBBdWcgMjAyNCAwMToyMDozMCBHTVQ%3D",
          ),
        ),
      ],
    );

  }
  
}