import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:taqueria_vargas/features/customers/application/providers/customers_provider.dart';
import 'package:taqueria_vargas/features/customers/presentation/screens/new_client_screen.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';

class SelectClientAvatar extends ConsumerWidget {

  const SelectClientAvatar({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final clientState = ref.watch(orderCartProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 240,
          child: Container(
            margin: EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                opacity: clientState.selectedSaleTypeId != 6 ? 1 : 0,
                duration: Durations.medium1,
                  child: GestureDetector(
                    onTap: clientState.selectedSaleTypeId != 6 ? (){
                        
                      if (clientState.clientSelected == null) {
                        
                        context.pushNamed(AddNewClientScreen.path);
                        
                      } else {
                        
                        ref.read(customersProvider.notifier).getClientByPhone(phone: "");
                        
                      }
                        
                    } : null,
                    behavior: HitTestBehavior.translucent,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: clientState.clientSelected == null 
                                  ? AppTheme.primary.withValues(alpha: 0.2) 
                                  : AppTheme.primary.withValues(alpha: 0.3),
                              width: 1,
                            ),
                           
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: clientState.clientSelected == null 
                                      ? AppTheme.primary.withValues(alpha: .1) 
                                      : Colors.green.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  clientState.clientSelected != null 
                                      ? BootstrapIcons.person_check 
                                      : BootstrapIcons.person_plus,
                                  color: clientState.clientSelected == null 
                                      ? AppTheme.primary 
                                      : Colors.green.shade700,
                                  size: 16,
                                ),
                              ),
                              Gap(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      clientState.clientSelected?.fullName ?? "Seleccionar cliente",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: AppTheme.primary,
                                        fontSize: clientState.clientSelected != null ? 13 : 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    if (clientState.clientSelected != null) ...
                                    [
                                      SizedBox(height: 2),
                                      Row(
                                      children: [
                                        Icon(
                                        BootstrapIcons.telephone,
                                        color: AppTheme.primary.withValues(alpha: 0.7),
                                        size: 12,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                        clientState.clientSelected!.phone,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black.withValues(alpha: .6),
                                          fontSize: 10,
                                        ),
                                        ),
                                      ],
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              // Indicador de navegación para cliente sin seleccionar
                              if (clientState.clientSelected == null)
                                Icon(
                                  BootstrapIcons.chevron_right,
                                  color: AppTheme.primary.withValues(alpha: 0.5),
                                  size: 14,
                                ),
                            ],
                          ),
                        ),
                        // Badge de eliminar cliente en la esquina superior derecha
                        if (clientState.clientSelected != null)
                          Positioned(
                            top: -10,
                            right: -10,
                            child: GestureDetector(
                              onTap: () {
                                ref.read(customersProvider.notifier).getClientByPhone(phone: "");
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade500,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.red.withValues(alpha: 0.4),
                                      blurRadius: 8,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  BootstrapIcons.x,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }

}