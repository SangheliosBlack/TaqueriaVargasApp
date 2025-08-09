import 'package:taqueria_vargas/features/products/domain/entities/entities.dart';
import 'package:taqueria_vargas/features/products/data/mappers/mappers.dart';
import 'package:taqueria_vargas/features/products/data/dtos/dtos.dart';

class CategoryMapper {

  static CategoryEntity fromDto(CategoryDto dto) {

    return CategoryEntity(
      id: dto.id,
      name: dto.name,
      imgUrl: dto.imgUrl?.toString(),
      products: dto.products.map(ProductMapper.fromDto).toList(), 
      isSelected: dto.id == 0 ? true : false,
    );

  }

  static List<CategoryEntity> fromDtoList({required List<CategoryDto> dtoList}) {

    dtoList.insert(0, CategoryDto(id: 0, name: 'Todas', imgUrl: "https://sangheliosblobstorage.blob.core.windows.net/sangheliosblobstoragedev/all.png" , products: []));

    return dtoList.map(fromDto).toList();

  }
}
