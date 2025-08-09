import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/customers/domain/entities/entities.dart';

abstract interface class CustomersRepository{

  Future<DataState<Map<String, CustomerEntity>>> fetchAllCustomers();
  Future<DataState<CustomerEntity>> createCustomer({required CreateCustomerRequestDto request});

}