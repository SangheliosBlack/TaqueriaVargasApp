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
                        clientSelected != null ? clientSelected.fullName ?? "" : 'Cliente',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12
                        ),
                      ),
                      Container(
            child: clientSelected != null 
              ? Text(
                (() {
                  final name = (clientSelected.fullName ?? '').trim();
                  if (name.isEmpty) return '';
                  final parts = name.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
                  if (parts.length >= 2) {
                    return parts.take(2).map((p) => p[0].toUpperCase()).join();
                  }
                  final p = parts.first;
                  return p.length >= 2 ? p.substring(0, 2).toUpperCase() : p.toUpperCase();
                })(),
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