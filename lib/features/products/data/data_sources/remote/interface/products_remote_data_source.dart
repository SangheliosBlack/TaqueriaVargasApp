import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';

abstract interface class ProductsRemoteDataSource {

  Future<DataState<GetAllProductsResponseDto>> fetchAllProducts();

}