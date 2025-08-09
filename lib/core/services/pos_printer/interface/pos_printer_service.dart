abstract interface class PosPrinterService {
  
  Future<void> printReceipt({required String orderId});

  Future<bool> isConnected();

}