import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';

class FetchAllEmployeesUseCase {

  final EmployeesRepository employeesRepository;

  FetchAllEmployeesUseCase({required this.employeesRepository});

  Future<DataState<Map<String, EmployeeEntity>>> execute(){

    return employeesRepository.fetchAllEmployees();

  }  

}