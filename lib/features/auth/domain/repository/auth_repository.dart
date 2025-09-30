

import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/current_turn_entity.dart';
import 'package:taqueria_vargas/features/auth/domain/entities/login_user_response_entiti.dart';
import 'package:taqueria_vargas/features/auth/domain/params/login_params.dart';


abstract class AuthRepository {

  Future<DataState<AuthUserEntity>> login({required LoginParams params});
  Future<DataState<CurrentTurnEntity?>> getCurrentTurn();
  Future<DataState<AuthUserEntity>> loadUser();

}