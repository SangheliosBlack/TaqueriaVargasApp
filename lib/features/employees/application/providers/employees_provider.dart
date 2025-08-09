import 'package:taqueria_vargas/features/employees/application/use_cases/use_cases.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:taqueria_vargas/core/core.dart';

part 'employees_provider.g.dart';

@Riverpod(keepAlive: true)
class Employees extends _$Employees {

  @override
  EmployeesState build() {

    fetchAllEmployees();

    return EmployeesState();
  }

  EmployeesUseCases get useCases => ref.read(useCasesEmployees);

  Future<void> fetchAllEmployees() async {

    final response = await useCases.fetchAllEmployees.execute();

    if(response is DataSuccess){

      state = state.copyWith(
        employeesList: response.data,
        isLoading: false
      );

    }

  }


}