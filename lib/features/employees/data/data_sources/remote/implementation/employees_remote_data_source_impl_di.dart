import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';
import 'package:taqueria_vargas/features/employees/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final employeesRemoteDataSourceDi = Provider<EmployeesRemoteDataSource>((ref){

  final httpClientService = ref.read(httpClientServiceProvider);

  return EmployeesRemoteDataSourceImpl(httpClientService: httpClientService);

});