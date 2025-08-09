import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/auth/application/use_cases/get_current_turn/get_current_turn_use_case.dart';
import 'package:taqueria_vargas/features/auth/application/use_cases/get_current_turn/get_current_turn_use_case_di.dart';
import 'package:taqueria_vargas/features/auth/application/use_cases/load_user/load_user_use_case.dart';
import 'package:taqueria_vargas/features/auth/application/use_cases/load_user/load_user_use_case_di.dart';

class AuthUseCases {

  final Ref ref;

  AuthUseCases({required this.ref});

  LoadUserCase get loadUser => ref.read(loadUserCaseProvider);
  GetCurrentTurnUseCase get getCurrentTurn => ref.read(getCurrentTurnUseCaseDi);

}

final useCasesAuth = Provider((ref) => AuthUseCases(ref: ref) );