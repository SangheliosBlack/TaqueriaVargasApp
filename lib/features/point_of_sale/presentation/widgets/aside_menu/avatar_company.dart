import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

class AvatarCompany extends ConsumerWidget {

  const AvatarCompany({super.key,ref});

  @override
  Widget build(BuildContext context,ref) {

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: !isMenuOpen 
      ? Stack(
            children: [
            Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppTheme.primary,
                AppTheme.primary.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
              'TV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              ),
            ),
            ],
          )
      : Row(
        spacing: 10,
        children: [
          Stack(
            children: [
            Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppTheme.primary,
                AppTheme.primary.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
              'TV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              ),
            ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sucursal 1",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.black.withValues(alpha: .5),
                ),
                overflow: TextOverflow.visible,
              ),
              Text(
                "Taqueria Vargas",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 1),
                  fontWeight: FontWeight.w300
                ),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
              
            ],
          ),
    );
  }
  
}