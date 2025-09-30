import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/core/usecase/usecase.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/login_user_response_entiti.dart';
import '../domain.dart';

class LoginUseCase implements UseCase<DataState<AuthUserEntity>, LoginParams> {
  
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  
   @override
  Future<DataState<AuthUserEntity>> execute({required LoginParams params}) {

    return _authRepository.login(params: params);
    
  }
 
}
