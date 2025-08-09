import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/close_po.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/close_turn.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/open_po.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/use_cases/open_turn.dart';
import 'package:taqueria_vargas/features/point_of_sale/data/data_sources/remote/point_of_sale_remote_data_source.dart';
import 'package:taqueria_vargas/features/point_of_sale/data/data_sources/remote/point_of_sale_remote_data_source_impl.dart';
import 'package:taqueria_vargas/features/point_of_sale/data/repositories/point_of_sale_repository_impl.dart';
import 'package:taqueria_vargas/features/point_of_sale/domain/repositories/point_of_sale_repository.dart';

//REMOTE_DATA_SOURCE_DI
final pointOfSaleRemoteDataSourceDi = Provider<PointOfSaleRemoteDataSource>((ref) {
  
  final httpClientService = ref.read(httpClientServiceProvider);
  
  return PointOfSaleRemoteDataSourceImpl(httpClientService: httpClientService);

});

//REPOSITORY_DATA_SOURCE_DI
final pointOfSaleRepositotyDi = Provider<PointOfSaleRepository>((ref) {
  
  final remoteDataSource = ref.read(pointOfSaleRemoteDataSourceDi);
  
  return PointOfSaleRepositoryImpl(remoteDataSource: remoteDataSource);

});

//USE_CASES_DI
final openTurnUseCaseDi = Provider<OpenTurn>((ref)  {

  final repository = ref.read(pointOfSaleRepositotyDi);

  return  OpenTurn(repository: repository);

});

final closeTurnUseCaseDi = Provider<CloseTurn>((ref)  {

  final repository = ref.read(pointOfSaleRepositotyDi);

  return  CloseTurn(repository: repository);

});

final closePoUseCaseDi = Provider<ClosePo>((ref)  {

  final repository = ref.read(pointOfSaleRepositotyDi);

  return  ClosePo(repository: repository);

});

final openPoUseCaseDi = Provider<OpenPo>((ref)  {

  final repository = ref.read(pointOfSaleRepositotyDi);

  return  OpenPo(repository: repository);

});

