
import 'package:taqueria_vargas/features/customers/domain/entities/entities.dart';

class CustomersState {

  final Map<String, CustomerEntity> customerList;
  final bool isLoading;

  CustomersState({
    this.customerList = const {},
    this.isLoading = true,
  });

  CustomersState copyWith({
    Map<String, CustomerEntity>? customerList,
    bool? isLoading
  }) {
    return CustomersState(
      customerList: customerList ?? this.customerList,
      isLoading : isLoading ?? this.isLoading
    );
  }

}