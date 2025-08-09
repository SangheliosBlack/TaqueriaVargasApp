import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/core/usecase/usecase.dart';
import '../domain.dart';

class LoginUseCase implements UseCase<DataState<UserEntity>, LoginParams> {
  
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  
   @override
  Future<DataState<UserEntity>> execute({required LoginParams params}) {

    return _authRepository.login(
      params: params
    );
    
  }
 
}
