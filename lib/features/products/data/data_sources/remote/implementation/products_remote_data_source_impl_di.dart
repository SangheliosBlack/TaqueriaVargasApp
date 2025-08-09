import 'package:taqueria_vargas/core/services/http_client/http_client_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:taqueria_vargas/features/products/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';

final productsRemoteDataSourceDi = Provider<ProductsRemoteDataSource>((ref){

  final HttpClientService httpService = ref.read(httpClientServiceProvider);

  return ProductsRemoteDataSourceImpl(httpClientService: httpService);

});