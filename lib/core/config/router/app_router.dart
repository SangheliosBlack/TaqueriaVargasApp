import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:taqueria_vargas/core/config/router/routes/out_routes.dart';

import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/core/core.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  final appRouterNotifier = ref.watch(appRouterNotifierProvider);

  return GoRouter(
    initialLocation: SplashScreen.path,
    debugLogDiagnostics: true,
    refreshListenable: appRouterNotifier,
    navigatorKey: rootNavigatorKey,
    observers: [
      GoRouterObserver(ref: ref),
    ],
    errorBuilder: ((context, state){
      
      Logger.error(message: 'Ruta no encontrada: ${state.uri}');

      return NotFoundedScreen();

    }),
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.path,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_,__) => SplashScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const SplashScreen()
          );
        },
      ),
      GoRoute(
        path: HiScreen.path,
        name: HiScreen.path,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_,__) => HiScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const HiScreen()
          );
        },
      ),
      PointOfSaleNavigator.routes(ref),
      AuthNavigator.routes(ref),
      AdminNavigator.routes(ref),
      OutNavigator.routes(ref),
    ],
    redirect: (context,state){

      final authStatus = appRouterNotifier.authenticationStatus;

      final location = state.uri.toString();

      if(authStatus == AuthenticationStatus.notAuthenticated  && location == "/"){

        return LoginScreen.path;

      }

      if (authStatus == AuthenticationStatus.notAuthenticated && location != LoginScreen.path) {

        return LoginScreen.path;

      }

      

      if (authStatus == AuthenticationStatus.authenticated ) {

        if(location == "/" || location ==  LoginScreen.path){

          // Obtener el usuario actual para verificar su rol
          final currentUser = appRouterNotifier.currentUser;
          
          // Solo redirigir si el usuario está completamente cargado
          if (currentUser != null) {
            // Si es mesero, redirigir a OrdersScreen
            if (currentUser.isCashier || currentUser.isAdmin) {
              return OrdersScreen.path;
            }
            // Si es cajero o admin, redirigir a PoHomeScreen
            else {
              return PoHomeScreen.path;
            }
          } else {
            // Si no hay usuario aún, no redirigir (esperar a que se cargue)
            return null;
          }

        }

      }

      return null;

    }
  );

}