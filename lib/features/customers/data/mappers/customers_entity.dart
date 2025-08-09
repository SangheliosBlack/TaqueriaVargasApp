import 'package:taqueria_vargas/features/customers/data/dtos/customer_dto.dart';
import 'package:taqueria_vargas/features/customers/domain/entities/customer_entity.dart';

class CustomerMapper {

  static CustomerEntity fromDto({required CustomerDto dto}) {
    return CustomerEntity(
      id: dto.id,
      fullName: dto.fullName,
      phone: dto.phone,
      address: dto.address,
      references: dto.references, 
      createdAt: dto.createdAt, 
    );
  }

  static Map<String, CustomerEntity> fromDtoList({required List<CustomerDto> dtoList}) {
    return {
      for (var dto in dtoList) dto.id.toString(): fromDto(dto:dto)
    };
  }

}
