import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/local_storage/local_storage_provider.dart';
import 'package:taqueria_vargas/features/auth/data/data_sources/local/auth_local_data_source_impl.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSourceImpl>((ref) {

  final localStorageService = ref.read(localStorageServiceProvider);

  return AuthLocalDataSourceImpl(
    localStorageService:localStorageService
  );

});