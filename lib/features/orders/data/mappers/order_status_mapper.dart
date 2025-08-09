
import 'package:taqueria_vargas/features/orders/data/dtos/order_status_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/domain.dart';

class OrderStatusMapper {
  
  static OrderStatusEntity toEntity({required OrderStatusDto dto}) {

    return OrderStatusEntity(
      id: dto.id,
      code: dto.code,
      value: dto.value,
      description: dto.description,
    );

  }

}
