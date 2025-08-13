import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/views/dialogs/close_po_dialog.dart';
import 'package:taqueria_vargas/features/shared/presentation/utils/show_custom_dialog.dart';

class CurrentTurnEndDate extends ConsumerWidget {

  const CurrentTurnEndDate({super.key,ref});

  @override
  Widget build(BuildContext context,ref) {

    final currentTurn = ref.watch(authProvider).currentTurn;


    return SizedBox(
      width: 45,
      child: Column(
        children: [
          Column(
            spacing: 5,
            children: [
              Text(
                "CERRAR",
                style: GoogleFonts.quicksand(
                  color: Color.fromRGBO(211,121,119,1),
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              Container(
                width: 55,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  color: Color.fromRGBO(211,121,119,1)
                )
              ),
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {

              final isOpen = ref.read(authProvider).user!.isOpenToday;

              if(currentTurn != null) {
                
                 final result = await CustomDialogService.showAlertDialog(
                // ignore: use_build_context_synchronously
                context: context, 
                content:  ClosePoDialog(
                )

              );

              if(result ?? false){

                await ref.read(pointOfSaleProvider.notifier).closePo(context: context);

                //ref.read(authProvider.notifier).removeCurrentTurn();

                ref.read(enterAmountProvider.notifier).updateAmount(amount: 0);

                return;

                }
              }

              //ref.read(pointOfSaleProvider.notifier).closeTurn(context: context);

              ref.read(authProvider.notifier).removeCurrentTurn();

            },
            child: Container(
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.symmetric(vertical: 5),
              width: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 5,
                    offset: Offset(0, 0)
                  )
                ],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                color: Colors.white
              ),
              child: SizedBox(
                    height: 30,
                    child: Icon(
                      FontAwesomeIcons.flagCheckered,
                      size: 17,
                      color: Color.fromRGBO(211,121,119,1)
                    ),
            ),
                  ),
          )],
      ),
    );

  }

}