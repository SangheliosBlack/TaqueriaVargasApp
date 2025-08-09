
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/auth/data/repository/auth_repository_impl.dart';
import 'package:taqueria_vargas/features/auth/domain/repository/auth_repository.dart';

import 'providers.dart';

final authRepositoryDi = Provider<AuthRepository>((ref) {

  final authRemoteDataSourceService = ref.read(authRemoteDataSourceProvider); 
  final authLocalDataSourceService = ref.read(authLocalDataSourceProvider);

  return AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSourceService, 
    localDataSource: authLocalDataSourceService
  );
  
});
