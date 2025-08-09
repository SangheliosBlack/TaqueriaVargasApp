import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/products/product_added_indicator.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/products/product_card.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/background/shade.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/images/adaptive_image.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/labels/currency_text.dart';

class ProductCardShimmer extends StatelessWidget {

  final ProductEntity? product;

  const ProductCardShimmer({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600), 
      reverseDuration: Duration(milliseconds: 600),
      child:  product != null 
        ? ProductCard(product: product!)
        : Shimmer.fromColors(
          key: ValueKey('product-shimmer}'),
      baseColor: Colors.white.withValues(alpha: .3),
      highlightColor: Colors.white.withValues(alpha: 1),
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
                  ProductAddedIndicator(productId: 0),
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
                            "",
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
                                    price: 0,
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
      )
    ),
    );

  }

}