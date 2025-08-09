import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/features/customers/application/use_cases/create_customer/create_customer.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

final createCustomerUseCaseDi = Provider<CreateCustomerUseCase>((ref){

  final CustomersRepository repository = ref.read(customersRespositoryDi);

  return CreateCustomerUseCase(repository: repository);

});