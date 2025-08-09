import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

class ProfileCard extends ConsumerWidget {

  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    final userData = ref.watch(authProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withValues(alpha: .3),
          width: 1
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      child: !isMenuOpen
      ? Container(
          height: 32,
          width:  32,
          padding: EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 7
          ),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            shape: BoxShape.circle

          ),
          child: Image(
            image: AssetImage(
              "assets/images/example.png",
            ),
            fit: BoxFit.fitHeight,
          ),
        )
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                height: 32,
                width:  32,
                padding: EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 7
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle
                  
                ),
                child: Image(
                  image: AssetImage(
                    "assets/images/example.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hola, ",
                         style: GoogleFonts.poppins(
                          color: Colors.black.withValues(alpha: .8),
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        userData.user!.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.black.withValues(alpha: .8),
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          userData.user!.posInfo.name,
                          style: GoogleFonts.poppins(
                            color: Colors.black.withValues(alpha: .8),
                            fontSize: 11,
                            fontWeight: FontWeight.w300
                          ),
                                              ),
                        Text(
                          "(${userData.user!.posInfo.code})",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w300
                          ),
                                              ),
                      ],
                    ),
                    
                ],
              ),
              
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              ref.read(authProvider.notifier).logout();
            },
            child: Icon(
              BootstrapIcons.box_arrow_left,
              size: 18,
            ),
          )
        ],
      ),
    );

  }

}