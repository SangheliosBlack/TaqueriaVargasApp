import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/employees/data/data.dart';
import 'package:taqueria_vargas/features/employees/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';

class EmployeesRepositoryImpl implements EmployeesRepository {

  final EmployeesRemoteDataSource remoteDataSource;

  EmployeesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataState<Map<String, EmployeeEntity>>> fetchAllEmployees() async {

    final remoteResponse = await remoteDataSource.fetchAllEmployees();

    if(remoteResponse is DataSuccess){

      final responseToEntity = EmployeesMapper.fromDtoList(dtoList: remoteResponse.data!.products);

      return DataSuccess(responseToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }
  
}