import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/router/current_route.dart';
import 'package:taqueria_vargas/features/employees/presentation/screens/employees_screen.dart';
import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/header_menu/current_turn_start_date.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/header_menu/printer_widget.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/aside_menu/avatar_company.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:taqueria_vargas/features/reports/presentation/screens/reports_screen.dart';
import 'package:taqueria_vargas/features/table_management/presentation/screens/table_management_screen.dart';

class AsideMenu extends ConsumerWidget {

  const AsideMenu({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final route = ref.watch(currentRouteProvider);

    final isMenuOpen = ref.watch(pointOfSaleProvider.select((state) => state.isMenuOpen));

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 150),
          width: isMenuOpen ? 240 : 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(
            top: 10,
          ),
          margin: EdgeInsets.only(
            right: 15,
          ),
          child: Column(
            children: [
              AvatarCompany(),
              Divider(
                color: Colors.blueGrey.withValues(alpha: .15),
                height: 30
              ),
              AsideButton(
                active: route == PoHomeScreen.path,
                icon: BootstrapIcons.house,
                path: PoHomeScreen.path,
                onTap: (){
        
                  context.push(PoHomeScreen.path);
        
                }, 
                label: 'Home', 
              ),
              AsideButton(
                active: route == OrdersScreen.path,
                icon: BootstrapIcons.graph_up,
                //hasAccess: user!.isCashier,
                path: OrdersScreen.path,
                onTap: (){
        
                  context.push(OrdersScreen.path);
        
                },
                label: 'Ordenes', 
              ),
              AsideButton(
                active: route == ClientsScreen.path,
                icon: BootstrapIcons.people,
                path: ClientsScreen.path,
                onTap: (){
        
                  context.push(ClientsScreen.path);
        
                },
                label: 'Clientes', 
              ),
              AsideButton(
                active: route == EmployeesScreen.path,
                icon: BootstrapIcons.person_vcard,
                path: EmployeesScreen.path,
                onTap: (){
        
                  context.push(EmployeesScreen.path);
        
                },
                label: 'Empleados', 
              ),
              AsideButton(
                active: route == ReportsScreen.path,
                icon: BootstrapIcons.calendar2_date,
                path: ReportsScreen.path,
                onTap: (){
        
                  context.push(ReportsScreen.path);
        
                },
                label: 'Turnos', 
              ),
              AsideButton(
                active: route == TableManagementScreen.path,
                icon: BootstrapIcons.house_gear,
                path: TableManagementScreen.path,
                onTap: (){
        
                  context.push(TableManagementScreen.path);
        
                },
                label: 'Mi espacio', 
              ),
              Spacer(),
              Divider(
                color: Colors.blueGrey.withValues(alpha: .15),
                height: 30
              ),
              Column(
                spacing: 8,
                children: [
                  PrinterWidget(),
                  CurrentTurnStartDate(),
                ],
              ),
              ProfileCard(),
            ],
          ),
        ),
        Positioned(
          bottom: 190,
          right: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => ref.read(pointOfSaleProvider.notifier).toggleMenu(),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width:  40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_circle_right_rounded,
                    size: 40,
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }

}