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

    final showMenuContent = ref.watch(pointOfSaleProvider.select((state) => state.showMenuContent));

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
      child: !showMenuContent
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
      : AnimatedOpacity(
          opacity: showMenuContent ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          alwaysIncludeSemantics: true,
          child: Row(
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
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hola, ${userData.user!.fullName.split(' ').first}",
                      style: GoogleFonts.poppins(
                        color: Colors.black.withValues(alpha: .8),
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      userData.user!.posInfo?.name ?? ref.read(authProvider).user!.roles.first.description,
                      style: GoogleFonts.poppins(
                        color: Colors.black.withValues(alpha: .8),
                        fontSize: 10,
                        fontWeight: FontWeight.w300
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  
                  await Future.delayed(Duration(milliseconds: 50));
                  
                  ref.read(authProvider.notifier).logout();
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(
                    BootstrapIcons.box_arrow_left,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ),
    );

  }

}