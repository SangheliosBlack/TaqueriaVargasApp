import 'package:taqueria_vargas/features/orders/data/data_sources/remote/implementation/orders_remote_data_source_impl_di.dart';
import 'package:taqueria_vargas/features/orders/data/data_sources/remote/interface/orders_remote_data_source.dart';
import 'package:taqueria_vargas/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:taqueria_vargas/features/orders/domain/repositories/orders_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final ordersRepositoryDi = Provider<OrdersRepository>((ref){

  final OrdersRemoteDataSource remoteDataSource = ref.watch(ordersRemoteDataSourceDi);

  return OrdersRepositoryImpl(remoteDataSource: remoteDataSource);
  

});