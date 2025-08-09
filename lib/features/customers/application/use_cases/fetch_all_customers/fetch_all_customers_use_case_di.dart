import 'package:taqueria_vargas/features/customers/application/use_cases/fetch_all_customers/fetch_all_customers_use_case.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final fetchAllCustomersUseCaseDi = Provider<FetchAllCustomersUseCase>((ref){

  final CustomersRepository customersRepository = ref.read(customersRespositoryDi);

  return FetchAllCustomersUseCase(customersRepository: customersRepository);

});