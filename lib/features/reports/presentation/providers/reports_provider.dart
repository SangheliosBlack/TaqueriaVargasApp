import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taqueria_vargas/features/reports/application/providers/reports_use_cases_providers.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_state.dart';

part 'reports_provider.g.dart';

@Riverpod(keepAlive: true)
class Reports extends _$Reports {

  @override 
  ReportsState build() => ReportsState();

  ReportsUseCasesProviders get useCases => ref.read(reportsUseCasesProviders);

  Future<void> fetchAllTurns() async {

    final request = GetAllRegisterTurnsRequestEntity(
      companyBranchId: 1,
      page: 1,
      pageSize: 20,
    );

    final result = await useCases.getAllRegisterTurns(request: request);

    result.fold(
      (error){

        state = state.copyWith(isLoading: false);

      }, 
      (data){

        state = state.copyWith(
          isLoading: false,
          list: data
        );

      }
    );

    

  }

}