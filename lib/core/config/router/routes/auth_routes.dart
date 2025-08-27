import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/shared/presentation/layouts/auth_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:taqueria_vargas/features/features_screens.dart';

import '../../../utils/transitions/custom_transitions.dart';

final authNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'AuthNavigator');

class AuthNavigator{

  static routes (Ref ref) => ShellRoute(
    navigatorKey: authNavigatorKey,
    pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeInFromCenter(
        state: state,
        context: context,
        child: AuthLayout(child: child)
      );
    },
    builder: (_,__,child) => AuthLayout(child: child),
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.path,
        builder: (_,__) => LoginScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: LoginScreen()
          );
        },
      ),
    ]
  );

}


