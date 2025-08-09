import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

class CreateCustomerUseCase {

  final CustomersRepository repository;

  CreateCustomerUseCase({required this.repository});

  Future<DataState<CustomerEntity>> execute({required CreateCustomerRequestDto requestDto}){

    return repository.createCustomer(request: requestDto);

  }  

}


