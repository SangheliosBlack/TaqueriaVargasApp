import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/features/auth/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<DataState<UserEntity>> login({required LoginParams params}) async {

    final remoteResponse = await remoteDataSource.login(params: params);

    if(remoteResponse is DataSuccess){

      final responseToEntity = LoginUserResponseMapper.toLoginUserEntity(remoteResponse.data!);

      await localDataSource.saveToken(token: responseToEntity.accessToken);

      await localDataSource.saveUser(responseToEntity.user);

      return DataSuccess(responseToEntity.user);

    }
    
    return DataFailed(remoteResponse.error!);
    
  }
  
  @override
  Future<DataState<UserEntity>> loadUser() async {

    final remoteResponse = await remoteDataSource.userMe();

      final userEntity = UserMapper.toEntity(remoteResponse.data!);

      await localDataSource.saveUser(userEntity);

      return DataSuccess(userEntity);

    final localResponse = await localDataSource.getCachedUser();

    if(localResponse is DataSuccess){

      return DataSuccess(localResponse!.data!);

    }else{

      final remoteResponse = await remoteDataSource.userMe();

      final userEntity = UserMapper.toEntity(remoteResponse.data!);

      await localDataSource.saveUser(userEntity);

      return DataSuccess(userEntity);

    }
    
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