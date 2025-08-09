import 'package:taqueria_vargas/features/employees/application/use_cases/fetch_all_employees/fetch_all_employees_use_case.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final fetchAllEmployeesUseCaseDi = Provider<FetchAllEmployeesUseCase>((ref){

  final EmployeesRepository employeesRepository = ref.read(employeesRespositoryDi);

  return FetchAllEmployeesUseCase(employeesRepository: employeesRepository);

});