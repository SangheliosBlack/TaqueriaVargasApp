import 'package:taqueria_vargas/features/products/application/use_cases/fetch_all_products/fetch_all_products.dart';
import 'package:taqueria_vargas/features/products/domain/repositories/products_repository_di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final fetchAllProductsUseCase = Provider<FetchAllProductsUseCase>((ref){
  
  final productsRepository = ref.read(productRepositoryDi);

  return FetchAllProductsUseCase(productsRepository: productsRepository);

});