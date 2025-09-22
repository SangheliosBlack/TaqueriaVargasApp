import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

class AsideButton extends ConsumerWidget {

  final IconData icon;  
  final bool active;
  final Function()? onTap;
  final String label;
  final String path;

  const AsideButton({
    super.key, 
    required this.icon,
    required this.active,
    this.onTap,
    required this.label,
    required this.path
  });

  @override
  Widget build(BuildContext context,ref) {

    final showMenuContent = ref.watch(pointOfSaleProvider.select((state) => state.showMenuContent));

    final hasAccess = ref.watch(authProvider).user!.hasAcces(path: path);

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
          child: !showMenuContent
          ? Icon(
              icon,
              color: active ? AppTheme.primary : Colors.grey,
              size: 20,
            )
          : showMenuContent
            ? SlideInLeft(
                duration: Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: active ? AppTheme.primary : Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        label,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black.withValues(alpha: 1),
                          fontWeight: FontWeight.w300
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
          
        )
      ),
    );
  }

}