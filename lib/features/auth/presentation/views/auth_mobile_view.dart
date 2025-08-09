import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/auth/presentation/widgets/widgets.dart';
import 'package:taqueria_vargas/helpers/extensions.dart';

import 'views.dart';

class AuthMobileView extends StatelessWidget {

  const AuthMobileView({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        SizedBox(
          height: context.height,
          width: context.width,
          child: Image(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        BackgroundStack(),
        PageView(
          children: [
            WelcomeMobileView(),
            LoginMobileView()
          ],
        ),
      ],
    );

  }

}