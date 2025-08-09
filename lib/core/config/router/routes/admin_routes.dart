import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/router/route_observer.dart';
import 'package:taqueria_vargas/core/utils/transitions/custom_transitions.dart';
import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/features/shared/presentation/layouts/admin_layout.dart';
import 'package:go_router/go_router.dart';


final adminNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'AdminNavigator');

class AdminNavigator{

  static routes (Ref ref) =>  ShellRoute(
     observers: [
      GoRouterObserver(ref: ref),
    ],
    navigatorKey: adminNavigationKey,
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeInFromCenter(
        state: state,
        context: context,
        child: AdminLayout(child: child)
      );
    },
    routes: [
      GoRoute(
        path: AdminHomeScreen.path,
        name: AdminHomeScreen.path,
        builder: (_,__) => AdminHomeScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const AdminHomeScreen()
          );
        },
      ),
      GoRoute(
        path: TransportUnitsScreen.path,
        name: TransportUnitsScreen.path,
        builder: (_,__) => TransportUnitsScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const TransportUnitsScreen()
          );
        },
      ),
    ]
  );

}
