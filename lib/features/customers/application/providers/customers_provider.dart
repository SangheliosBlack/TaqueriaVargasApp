import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

import 'package:taqueria_vargas/features/customers/application/application.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';
import 'package:taqueria_vargas/features/point_of_sale/point_of_sale.dart';
import 'package:taqueria_vargas/core/core.dart';

part 'customers_provider.g.dart';

@Riverpod(keepAlive: true)
class Customers extends _$Customers {

  @override
  CustomersState build() {

    fetchAllCustomers();

    return CustomersState();
  }

  CustomersUseCases get useCases => ref.read(useCasesCustomers);

  Future<void> fetchAllCustomers() async {

    final response = await useCases.fetchAllCustomers.execute();

    if(response is DataSuccess){

      state = state.copyWith(
        isLoading: false,
        customerList: response.data
      );

    }

  }

CustomerEntity? getClientByPhone({required String phone}) {

  final CustomerEntity? client = state.customerList.values.firstWhereOrNull(
    (client) => client.phone.replaceAll(" ", "").trim() == phone,
  );

  if(client != null) {

    ref.read(orderCartProvider.notifier).setClient(client: client);

    return client;

  } else {

    ref.read(orderCartProvider.notifier).removeClient();

    return null;

  }

}

CustomerEntity? getClientById({required String id}) {

  final CustomerEntity? client = state.customerList[id];

  if(client != null) {

    ref.read(orderCartProvider.notifier).setClient(client: client);

    return client;

  } else {

    ref.read(orderCartProvider.notifier).removeClient();

    return null;

  }

}

  void addClient({bool addInmediately = false}) async {

    final clientFormState = ref.read(clientFormProvider);

    final requestDto = CreateCustomerRequestDto(
      fullName: clientFormState.name, 
      phone: clientFormState.phone.replaceAll(" ", "").trim(), 
      address: clientFormState.address, 
      references: clientFormState.reference
    );

    final response = await useCases.createCustomer.execute(requestDto: requestDto);

     if(response is DataSuccess){

      if(addInmediately) {

        ref.read(orderCartProvider.notifier).setClient(client: response.data!);

      }

      final updatedMap = Map<String, CustomerEntity>.from(state.customerList);

      updatedMap[response.data!.id.toString()] = response.data!;

      state = state.copyWith(customerList: updatedMap);

    }

  }

  void removeClient({required CustomerEntity client}) {

    final updatedMap = Map<String, CustomerEntity>.from(state.customerList);

    updatedMap.remove(client.id.toString());

    state = state.copyWith(customerList: updatedMap);

  }

  void updateClient({required CustomerEntity client}) {

    final updatedMap = Map<String, CustomerEntity>.from(state.customerList);

    updatedMap[client.id.toString()] = client;

    state = state.copyWith(customerList: updatedMap);

  }
}