import 'package:dio/dio.dart';

import 'package:taqueria_vargas/features/products/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';
import 'package:taqueria_vargas/core/core.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {

  final HttpClientService httpClientService;

  ProductsRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<GetAllProductsResponseDto>> fetchAllProducts() async {

    try {

      final response = await httpClientService.get(path: '/categories/products');

      if (response.statusCode == 200) {

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);

        final productsResponseDTO = GetAllProductsResponseDto.fromJson(apiResponse.data!);

        return DataSuccess(productsResponseDTO);

      } else {

        return DataFailed(DioException(
          message:"The server returned an error: ${response.statusMessage ?? 'Unknown error'}",
          requestOptions: RequestOptions(
            path: '/releases',
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
          path: '/releases',
        ),
      ));
      
    }
  }
}
