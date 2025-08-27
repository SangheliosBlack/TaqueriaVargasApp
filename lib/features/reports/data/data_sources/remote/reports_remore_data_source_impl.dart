import 'package:dartz/dartz.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/data/dtos/fetch_all_orders_dto.dart';
import 'package:taqueria_vargas/features/reports/data/data_sources/remote/reports_remore_data_source.dart';
import 'package:taqueria_vargas/features/reports/data/dtos/get_all_register_turns_request_dto.dart';
import 'package:taqueria_vargas/features/reports/data/dtos/pos_station_dto.dart';

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {

  final HttpClientService httpClientService;

  ReportRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<Either<String, List<PosStationDto>>> getAllTurns({required GetAllRegisterTurnsRequestDto request}) async {

    try {

      final response = await httpClientService.post(path: '/shift-day/list',data: request.toJson());

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final turns = PosStationDto.fromJsonList(apiResponse.data!);

        return Right(turns);

      } else{

        return Left(response.data['message'] ?? 'No turns found');

      }

    } catch (e) {

      return Left(e.toString());
      
    }

  }

  @override
  Future<Either<String, FetchAllOrdersResponseDto>> getAllOrders() async {

    try {

      final response = await httpClientService.get(path: '/sale/currents');

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final orders = FetchAllOrdersResponseDto.fromJson(data: apiResponse.data!, meta: apiResponse.meta!);

        return Right(orders);

      } else{

        return Left(response.data['message'] ?? 'No turns found');

      }

    } catch (e) {

      return Left(e.toString());
      
    }

  }

} 