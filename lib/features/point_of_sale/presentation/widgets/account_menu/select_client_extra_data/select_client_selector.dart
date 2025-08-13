import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          width: 210,
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
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color:  AppTheme.secondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: clientState.clientSelected == null ?  AppTheme.primary.withValues(alpha: .1) : const Color.fromARGB(255, 255, 220, 217),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical:   7,
                            ),
                            child: Icon(
                              clientState.clientSelected != null ? BootstrapIcons.dash_circle :  BootstrapIcons.plus_circle,
                              color: clientState.clientSelected == null ?  AppTheme.primary: const Color.fromARGB(255, 255, 77, 65),
                              size: 15,
                            ),
                          ),
                            Expanded(
                              child: Text(
                                clientState.clientSelected?.fullName ?? "Cliente no seleccionado",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: AppTheme.primary,
                                  fontSize: 11,
                                ),
                              ),
                            )
                        ],
                      ),
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