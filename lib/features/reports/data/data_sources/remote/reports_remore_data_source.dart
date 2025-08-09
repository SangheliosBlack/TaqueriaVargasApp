import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/reports/data/dtos/get_all_register_turns_request_dto.dart';
import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_dto.dart';

abstract interface class ReportRemoteDataSource {
  
  Future<Either<String, List<PosStationDto>>> getAllTurns({required GetAllRegisterTurnsRequestDto request});
  
}