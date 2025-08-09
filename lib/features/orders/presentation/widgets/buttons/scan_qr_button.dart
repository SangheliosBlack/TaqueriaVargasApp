import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:taqueria_vargas/core/core.dart';

class ScanQrButton extends StatelessWidget {

  const ScanQrButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Icon(
      BootstrapIcons.qr_code_scan,
      color: AppTheme.primary,
    );

  }

}