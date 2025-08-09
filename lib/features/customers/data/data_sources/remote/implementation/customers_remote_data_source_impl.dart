import 'package:dio/dio.dart';
import 'package:taqueria_vargas/features/customers/data/data_sources/remote/interface/customers_remote_data_source.dart';
import 'package:taqueria_vargas/features/customers/data/dtos/dtos.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/customers/domain/entities/create_customer_request_dto.dart';

class CustomersRemoteDataSourceImpl implements CustomersRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  CustomersRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<FetchAllCustomersResponseDto>> fetchAllCustomers() async {

    try {

      final response = await httpClientService.get(path: '/customers');

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final productsResponseDTO = FetchAllCustomersResponseDto.fromJson(apiResponse.data!);

        return DataSuccess(productsResponseDTO);

      } else {

        return DataFailed(DioException(
          message:"The server returned an error: ${response.statusMessage ?? 'Unknown error'}",
          requestOptions: RequestOptions(
            path: '/customers',
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
          path: '/customers',
        ),
      ));
      
    }

  }
  
  @override
  Future<DataState<CustomerDto>> createCustomer({required CreateCustomerRequestDto request}) async {
    
    try {

      final response = await httpClientService.post(path: '/customers/create',data: request.toJson());

      if (response.statusCode == 201) {

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final productsResponseDTO = CustomerDto.fromJson(apiResponse.data!);

        return DataSuccess(productsResponseDTO);

      } else {

        return DataFailed(DioException(
          message:"The server returned an error: ${response.statusMessage ?? 'Unknown error'}",
          requestOptions: RequestOptions(
            path: '/customers/create',
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
          path: '/customers/create',
        ),
      ));
      
    }

  }
}
