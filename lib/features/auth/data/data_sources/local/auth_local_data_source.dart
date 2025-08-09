import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthLocalDataSource {
  
  Future<void> saveToken({required String token});
  Future<void> saveUser(UserEntity userData);
  Future<DataState<UserEntity>>? getCachedUser();
  
}