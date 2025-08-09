import 'package:taqueria_vargas/core/services/http_client/http_client.dart';
import 'package:taqueria_vargas/features/orders/data/data_sources/remote/implementation/orders_remote_data_source_impl.dart';
import 'package:taqueria_vargas/features/orders/data/data_sources/remote/interface/orders_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final ordersRemoteDataSourceDi = Provider<OrdersRemoteDataSource>((ref){

  final HttpClientService httpClientService = ref.read(httpClientServiceProvider);

  return OrdersRemoteDataSourceImpl(httpClientService: httpClientService);

});