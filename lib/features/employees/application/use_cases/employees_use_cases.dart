import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/features/employees/application/use_cases/use_cases.dart';

class EmployeesUseCases {

  final Ref ref;

  EmployeesUseCases({required this.ref});

  FetchAllEmployeesUseCase get fetchAllEmployees => ref.read(fetchAllEmployeesUseCaseDi);

}

final useCasesEmployees = Provider((ref) => EmployeesUseCases(ref: ref) );