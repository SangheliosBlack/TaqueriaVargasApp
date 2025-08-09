import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';
import 'package:taqueria_vargas/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSourceImpl>((ref) {

  final httpClientService = ref.read(httpClientServiceProvider);

  return AuthRemoteDataSourceImpl(httpClientService: httpClientService);

});