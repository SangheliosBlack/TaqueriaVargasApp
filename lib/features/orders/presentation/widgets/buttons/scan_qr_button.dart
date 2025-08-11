import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/order_scanner_qr_screen.dart';

class ScanQrButton extends StatelessWidget {

  const ScanQrButton({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){

        context.pushNamed(QRScannerScreen.path);

      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        BootstrapIcons.qr_code_scan,
        color: AppTheme.primary,
      ),
    );

  }

}