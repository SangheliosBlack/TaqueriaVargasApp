import 'package:taqueria_vargas/features/auth/application/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/domain.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {

  final authRepository = ref.read(authRepositoryDi);

  return LoginUseCase(authRepository);
  
});