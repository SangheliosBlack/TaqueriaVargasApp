import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/customers/application/providers/customers_provider.dart';
import 'package:taqueria_vargas/features/customers/presentation/screens/new_client_screen.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectClientCard extends ConsumerWidget {

  const SelectClientCard({super.key});

  @override
  Widget build(BuildContext context,ref) {

  final clientSelected = ref.watch(orderCartProvider).clientSelected;

    return GestureDetector(
       onTap: () {

          context.pushNamed(AddNewClientScreen.path);
          
        },
      behavior: HitTestBehavior.translucent,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        clientSelected != null ? clientSelected.fullName : 'Cliente',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12
                        ),
                      ),
                      Container(
            child: clientSelected != null 
              ? Text(
                  clientSelected.fullName.contains(' ') 
                  ? clientSelected.fullName.split(' ').map((e) => e[0].toUpperCase()).take(2).join() 
                  : clientSelected.fullName.substring(0, 2).toUpperCase(),
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
              : Text(
                  "",
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
          ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
          
                    ref.read(customersProvider.notifier).getClientByPhone(phone: "");
          
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    clientSelected != null ? Icons.remove : Icons.add,
                    size: 20,
                    color: clientSelected != null ? Colors.red : AppTheme.primary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }

}