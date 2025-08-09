import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/user_entity.dart';
import 'package:taqueria_vargas/features/auth/domain/repository/auth_repository.dart';

class LoadUserCase {

  final AuthRepository _authRepository;

  LoadUserCase(this._authRepository);
  
  Future<DataState<UserEntity>> call() async {
    
    return  _authRepository.loadUser();
    
  }
 
}
