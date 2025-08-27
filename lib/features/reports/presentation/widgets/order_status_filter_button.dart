import 'package:animate_do/animate_do.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/reports/config/constants/order_status_data.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';

class OrderStatusFilterButton extends ConsumerWidget {

  final OrderStatusViewModel status;

  const OrderStatusFilterButton({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context,ref) {

    final quanityOrdersByStatus = ref.watch(reportsProvider).getTotalOdersByStatus(statusId: status.id);

    return FadeInRight(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
      
          ref.read(reportsProvider.notifier).toggleValueInList(value: status.id);
      
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.promaryDark,
              width: 1
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            spacing: 15,
            children: [
              Icon(
                status.icon,
                size: 18,
              ),
                RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  ),
                  children: [
                  TextSpan(text: "${status.value} ("),
                  TextSpan(
                    text: "$quanityOrdersByStatus",
                    style: 
                     GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const TextSpan(text: ")"),
                  ],
                ),
                ),
              Icon(
                BootstrapIcons.x,
                size: 18
              ),
            ],
          ),
        ),
      ),
    );

  }

}