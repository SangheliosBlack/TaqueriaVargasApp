
import 'package:taqueria_vargas/features/orders/data/dtos/order_detail_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class OrderDetailMapper {
  
  static ProductDetailOrderEntity toEntity({required ProductDetailOrderDto dto}) {
  return ProductDetailOrderEntity(
    id: dto.id,
    price: dto.price, 
    productId: dto.productId, 
    amount: dto.amount, 
    total: dto.total, 
    description: dto.description, 
    unitQuantity: dto.unitQuantity,
  );
  }

  static List<ProductDetailOrderEntity> toEntityList({required List<ProductDetailOrderDto> dtos}) {
  return dtos.map((dto) => toEntity(dto: dto)).toList();
  }
}
