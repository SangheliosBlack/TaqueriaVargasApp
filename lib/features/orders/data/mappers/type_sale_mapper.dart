import 'package:taqueria_vargas/features/orders/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class TypeSaleMapper {

  static OrderTypeSaleEntity toEntity({required OrderTypeSaleDto dto}){

    return OrderTypeSaleEntity(
      id: dto.id,
      description: dto.description,
      code: dto.code, 
      value: dto.value,
    );


  }

}