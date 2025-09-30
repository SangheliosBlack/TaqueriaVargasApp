import 'package:taqueria_vargas/features/orders/data/dtos/customer_order_dto.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/customer_order_entity.dart';

class CustomerOrderMapper {

  static CustomerOrderEntity? fromDto({required CustomerOrderDto? dto}) {

    if (dto == null) return null;

    return CustomerOrderEntity(
      id: dto.id,
      fullName: dto.fullName,
      phone: dto.phone,
      address: dto.address,
      references: dto.references,
    );
  }

}