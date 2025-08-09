import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/product_quantity_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/products/product_added_indicator.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class ProductCard extends ConsumerWidget {

  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    final int quantityProductCart = ref.watch(productQuantityProvider(product.id));

    return GestureDetector(
      key: ValueKey('product_card_${product.id}'),
      onTap: (){

        product.quantity = quantityProductCart + 1;

        ref.read(orderCartProvider.notifier).updateProductQuantity(product: product);

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: AdaptiveImage(
                        borderRadius: 10,
                        imageUrl: "https://images.mrcook.app/recipe-image/01913f05-baf1-7c44-87e5-8c6525a24caa?cacheKey=U3VuLCAxMSBBdWcgMjAyNCAwMToyMDozMCBHTVQ%3D",
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                        padding: EdgeInsets.all(10),
                      child: Shade(
                        borderRadius: 10
                      ),
                    )
                  ),
                  ProductAddedIndicator(productId: product.id),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10, 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CurrencyText(
                                    price: product.pricePf,
                                    textStyle: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                    ),
                    
                                  ),
                                ],
                              ),
                              //QuantityButtonListProduct(product: product,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );

  }

}


