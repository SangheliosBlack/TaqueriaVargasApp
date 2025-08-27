import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/fetch_all_orders_response_entity.dart';
import 'package:taqueria_vargas/features/reports/data/data_sources/remote/reports_remore_data_source.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/fetch_all_orders_mapper.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/get_all_turn_request_mapper.dart';
import 'package:taqueria_vargas/features/reports/data/mappers/pos_station_mapper.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportsRepository {

  final ReportRemoteDataSource remoteDataSource;

  ReportRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<PosStationEntity>>> getAllTurns({required GetAllRegisterTurnsRequestEntity request}) async {

    final requestDto = GetAllTurnRequestMapper.toDto(request: request);

    final response = await remoteDataSource.getAllTurns(request: requestDto);

    return response.fold(
      (error) => Left(error),
      (turns) => Right(PosStationMapper.fromDtoList(turns)),
    );

  }

  @override
  Future<Either<String, FetchAllOrdersResponseEntity>> getAllOrders() async {

     final response = await remoteDataSource.getAllOrders();

    return response.fold(
      (error) => Left(error),
      (orders) => Right(FetchAllOrdersMapper.toEntity(dto: orders)),
    );


  }

}