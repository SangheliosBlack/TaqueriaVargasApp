import 'package:dio/dio.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/data/data_sources/remote/interface/interface.dart';
import 'package:taqueria_vargas/features/orders/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/create_order_request_entity.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {

  final HttpClientService httpClientService;

  OrdersRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<FetchAllOrdersResponseDto>> fetchAllOrders() async {

    try {

      final response = await httpClientService.get(path: '/sale/currents');

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final productsResponseDTO = FetchAllOrdersResponseDto.fromJson(data: apiResponse.data!, meta: apiResponse.meta!);

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
  Future<DataState<OrderDto>> createOrder({required CreateOrderRequestEntity request}) async {
    
    try {

      final response = await httpClientService.post(path: '/sale/open',data: request.toJson());

      if (response.statusCode == 201) {

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final productsResponseDTO = OrderDto.fromJson(apiResponse.data!);

        return DataSuccess(productsResponseDTO);

      } else if(response.statusCode == 404){

        return DataFailed(
          
          DioException(
          message: response.data['message'] ?? 'Not Found',
          requestOptions: RequestOptions()
          )
        );

      } else {

        return DataFailed(DioException(
          message:"The server returned an error: ${response.statusMessage ?? 'Unknown error'}",
          requestOptions: RequestOptions(
            path: '/customers/create',
          ),
        ));

      }

    } catch (e) {

      return DataFailed(DioException(
        message: e.toString(),
        requestOptions: RequestOptions(
          path: '/customers/create',
        ),
      ));
      
    }

  }
  
  @override
  Future<DataState<ProductDetailOrderDto>> getDetailOrder({required int orderId}) async {
    
    try {

      final response = await httpClientService.post(path: '/customers/create',data: {"orderId": orderId});

      if (response.statusCode == 201) {

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final productsResponseDTO = ProductDetailOrderDto.fromJson(apiResponse.data!);

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
