import 'package:taqueria_vargas/features/products/domain/domain.dart';

class ProductsState {

  final List<CategoryEntity> products;
  final bool isLoading;

  const ProductsState({
    this.products = const [],
    this.isLoading = true,
  });

  ProductsState copyWith({
    List<CategoryEntity>? products,
    bool? isLoading,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  List<ProductEntity> getAllProducts() {

    if (products.isEmpty) {
      return [];
    }
    

    final selectedCategory = products.firstWhere((category) => category.isSelected);

    if(selectedCategory.id == 0) {

      return products.expand((category) => category.products).toList();

    }

    return selectedCategory.products;

  }
  
}