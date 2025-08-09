import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/products/domain/domain.dart';

class FetchAllProductsUseCase {

  final ProductsRepository productsRepository;
  
  FetchAllProductsUseCase({required this.productsRepository });

  Future<DataState<List<CategoryEntity>>> execute(){

    return productsRepository.fetchAllProducts();

  }

}