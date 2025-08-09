import 'package:taqueria_vargas/features/auth/application/use_cases/get_current_turn/get_current_turn.dart';
import 'package:taqueria_vargas/features/auth/application/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getCurrentTurnUseCaseDi = Provider<GetCurrentTurnUseCase>((ref){

  final authRepository = ref.watch(authRepositoryDi);

  return GetCurrentTurnUseCase(authRepository: authRepository);

});