import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/customers/data/data_sources/remote/interface/interface.dart';
import 'package:taqueria_vargas/features/customers/data/mappers/customers_entity.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

class CustomersRepositoryImpl implements CustomersRepository {

  final CustomersRemoteDataSource remoteDataSource;

  CustomersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataState<Map<String, CustomerEntity>>> fetchAllCustomers() async {

    final remoteResponse = await remoteDataSource.fetchAllCustomers();

    if(remoteResponse is DataSuccess){

      final responseToEntity = CustomerMapper.fromDtoList(dtoList: remoteResponse.data!.products);

      return DataSuccess(responseToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }
  
  @override
  Future<DataState<CustomerEntity>> createCustomer({required CreateCustomerRequestDto request}) async {

    final remoteResponse = await remoteDataSource.createCustomer(request: request);

    if(remoteResponse is DataSuccess){

      final responseToEntity = CustomerMapper.fromDto(dto: remoteResponse.data!);

      return DataSuccess(responseToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }


    
  }

}