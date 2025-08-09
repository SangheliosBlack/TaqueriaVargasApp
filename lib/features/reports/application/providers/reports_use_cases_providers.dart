import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/reports/application/providers/reports_providers_di.dart';
import 'package:taqueria_vargas/features/reports/application/use_cases/get_all_register_turns.dart';

class ReportsUseCasesProviders {

  final Ref ref; 

  ReportsUseCasesProviders({required this.ref});
    
  GetAllRegisterTurns get getAllRegisterTurns => ref.read(getAllReportsTurnsDi);


}

final reportsUseCasesProviders = Provider((ref) => ReportsUseCasesProviders(ref: ref));