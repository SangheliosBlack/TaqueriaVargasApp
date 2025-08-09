import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/pos_printer/interface/pos_printer_service.dart';
import 'package:taqueria_vargas/core/services/pos_printer/layouts/layout_1.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';

class PosPrinterServideImpl implements PosPrinterService {

  final String printerIp;
  final int printerPort;
  final Ref ref;

  PosPrinterServideImpl({
    this.printerPort = 9100,
    required this.printerIp,
    required this.ref
    
  });
  
  @override
  Future<bool> isConnected() async {
   
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(PaperSize.mm80, profile);

    final PosPrintResult res = await printer.connect(printerIp, port: printerPort);

    if (res == PosPrintResult.success) {

      printer.disconnect();
      return true;

    } else {

      return false;

    }

  }
  
  @override
  Future<void> printReceipt({required String orderId}) async { 

    final profile = await CapabilityProfile.load();

    final printer = NetworkPrinter(PaperSize.mm80, profile);

    final PosPrintResult res = await printer.connect(printerIp, port: printerPort);

    if (res == PosPrintResult.success) {

      await EscPosPrinterLayout1.createTicket(printer: printer, ref: ref, orderId: orderId);

    } else {
      throw Exception('Error al conectar con la impresora: ${res.msg}');
    }

    return;

  }




}