import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/login_user_response_entiti.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<DataState<AuthUserEntity>> login({required LoginParams params}) async {

    final remoteResponse = await remoteDataSource.login(params: params);

    if(remoteResponse is DataSuccess){

      final responseToEntity = AuthResponseMapper.toLoginUserEntity(remoteResponse.data!);

      // Solo guardar el token si no es null
      if (responseToEntity.accessToken != null) {
        await localDataSource.saveToken(token: responseToEntity.accessToken!);
      }

      await localDataSource.saveUser(responseToEntity.user);

      return DataSuccess(responseToEntity);

    }
    
    return DataFailed(remoteResponse.error!);
    
  }
  
  @override
  Future<DataState<AuthUserEntity>> loadUser() async {

    final remoteResponse = await remoteDataSource.userMe();

     if(remoteResponse is DataSuccess){

      final responseToEntity = AuthResponseMapper.toLoginUserEntity(remoteResponse.data!);

      if (responseToEntity.accessToken != null) {
        await localDataSource.saveToken(token: responseToEntity.accessToken!);
      }

      await localDataSource.saveUser(responseToEntity.user);

      return DataSuccess(responseToEntity);

    }

    return DataFailed(remoteResponse.error!);
    
  }
  
  @override
  Future<DataState<CurrentTurnEntity?>> getCurrentTurn() async {
    
    final remoteResponse = await remoteDataSource.getCurrentTurn();

    if(remoteResponse is DataSuccess){

      final responseToEntity = CurrentTurnMapper.toEntity(remoteResponse.data!);

      return DataSuccess(responseToEntity);

    }
    
    return DataFailed(remoteResponse.error!);

  }

}