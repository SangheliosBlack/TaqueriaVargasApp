import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:taqueria_vargas/features/products/application/application.dart';
import 'package:taqueria_vargas/features/products/domain/domain.dart';
import 'package:taqueria_vargas/core/resources/resources.dart';

part 'product_provider.g.dart';

@Riverpod(keepAlive: true)
class Products extends _$Products {

  @override 
  ProductsState build() => ProductsState();

  ProductsUseCases get useCases => ref.read(useCasesProducts);

  Future<void> fetchAllProducts() async {

    await Future.delayed(const Duration(seconds: 2));

    final response = await useCases.fetchAllProducts.execute();

    if(response is DataSuccess){

      state = state.copyWith(
        products: response.data,
        isLoading: false,
      );

    }

  }

  void toggleCategorySelection(CategoryEntity category) {

    final updatedCategories = state.products.map((existingCategory) {

      if (existingCategory.id == category.id) {

        existingCategory.isSelected = true;

      }else{
        
        existingCategory.isSelected = false;

      }

      return existingCategory;

    }).toList();

    state = state.copyWith(products: updatedCategories);
  }

}