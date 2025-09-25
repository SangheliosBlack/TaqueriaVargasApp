import 'package:taqueria_vargas/core/resources/data_state.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_state.dart';
import 'package:taqueria_vargas/features/orders/application/use_cases/orders_use_cases.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/create_order_request_entity.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/sales_state.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_provider.g.dart';

@Riverpod(keepAlive: true)

class Orders extends _$Orders{

  @override
  OrdersState build() => OrdersState();

  OrdersUseCases get useCases => ref.read(useCasesOrders);
  AuthState get userState => ref.read(authProvider);
  OrderCartState get orderCartState => ref.read(orderCartProvider);

  Future<void> fetchAllOrders() async {

    await Future.delayed(const Duration(milliseconds: 500));

    final response = await useCases.fetchAllOrders.execute();

    if(response is DataSuccess){

      state = state.copyWith(
        orderList: response.data,
      );

    }

    state = state.copyWith(isLoading: false);

  }

    Future<void> refresFetchAllOrders() async {

    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(milliseconds: 500));

    final response = await useCases.fetchAllOrders.execute();

    if(response is DataSuccess){

      state = state.copyWith(
        orderList: response.data,
      );

    }

    state = state.copyWith(isLoading: false);

  }
  
  Future<({OrderEntity? order, String error})> searchOrderById({required String id}) async {

    final parsedId = int.tryParse(id);

      if (parsedId == null) return (order: null, error: 'El código escaneado no es un número válido.');

      final order = state.orderList[parsedId];

      if (order != null) return (order: order, error: '');

      return (order: null, error: 'No se encontró ninguna orden registrada con ese código.');

  }


  Future<OrderEntity?> createOrder() async{

    state = state.copyWith(isLoading: true, errorMessage: '');

    await Future.delayed(const Duration(seconds: 1));

    final requestDto = CreateOrderRequestEntity(
      posStationId: userState.user!.posInfo!.id, 
      typeSaleId: orderCartState.selectedSaleTypeId != 0 ? orderCartState.selectedSaleTypeId : userState.user!.roles.first.saleTypes.first.id, 
      products: orderCartState.productListToOrder, 
      customerId: orderCartState.clientSelected?.id, 
      note: orderCartState.note
    );

    final response = await useCases.createOrder(request: requestDto);

    if(response is DataSuccess){

      final updateMap = <int, OrderEntity>{};
      
      updateMap[response.data!.id] = response.data!;
      
      updateMap.addAll(state.orderList); 

      state = state.copyWith(orderList: updateMap,isLoading: false);

      return response.data;

    }else{

      state = state.copyWith(
        errorMessage: response.error!.message,
        isLoading: false
      );

      return null;

    }


  }

}