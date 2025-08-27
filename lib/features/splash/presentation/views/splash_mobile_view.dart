import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';

class SplashMobileView extends StatelessWidget {

  const SplashMobileView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo_taqueria copia.png',
        ),
      ),
    );
  }
  
}
