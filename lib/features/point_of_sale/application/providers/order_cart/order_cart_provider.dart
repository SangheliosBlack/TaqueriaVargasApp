
import 'package:taqueria_vargas/features/customers/domain/entities/customer_entity.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_state.dart';
import 'package:taqueria_vargas/features/products/domain/entities/product_entity.dart';
import 'package:nullable_absent/nullable_absent.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_cart_provider.g.dart';

@Riverpod(keepAlive: true)
class OrderCart extends _$OrderCart {

  @override
  OrderCartState build(){

    return OrderCartState();

  }

    void setClient({required CustomerEntity client}) {

      state = state.copyWith(clientSelected: NullableAbsent(client));


    }

    void removeClient() {

      state = state.copyWith(clientSelected: NullableAbsent(null));

    }

  void addProduct({required ProductEntity product}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);
    updatedMap[product.id] = product; 
    state = state.copyWith(productList: updatedMap);

  }

  void removeProduct({required ProductEntity product}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);
    updatedMap.remove(product.id); 
    state = state.copyWith(productList: updatedMap);

  }

  void updateProductQuantity({required ProductEntity product}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);

    updatedMap[product.id] = product;
    
    state = state.copyWith(productList: updatedMap);
    
  }

  void cleanOrder(){

    state = state.copyWith(
      productList: {}
    );

  }

  void setSaleType({required int saleTypeId}) {

    state = state.copyWith(
      selectedSaleTypeId: saleTypeId
    );

  }

}