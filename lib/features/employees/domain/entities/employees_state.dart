import 'package:taqueria_vargas/features/employees/domain/domain.dart';

class EmployeesState {

  final Map<String, EmployeeEntity> employeesList;
  final bool isLoading; 

  EmployeesState({
    this.employeesList = const {},
    this.isLoading = true,
  });

  EmployeesState copyWith({
    Map<String, EmployeeEntity>? employeesList,
    bool? isLoading
  }) {
    return EmployeesState(
      employeesList: employeesList ?? this.employeesList,
      isLoading : isLoading ?? this.isLoading
    );
  }

}