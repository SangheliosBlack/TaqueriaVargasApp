import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsHeader extends ConsumerWidget {

  const ClientsHeader({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                'Agregar nuevo',
                style: GoogleFonts.poppins(
                color: AppTheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.w300),
              ),
              Text(
                'Cliente',
                style: GoogleFonts.poppins(
                  color: Colors.black.withValues(alpha: .7),
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
           ],
         ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () { 

              ref.read(orderCartProvider.notifier).removeClient();

              context.pop();
              
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.withAlpha(100)
                )
              ),
              padding: EdgeInsets.all(5),
              child: Icon(
                BootstrapIcons.x,
                color: Colors.black.withAlpha(150),
                size: 30,
              )
            ),
          )
        ],
      ),
    );

  }

}