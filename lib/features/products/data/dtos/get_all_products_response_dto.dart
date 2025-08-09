import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';

class GetAllProductsResponseDto {

  final List<CategoryDto> products;

  GetAllProductsResponseDto({required this.products});

  factory GetAllProductsResponseDto.fromJson(List<dynamic> jsonList) {
    return GetAllProductsResponseDto(
      products: jsonList.map((json) => CategoryDto.fromJson(json)).toList(),
    );
  }
  
}