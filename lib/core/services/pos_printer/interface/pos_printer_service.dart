import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

abstract interface class PosPrinterService {
  
  Future<void> printReceipt({required OrderEntity order});

  Future<bool> isConnected();

}