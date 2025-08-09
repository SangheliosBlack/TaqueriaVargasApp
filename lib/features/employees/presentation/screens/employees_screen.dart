import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/employees/application/providers/providers.dart';
import 'package:taqueria_vargas/features/employees/domain/entities/employee_entity.dart';
import 'package:taqueria_vargas/features/shared/shared.dart' ;

class EmployeesScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/employees";

  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final employeesState = ref.watch(employeesProvider);

    return Container(
      color: AppTheme.backgroundColor,
      child: CoolDataTable<EmployeeEntity>(
        title: "Empleados",
        isLoading: employeesState.isLoading,
        data: employeesState.employeesList.values.toList(), 
        cellsPerPage: [
          20,30,50,100
        ],
        onRowTap: (EmployeeEntity item) {  
      
          
      
        },
        totalDocuments: 126,
        headers: [
          RowHeader(
            title: 'Id',
            alignment: Alignment.center,
            width: 60
          ),
          RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
          RowHeader(
            title: 'Celular',
            alignment: Alignment.centerLeft,
          ),
          RowHeader(
            title: 'Company',
            alignment: Alignment.centerLeft,
          ),
        ], 
        buildRow: (EmployeeEntity employee) {     
          return [
            RowCell(
              width: 60,
              text: employee.id.toString(),
              alignment: Alignment.center,
            ),
            RowCell(
              text: employee.fullName,
            ),
            RowCell(
              text:employee.phone
            ),
            RowCell(
              text:employee.companyBranchId.toString()
            )
          ];
        },
      ),
    );

  }

}