import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/products/domain/entities/entities.dart';

class ProductMapper {
  static ProductEntity fromDto(ProductDto dto) {
    return ProductEntity(
      id: dto.id,
      name: dto.name, 
      sku: dto.sku, 
      pricePf: dto.pricePf, 
      description: dto.description, 
      hasParciality: dto.hasParciality, 
      imgUrl: dto.imgUrl,
    );
  }
}