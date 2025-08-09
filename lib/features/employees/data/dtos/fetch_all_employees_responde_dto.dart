import 'package:taqueria_vargas/features/employees/data/dtos/dtos.dart';

class FetchAllEmployeesResponseDto {

  final List<EmployeeDto> products;

  FetchAllEmployeesResponseDto({required this.products});

  factory FetchAllEmployeesResponseDto.fromJson(List<dynamic> jsonList) {

    return FetchAllEmployeesResponseDto(
      products: jsonList.map((json) => EmployeeDto.fromJson(json)).toList(),
    );

  }

  
}