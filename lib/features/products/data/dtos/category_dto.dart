import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';

class CategoryDto {
    int id;
    String name;
    dynamic imgUrl;
    List<ProductDto> products;

    CategoryDto({
        required this.id,
        required this.name,
        required this.imgUrl,
        required this.products,
    });

    factory CategoryDto.fromJson(Map<String, dynamic> json) => CategoryDto(
        id: json["id"],
        name: json["name"],
        imgUrl: json["img_url"],
        products: List<ProductDto>.from(json["products"].map((x) => ProductDto.fromJson(x))),
    );
   
}

