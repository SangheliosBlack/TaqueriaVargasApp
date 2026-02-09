import 'package:taqueria_vargas/features/customers/domain/entities/customer_entity.dart';
import 'package:taqueria_vargas/features/orders/data/dtos/customer_order_dto.dart';

class CustomerOrderMapper {

  static CustomerEntity? fromDto({required CustomerOrderDto? dto}) {

    if (dto == null) return null;

    return CustomerEntity(
      id: dto.id,
      fullName: dto.fullName,
      phone: dto.phone,
      address: dto.address,
      references: dto.references,
      createdAt: dto.createdAt,
    );
  }

}