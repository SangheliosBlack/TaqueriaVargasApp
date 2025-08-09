import 'package:taqueria_vargas/features/employees/data/dtos/employee_dto.dart';
import 'package:taqueria_vargas/features/employees/domain/domain.dart';

class EmployeesMapper {

  static EmployeeEntity fromDto({required EmployeeDto dto}) {
    return EmployeeEntity(
      id: dto.id,
      fullName: dto.fullName,
      phone: dto.phone,
      userId: dto.userId, 
      companyBranchId: dto.companyBranchId, 
    );
  }

  static Map<String, EmployeeEntity> fromDtoList({required List<EmployeeDto> dtoList}) {
    return {
      for (var dto in dtoList) dto.id.toString(): fromDto(dto:dto)
    };
  }

}
