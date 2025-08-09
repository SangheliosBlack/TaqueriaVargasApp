import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/features/customers/application/use_cases/use_cases.dart';

class CustomersUseCases {

  final Ref ref;

  CustomersUseCases({required this.ref});

  FetchAllCustomersUseCase get fetchAllCustomers => ref.read(fetchAllCustomersUseCaseDi);
  CreateCustomerUseCase get createCustomer => ref.read(createCustomerUseCaseDi);


}

final useCasesCustomers = Provider((ref) => CustomersUseCases(ref: ref) );