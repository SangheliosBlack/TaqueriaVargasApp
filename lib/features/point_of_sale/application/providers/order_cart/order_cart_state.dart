import 'package:taqueria_vargas/features/customers/domain/entities/customer_entity.dart';
import 'package:taqueria_vargas/features/products/domain/entities/entities.dart';
import 'package:nullable_absent/nullable_absent.dart';

class OrderCartState {
  
  final Map<int, ProductEntity> productList;
  final CustomerEntity? clientSelected;
  final int selectedSaleTypeId;

  OrderCartState({
    this.productList = const {},
    this.selectedSaleTypeId = 0,
    this.clientSelected 
  });

  bool get deliveryAdded => selectedSaleTypeId == 7;

  OrderCartState addProduct(ProductEntity product) {
    final updatedMap = Map<int, ProductEntity>.from(productList);
    updatedMap[product.id] = product;
    return copyWith(productList: updatedMap);
  }

  OrderCartState removeProduct(int productId) {
    final updatedMap = Map<int, ProductEntity>.from(productList);
    updatedMap.remove(productId);
    return copyWith(productList: updatedMap);
  }

  bool isProductInCart(int productId) {
    return productList.containsKey(productId);
  }

  int getProductQuantity(int productId) {
    return productList[productId]?.quantity ?? 0;
  }

  double calculateTotalAmount() {

    return (deliveryAdded ? 30 : 0) +  productList.values.fold(
      0.0,
      (sum, product) => sum + (product.pricePf * product.quantity + ((product.pricePf / 5) * product.parciality)),
    );

  }

  List<ProductOrderEntity> get productListToOrder {

    final list = productList.values.toList();

    return list.map((p) => ProductOrderEntity(
      id: p.id,
      complements: p.parciality,
      quantity: p.quantity
    )).toList();

  }


  OrderCartState copyWith({
    Map<int, ProductEntity>? productList,
    NullableAbsent<CustomerEntity> clientSelected = const NullableAbsent.absent(),
    int? selectedSaleTypeId
  }) {
    return OrderCartState(
      productList: productList ?? this.productList,
      clientSelected: NullableAbsent(this.clientSelected).apply(clientSelected),
      selectedSaleTypeId: selectedSaleTypeId ?? this.selectedSaleTypeId,
    );
  } 

}


