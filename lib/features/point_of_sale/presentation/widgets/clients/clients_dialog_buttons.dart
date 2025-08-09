import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/customers/application/providers/providers.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/widgets/buttons/sb_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsDialogButtons extends ConsumerWidget {

  const ClientsDialogButtons({super.key,});

  @override
  Widget build(BuildContext context,ref) {
    
    final bool formStatusIsValid = ref.watch(clientFormProvider).isValid;

    final clientSelected = ref.watch(orderCartProvider).clientSelected;
    
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,horizontal: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20)
        ),
        
        color: Colors.white
      ),
      child: Row(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SbButton(
            color: Colors.transparent,
            title: 'Cancelar',
            onTap: () {

              ref.read(orderCartProvider.notifier).removeClient();

              Navigator.pop(context);
              
            },
            textStyle: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          SbButton(
            color: formStatusIsValid || clientSelected != null ?  AppTheme.primary: Colors.grey,
            borderRadius: BorderRadius.circular(50),
            textStyle: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
            title: clientSelected != null ? "Agregar a la orden" : 'Guardar',
            onTap: formStatusIsValid || clientSelected != null ? () { 

              ref.read(customersProvider.notifier).addClient(addInmediately: true);

              context.pop();

            } : null, 
          )
        ],
      ),
    );

  }

}