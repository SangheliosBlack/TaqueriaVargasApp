import 'package:taqueria_vargas/features/customers/data/dtos/dtos.dart';

class FetchAllCustomersResponseDto {

  final List<CustomerDto> products;

  FetchAllCustomersResponseDto({required this.products});

  factory FetchAllCustomersResponseDto.fromJson(List<dynamic> jsonList) {

    return FetchAllCustomersResponseDto(
      products: jsonList.map((json) => CustomerDto.fromJson(json)).toList(),
    );

  }

  
}