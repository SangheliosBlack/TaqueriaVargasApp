import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/employees/data/dtos/dtos.dart';

abstract interface class EmployeesRemoteDataSource {

  Future<DataState<FetchAllEmployeesResponseDto>> fetchAllEmployees();

}