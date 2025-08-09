import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

class AsideButton extends ConsumerWidget {

  final bool hasAccess;
  final IconData icon;  
  final bool active;
  final Function()? onTap;
  final String label;

  const AsideButton({
    super.key, 
    required this.icon,
    required this.active,
    required this.hasAccess,
    this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context,ref) {

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    return Offstage(
      offstage: !hasAccess,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: active ? null : onTap,
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12
          ),
          child: !isMenuOpen
          ? Icon(
              icon,
              color: active ? AppTheme.primary : Colors.grey,
              size: 20,
            )
          : SlideInLeft(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: 15,
                    children: [
                      Icon(
                        icon,
                        color: active ? AppTheme.primary : Colors.grey,
                        size: 20,
                      ),
                      Expanded(
                        child: Text(
                          label,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black.withValues(alpha: 1),
                            fontWeight: FontWeight.w300
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: 0,
                  duration: Duration(milliseconds: 150),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3', // Cambia el número según la notificación
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        )
      ),
    );
  }

}