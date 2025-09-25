import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/cart/cards/slide_background_card.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/cart/quantity_button/quantity_button.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:taqueria_vargas/features/shared/presentation/presentation.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProductItem extends ConsumerWidget {

  final ProductEntity product;

  const CartProductItem({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {


    return SlideInRight(
      duration: Duration(milliseconds: 200),
      child: Dismissible(
        key: Key(product.id.toString()),
        background: const SlideBackgroundCard(),
        direction: DismissDirection.endToStart,
        resizeDuration: Duration(milliseconds: 400),
        movementDuration: Duration(milliseconds: 400),
        confirmDismiss: (direction) {

          ref.read(orderCartProvider.notifier).removeProduct(product: product);

          return Future.value(true);


        },
        child: AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10
            ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withValues(alpha: .20),
              width: 1
            ),
            borderRadius: BorderRadius.circular(15),
          ),
            height: product.quantity > 1 ? 91 : 67,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /*
                      AdaptiveImage(
                        aspectRatio: 1/1,
                        imageUrl: "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/7f17c36b-38db-4d74-8ed4-d3983957a293/Derivates/ab88505f-8375-4990-82fa-864f6bda6ce1.jpg",
                        borderRadius: 15,
                      ),
                      */
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black.withValues(alpha: .8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                                
                              ],
                            ),
                            Gap(3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CurrencyText(
                                  price: product.pricePf,
                                  textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15
                                  ),
                                ),
                                QuantityButton(
                                  product: product,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                /*
                if(product.hasParciality)...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                        Row(
                        children: [
                          Text(
                          "Unidades: ",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.black.withValues(alpha: .7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                          Text(
                          product.parciality.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        )
                          ),
                        ],
                        ),
                      Gap(5),
                      SizedBox(
                        width: double.infinity,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppTheme.primary,
                            inactiveTrackColor: Colors.grey.shade300,
                            thumbColor: AppTheme.primary, 
                            overlayColor: AppTheme.primary.withAlpha(50),
                            trackHeight: 4,
                          ),
                          child: Slider(
                            padding: EdgeInsets.all(0),
                            value: product.parciality.toDouble(),
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: product.parciality.toString(),
                            onChanged: (value) {
                              product.parciality = value.toInt();
                              ref.read(orderCartProvider.notifier).updateProductQuantity(product: product);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                },*/
                if(product.quantity > 1 || product.parciality > 0)...{
                  Column(
                    children: [
                    Gap(8),               Row(
                      children: [
                        Text(
                          "Subtotal: ",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.black.withValues(alpha: .7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        CurrencyText(
                          price: product.subTotal,
                          textStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 11
                          ),
                        ),
                      ],
                    )
                    ],
                  )
                }
              ],
            ),
          ),
        ),
      ),
    );

  }

}