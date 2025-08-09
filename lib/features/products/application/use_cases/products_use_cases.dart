import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/products/application/use_cases/fetch_all_products/fetch_all_products_use_case.dart';
import 'package:taqueria_vargas/features/products/application/use_cases/fetch_all_products/fetch_all_products_use_case_di.dart';

class ProductsUseCases {

  final Ref ref;

  ProductsUseCases({required this.ref});

  FetchAllProductsUseCase get fetchAllProducts => ref.read(fetchAllProductsUseCase);

}

final useCasesProducts = Provider((ref) => ProductsUseCases(ref: ref) );