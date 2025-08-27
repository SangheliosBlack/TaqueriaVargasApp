import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/fetch_all_orders_response_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/get_all_register_turns_request_entity.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';

abstract interface class ReportsRepository {

  Future<Either<String, List<PosStationEntity>>> getAllTurns({required GetAllRegisterTurnsRequestEntity request});
  Future<Either<String, FetchAllOrdersResponseEntity>> getAllOrders();
  
}