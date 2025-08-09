import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

class FetchAllCustomersUseCase {

  final CustomersRepository customersRepository;

  FetchAllCustomersUseCase({required this.customersRepository});

  Future<DataState<Map<String, CustomerEntity>>> execute(){

    return customersRepository.fetchAllCustomers();

  }  

}