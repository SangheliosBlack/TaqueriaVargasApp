import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taqueria_vargas/core/services/http_client/http_client_service_impl.dart';
import 'package:taqueria_vargas/features/point_of_sale/data/data_sources/remote/point_of_sale_remote_data_source.dart';

class PointOfSaleRemoteDataSourceImpl implements PointOfSaleRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  PointOfSaleRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<Either<String, bool>> openTurn() async {

    try {

      final response = await httpClientService.post(path: '/shift-day/open');

      if (response.statusCode == 200) {

        return Right(true);

      } else {

        return Left("The server returned an error: ${response.statusMessage ?? 'Unknown error'}");


      }

    } on DioException catch (e) {

      return Left(e.message ?? "An error occurred while opening the turn");


    } catch (e) {

      return Left("An unexpected error occurred: ${e.toString()}");
      
    }

  }
  @override
  Future<Either<String, bool>> closeTurn({required int turnId}) async {

    try {

      final response = await httpClientService.patch(path: '/shift-day/close', data: {
        "shift_day_id": turnId,
      });

      if (response.statusCode == 200) {

        return Right(true);

      } else {

        return Left("The server returned an error: ${response.statusMessage ?? 'Unknown error'}");

      }
      
    } on DioException catch (e) {
  if (e.response?.statusCode != null) {
    final data = e.response?.data;
    final mensaje = data is Map<String, dynamic> && data['message'] != null
        ? data['message'].toString()
        : (e.response?.statusMessage ?? 'Error desconocido');

    return Left("El servidor devolvió un error: $mensaje (Código: ${e.response?.statusCode})");
  }
  return Left(e.message ?? "Ocurrió un error al cerrar el turno");
} catch (e) {
  return Left("Para cerrar el turno es necesario cerrar todos los puntos de venta.");
}
  }
  
  @override
  Future<Either<String, bool>> closePo({required double amount}) async {
     
     try {

      final response = await httpClientService.patch(path: '/pos-station-shift/close', data: {
        "final_amount": amount,
      });

      if (response.statusCode == 201) {

        return Right(true);

      } else {

        return Left("The server returned an error: ${response.statusMessage ?? 'Unknown error'}");

      }
      
    } catch (e) {

      return Left("Para cerrar el turno es necesario cerrar todos los puntos de venta.");

    }
  }
  
  @override
  Future<Either<String, bool>> openPo({required double amount}) async {

    try {

      final response = await httpClientService.post(path: '/pos-station-shift/create', data: {
        "initial_amount": amount,
        "company_branch_id": null,
        "company": null
      });

      if (response.statusCode == 201) {

        return Right(true);

      } else {

        return Left("The server returned an error: ${response.statusMessage ?? 'Unknown error'}");

      }
      
    } catch (e) {

      return Left("Para cerrar el turno es necesario cerrar todos los puntos de venta.");

    }

  }

}