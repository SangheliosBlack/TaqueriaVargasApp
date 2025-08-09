import 'package:taqueria_vargas/features/products/domain/entities/entities.dart';

class CategoryEntity {
  int id;
  String name;
  dynamic imgUrl;
  List<ProductEntity> products;
  bool isSelected = false;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.products,
    required this.isSelected,
  });

  CategoryEntity copyWith({
    int? id,
    String? name,
    dynamic imgUrl,
    List<ProductEntity>? products,
    bool? isSelected,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      products: products ?? this.products,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}