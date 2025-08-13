import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/table_management/presentation/widgets/management_filter_by_persons_button.dart';

class ManagementFilterByPersonsButtons extends StatelessWidget {

  const ManagementFilterByPersonsButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 45,
      child: Row(
        spacing: 10,
        children: [
          ManagementFilterByPersonsButton(
            label: 'ALL', 
            description: "x7",
          ),
          ManagementFilterByPersonsButton(
            label: '1-3', 
            description: "x1",
          ),
          ManagementFilterByPersonsButton(
            label: '4-6', 
            description: "x4",
          ),
          ManagementFilterByPersonsButton(
            label: '7-16', 
            description: "x2",
          ),
        ],
      ),
    );

  }

}