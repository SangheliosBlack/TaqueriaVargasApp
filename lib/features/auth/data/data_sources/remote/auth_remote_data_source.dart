import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';

abstract interface class AuthRemoteDataSource {

  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params});
  Future<DataState<CurrentTurnDto?>> getCurrentTurn();
  Future<DataState<UserLoginResponseDTO>> userMe();
  
}