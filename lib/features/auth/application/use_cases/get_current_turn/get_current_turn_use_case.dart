import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/core/usecase/usecase.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/current_turn_entity.dart';
import 'package:taqueria_vargas/features/auth/domain/repository/auth_repository.dart';

class GetCurrentTurnUseCase implements NoParamsUseCase<DataState<CurrentTurnEntity?>> {

  final AuthRepository authRepository;

  GetCurrentTurnUseCase({required this.authRepository});

  @override
  Future<DataState<CurrentTurnEntity?>> call(){
  
    return authRepository.getCurrentTurn();

  }

}