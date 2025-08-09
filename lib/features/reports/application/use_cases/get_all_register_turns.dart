import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/repositories/report_repository.dart';

class GetAllRegisterTurns {

  final ReportsRepository repository;

  GetAllRegisterTurns({required this.repository});

  Future<Either<String, List<PosStationEntity>>> call({required GetAllRegisterTurnsRequestEntity request}) async {

    return repository.getAllTurns(request: request);
    
  }

}