import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/router/route_observer.dart';
import 'package:taqueria_vargas/core/utils/transitions/custom_transitions.dart';
import 'package:taqueria_vargas/features/employees/presentation/screens/employees_screen.dart';
import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:taqueria_vargas/features/reports/presentation/screens/reports_screen.dart';
import 'package:taqueria_vargas/features/shared/presentation/layouts/point_of_sale_layout.dart';
import 'package:go_router/go_router.dart';

final poNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'PoNavigator');

class PointOfSaleNavigator{

  static routes  (Ref ref) =>  ShellRoute(
     observers: [
      GoRouterObserver(ref: ref),
    ],
    navigatorKey: poNavigationKey,
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithTestTransition(
        state: state,
        context: context,
        child: PointOfSaleLayout(child: child)
      );
    },
    routes: [
      GoRoute(
        path: PoHomeScreen.path,
        name: PoHomeScreen.path,
        builder: (_,__) => PoHomeScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: const PoHomeScreen()
          );
        },
      ),
      GoRoute(
        path: OrdersScreen.path,
        name: OrdersScreen.path,
        builder: (_,__) => OrdersScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: const OrdersScreen()
          );
        },
      ),
      GoRoute(
        path: ClientsScreen.path,
        name: ClientsScreen.path,
        builder: (_,__) => ClientsScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: const ClientsScreen()
          );
        },
      ),
      GoRoute(
        path: EmployeesScreen.path,
        name: EmployeesScreen.path,
        builder: (_,__) => EmployeesScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: const EmployeesScreen()
          );
        },
      ),
      GoRoute(
        path: ReportsScreen.path,
        name: ReportsScreen.path,
        builder: (_,__) => ReportsScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: const ReportsScreen()
          );
        },
      ),
      GoRoute(
        path: OrderDetail.path,
        name: OrderDetail.path,
        builder: (context, state) {

          final order = state.extra as OrderEntity?;

          return OrderDetail(order: order!);

        },
        pageBuilder: (context, state) {

          final order = state.extra as OrderEntity?;

          return PageTransitions.buildPageWithTestTransition(
            state: state,
            context: context,
            child: OrderDetail(order: order!),
          );
          
        },
      )
    ]
  );

}
