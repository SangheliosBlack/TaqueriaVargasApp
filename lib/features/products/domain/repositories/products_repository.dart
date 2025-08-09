import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/products/domain/entities/entities.dart';

abstract interface class ProductsRepository {

  Future<DataState<List<CategoryEntity>>> fetchAllProducts();

}
