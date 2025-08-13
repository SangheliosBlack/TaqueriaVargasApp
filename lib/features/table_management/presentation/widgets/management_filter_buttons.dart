import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/management_filter_button.dart';

class ManagementFilterButtons extends StatelessWidget {

  const ManagementFilterButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 70,
      child: Row(
        spacing: 10,
        children: [
          ManagementFilterButton(
            label: 'Activos', 
            icon: BootstrapIcons.folder_check,
          ),
          ManagementFilterButton(
            label: 'Espera', 
            icon: BootstrapIcons.folder_check,
          ),
          ManagementFilterButton(
            label: 'Historial', 
            icon: BootstrapIcons.clock,
          ),
        ],
      ),
    );

  }

}