import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/point_of_sale_drawer_key.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:taqueria_vargas/helpers/extensions.dart';

class PointOfSaleLayout extends ConsumerWidget {

  final Widget child;

  const PointOfSaleLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context,ref) {

    final scaffoldKey = ref.read(scaffoldKeyProvider);

    return Container(
      color: AppTheme.backgroundColor,
      width: context.width,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
        
          backgroundColor: AppTheme.backgroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: context.height - MediaQuery.of(context).padding.top,
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 15
                ),
                child: Row(
                  children: [
                    AsideMenu(),
                    Expanded(
                      child: Column(
                        children: [
                          //HeaderSearchBar(),
                          Expanded(child: child),
                        ],
                      ),
                    ),
                    ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

}