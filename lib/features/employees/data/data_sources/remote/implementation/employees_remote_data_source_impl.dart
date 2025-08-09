import 'package:dio/dio.dart';

import 'package:taqueria_vargas/features/employees/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/employees/data/dtos/dtos.dart';

class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  EmployeesRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<FetchAllEmployeesResponseDto>> fetchAllEmployees() async {

    try {

      final response = await httpClientService.get(path: '/employee');

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final productsResponseDTO = FetchAllEmployeesResponseDto.fromJson(apiResponse.data!);

        return DataSuccess(productsResponseDTO);

      } else {

        return DataFailed(DioException(
          message:"The server returned an error: ${response.statusMessage ?? 'Unknown error'}",
          requestOptions: RequestOptions(
            path: '/employee',
          ),
        ));

      }

    } on DioException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: e.requestOptions,
      ));

    } catch (e) {

      return DataFailed(DioException(
        message: "An unexpected error occurred: ${e.toString()}",
        requestOptions: RequestOptions(
          path: '/employee',
        ),
      ));
      
    }

  }
  
}
