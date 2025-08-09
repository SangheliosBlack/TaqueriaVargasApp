import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/auth/application/use_cases/load_user/load_user_use_case.dart';
import 'package:taqueria_vargas/features/auth/application/providers/auth_repository_provider.dart';

final loadUserCaseProvider = Provider<LoadUserCase>((ref){

  final authRepository = ref.read(authRepositoryDi);

  return LoadUserCase(authRepository);

});