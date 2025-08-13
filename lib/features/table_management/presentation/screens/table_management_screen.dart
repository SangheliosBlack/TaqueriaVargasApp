import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'dart:math' as math;

import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/table_management/presentation/views/management_aside.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/tables/table_4.dart';

class TableManagementScreen extends ConsumerStatefulWidget {

  static const String path = "/point-of-sale/table-management";

  const TableManagementScreen({super.key});

  @override
  ConsumerState<TableManagementScreen> createState() => _ReportsScreenState();

}

class _ReportsScreenState extends ConsumerState<TableManagementScreen> {

  @override
  void initState() {

    super.initState();

     Future.microtask(() {
      ref.read(reportsProvider.notifier).fetchAllTurns();
    });

  }

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
          ) ,
            child: Text(
              "Administrador de mesas",
              style: GoogleFonts.poppins(
                color: Colors.black.withValues(alpha: .8),
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          Divider(color: Colors.grey.withValues(alpha: .1),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ManagementAside(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Table4(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

  }
}
