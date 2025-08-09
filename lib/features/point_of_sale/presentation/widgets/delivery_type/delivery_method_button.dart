import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/entities.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';

class DeliveryMethodButton extends ConsumerWidget {

  final SaleTypeEntity data;
  final bool active;

  const DeliveryMethodButton({
    super.key,
    required this.active,
    required this.data
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      onTap: (){

        ref.read(orderCartProvider.notifier).setSaleType(saleTypeId:data.id);

      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 300
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,

        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: active ?  AppTheme.secondary : Colors.white,
        
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(
              data.getIcon,
              size: 14,
              color: active ?  AppTheme.primary : Colors.grey
            ),
            Text(
              data.value,
              style: GoogleFonts.poppins(
                color: active ?  AppTheme.primary : Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w300
              )
            )
            /*
            Gap(5),
            Text(
              data.value,
              style: GoogleFonts.poppins(
                color: active ?  AppTheme.primary : Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w300
              )
            )
            */
          ],
        ),
      ),
    
      
    );

  }

}