import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/views/dialogs/close_po_dialog.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/views/dialogs/open_po_dialog.dart';
import 'package:taqueria_vargas/features/shared/presentation/utils/show_custom_dialog.dart';

class CurrentTurnStartDate extends ConsumerWidget {

  const CurrentTurnStartDate({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final currentTurn = ref.watch(authProvider).currentTurn;

    final isOpen = ref.watch(authProvider).user!.isOpenToday ?? false;

    final isConnected = ref.watch(printerConnectionProvider);

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    final roleCode = ref.watch(authProvider).user!.roles.first.code;


    return roleCode == "MES" || roleCode == "COR" ? SizedBox(
      height: 50,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
      
      
          
      
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isOpen ? AppTheme.primary.withValues(alpha: .1) : Colors.blueGrey.withValues(alpha: .1),
          ),
          child: !isMenuOpen 
          ?  Icon(
              Icons.storefront,
              size: 20,
              color: isOpen ?  AppTheme.primary : Colors.blueGrey,
            )
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.storefront,
                    size: 20,
                    color: isOpen ?  AppTheme.primary : Colors.blueGrey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Punto de venta",
                      style: GoogleFonts.quicksand(
                        fontSize: 11,
                        color: isConnected ? AppTheme.primary : Colors.black.withValues(alpha: 1),
                      ),
                      ),
                      Text(isOpen ? "Iniciado" : "Cerrado",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isConnected ? AppTheme.primary : AppTheme.primary,
                      ),
                                          ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 40, 
                height: 30,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Switch(
                    value: isOpen,
                    onChanged: (value) async {

                      if (value && !isOpen) {


                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black.withAlpha(200),
                          builder: (_) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: Builder(
                              builder: (innerContext) => OpenPoDialog(context:innerContext),
                            ),
                          ),
                        );

                      }else{

                         await CustomDialogService.showAlertDialog(context: context,content: ClosePoDialog());

                      }

                    },
                    activeTrackColor: AppTheme.primary.withOpacity(0.3),
                    inactiveTrackColor: Colors.blueGrey.withOpacity(0.1),
                    activeColor: AppTheme.primary,
                    inactiveThumbColor: Colors.blueGrey,
                  ),
                ),
              )
      
            ],
          )
        ),
      ),
    ) : Container();

  }

}