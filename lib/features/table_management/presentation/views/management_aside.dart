import 'package:flutter/material.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/management_filter_buttons.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/management_filter_by_persons.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/management_search.dart';

class ManagementAside extends StatelessWidget {

  const ManagementAside({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor ,
        borderRadius: BorderRadius.circular(10)      
      ),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            ManagementSearch(),
            ManagementFilterButtons(),
            ManagementFilterByPersonsButtons()
          ],
      ),
    );

  }

}