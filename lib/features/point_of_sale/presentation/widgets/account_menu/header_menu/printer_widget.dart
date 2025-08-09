import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/point_of_sale_drawer_key.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

class PrinterWidget extends ConsumerWidget {
  
    const PrinterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final isConnected = ref.watch(printerConnectionProvider);

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    return GestureDetector(
      onTap: (){

        ref.read(scaffoldKeyProvider).currentState?.openEndDrawer();

      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        height: 50,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
        child: !isMenuOpen 
        ? Icon(
          isConnected ? BootstrapIcons.printer_fill : BootstrapIcons.printer,
          color: isConnected ?  AppTheme.primary : Colors.black.withValues(alpha: .6),
          size: 20,
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(
              isConnected ? BootstrapIcons.printer_fill : BootstrapIcons.printer,
              color: isConnected ?  AppTheme.primary : Colors.black.withValues(alpha: .6),
              size: 20,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Impresora",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      color: isConnected ? AppTheme.primary : Colors.black.withValues(alpha: 1),
                    ),
                    ),
                    Text(isConnected ? "Conectada" : "Desconectada",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: isConnected ? AppTheme.primary : AppTheme.primary,
                    ),
                                        ),
                  ],
                ),
            ) 
          ],
        ),
      ),
    );
  }
}
