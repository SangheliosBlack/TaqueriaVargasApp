import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final productQuantityProvider = Provider.family<int, int>((ref, productId) {

  final productMap = ref.watch(orderCartProvider.select((state) => state.productList));

  final product = productMap[productId];

  return product?.quantity ?? 0;
  
});
