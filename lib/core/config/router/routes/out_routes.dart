
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taqueria_vargas/core/config/router/route_observer.dart';
import 'package:taqueria_vargas/core/utils/transitions/custom_transitions.dart';
import 'package:taqueria_vargas/features/customers/presentation/screens/new_client_screen.dart';

final outNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'OutNavigator');

class OutNavigator {
  static routes(Ref ref) => ShellRoute(
    observers: [
      GoRouterObserver(ref: ref),
    ],
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeInFromCenter(
        state: state,
        context: context,
        child: Container(child: child)
      );},
    navigatorKey: outNavigationKey,
    routes: [
      GoRoute(
        path: AddNewClientScreen.path,
        name: AddNewClientScreen.path,
        builder: (_,__) => AddNewClientScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: AddNewClientScreen()
          );
        },
      ),
    ],
  );
}