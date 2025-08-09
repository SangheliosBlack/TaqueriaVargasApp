import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';
import 'package:taqueria_vargas/features/customers/data/data_sources/remote/implementation/customers_remote_data_source_impl.dart';
import 'package:taqueria_vargas/features/customers/data/data_sources/remote/interface/customers_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final customersRemoteDataSourceDi = Provider<CustomersRemoteDataSource>((ref){

  final httpClientService = ref.read(httpClientServiceProvider);

  return CustomersRemoteDataSourceImpl(httpClientService: httpClientService);

});