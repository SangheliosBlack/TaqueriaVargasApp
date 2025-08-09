import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';

abstract interface class EmployeesRepository{

  Future<DataState<Map<String, EmployeeEntity>>> fetchAllEmployees();

}