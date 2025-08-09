import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/features/employees/data/data.dart';
import 'package:taqueria_vargas/features/employees/domain/repositories/repositories.dart';

final employeesRespositoryDi = Provider<EmployeesRepository>((ref){

  final EmployeesRemoteDataSource remoteDataSource = ref.read(employeesRemoteDataSourceDi);

  return EmployeesRepositoryImpl(remoteDataSource: remoteDataSource);

});