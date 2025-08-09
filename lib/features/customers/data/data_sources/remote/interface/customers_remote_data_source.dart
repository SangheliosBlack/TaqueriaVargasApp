import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/customers/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/customers/domain/entities/create_customer_request_dto.dart';

abstract interface class CustomersRemoteDataSource {

  Future<DataState<FetchAllCustomersResponseDto>> fetchAllCustomers();
  Future<DataState<CustomerDto>> createCustomer({required CreateCustomerRequestDto request});

}