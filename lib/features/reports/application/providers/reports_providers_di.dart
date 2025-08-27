import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/http_client/http_client_provider.dart';
import 'package:taqueria_vargas/features/reports/application/use_cases/get_all_ordes_admin.dart';
import 'package:taqueria_vargas/features/reports/application/use_cases/get_all_register_turns.dart';
import 'package:taqueria_vargas/features/reports/data/data_sources/remote/reports_remore_data_source.dart';
import 'package:taqueria_vargas/features/reports/data/data_sources/remote/reports_remore_data_source_impl.dart';
import 'package:taqueria_vargas/features/reports/data/repositories/report_repository_impl.dart';
import 'package:taqueria_vargas/features/reports/domain/repositories/report_repository.dart';

//DATA_SOURCE
final reportsRemoteDataSourceDi = Provider<ReportRemoteDataSource>((ref) {

  final httpClientService = ref.read(httpClientServiceProvider);

  return ReportRemoteDataSourceImpl(httpClientService: httpClientService);

});

//REPOSITORY
final reportsRepostoryDi = Provider<ReportsRepository>((ref) {

  final remoteDataSource = ref.read(reportsRemoteDataSourceDi);

  return ReportRepositoryImpl(remoteDataSource: remoteDataSource);

});

//USE_CASES
final getAllReportsTurnsDi =  Provider<GetAllRegisterTurns>((ref) {
  
  final repository = ref.read(reportsRepostoryDi);
  
  return GetAllRegisterTurns(repository: repository);
  
});

final getAllOrdersAdminDi =  Provider<GetAllOrdersAdmin>((ref) {
  
  final repository = ref.read(reportsRepostoryDi);
  
  return GetAllOrdersAdmin(repository: repository);
  
});


