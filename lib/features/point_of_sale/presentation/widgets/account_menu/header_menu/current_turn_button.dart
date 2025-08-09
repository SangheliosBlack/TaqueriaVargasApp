import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/header_menu/current_turn_end_date.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/header_menu/current_turn_start_date.dart';

class CurrentTurnWidget extends ConsumerWidget {
  
    const CurrentTurnWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentTurn = ref.watch(authProvider).currentTurn;

    return Row(
      children: [
        CurrentTurnStartDate(),
        Container(
          width: 165,
          margin: EdgeInsets.only(
            top: 20
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: currentTurn != null ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                DatesFormat(currentTurn.openingDate).twoDigitDayFormat,
                style: GoogleFonts.lato(
                  color: Colors.black.withValues(alpha: .8),
                  fontSize: 18,
                  height: 1.5
                ),
              ) ,
              Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                     DatesFormat(currentTurn.openingDate).monthInSpanish,
                    style: GoogleFonts.quicksand(
                      color: Colors.black.withValues(alpha: .7),
                      height: .3,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    DatesFormat(currentTurn.openingDate).formatoHoraMinutoSinAMPM,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  
                ],
              ),
               Text(
                 DatesFormat(currentTurn.openingDate).soloAMoPM,
                style: GoogleFonts.lato(
                  color: AppTheme.primary,
                  fontSize: 18,
                  height: 1.5
                ),
              ) ,
            ],
          ) : Container()
        ),
        CurrentTurnEndDate()
      ],
    );
  }
}
