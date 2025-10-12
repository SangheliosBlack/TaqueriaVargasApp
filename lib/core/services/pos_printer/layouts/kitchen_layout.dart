// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/services.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:image/image.dart';

class EscPosPrinterKitchenLayout {

  static Future<void> createKitchenTicket({required NetworkPrinter printer, required Ref ref, required OrderEntity order}) async {

    final orderCartState = ref.read(orderCartProvider);

    printer.text('COCINA', styles: PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size2, bold: true));
    printer.hr();

    printer.row([
      PosColumn(text: "ORDEN #${order.shiftConsecutive}", width: 12, styles: PosStyles(align: PosAlign.center, reverse: true, height: PosTextSize.size3, width: PosTextSize.size3)),
    ]);

    printer.hr();

    printer.row([
      PosColumn(text: 'Cant', width: 2, styles: PosStyles(align: PosAlign.center, bold: true)),
      PosColumn(text: 'Producto', width: 10, styles: PosStyles(align: PosAlign.left, bold: true)),
    ]);

    printer.hr(ch: '-');

    for (var i = 0; i < orderCartState.productList.length; i++) {
      final product = orderCartState.productList.values.elementAt(i);

      printer.row([
        PosColumn(text: product.quantity.toString(), width: 2, styles: PosStyles(align: PosAlign.center)),
        PosColumn(text: product.name, width: 10),
      ]);

      if (product.parciality > 0) {
        printer.row([
          PosColumn(text: "", width: 2),
          PosColumn(text: "  + ${product.parciality} unidades extras", width: 10),
        ]);
      }
    }

    if (orderCartState.deliveryAdded) {
      printer.row([
        PosColumn(text: "1", width: 2, styles: PosStyles(align: PosAlign.center)),
        PosColumn(text: "DELIVERY", width: 10, styles: PosStyles(bold: true)),
      ]);
    }

    printer.hr();

    if (order.note.isNotEmpty) {
      printer.text('NOTAS ESPECIALES:', styles: PosStyles(bold: true, align: PosAlign.center));
      printer.text(order.note, styles: PosStyles(align: PosAlign.center));
      printer.hr(ch: '-');
    }

    final clientState = ref.read(orderCartProvider);
    if (clientState.clientSelected != null) {
      printer.text('Cliente: ${clientState.clientSelected!.fullName}', styles: PosStyles(align: PosAlign.center));
      printer.hr(ch: '-');
    }

    printer.qrcode(
      order.shiftConsecutive.toString(),
      size: QRSize.Size6
    );

    final now = DateTime.now();
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    final String timestamp = formatter.format(now);
    printer.text(timestamp, styles: PosStyles(align: PosAlign.center));

    //printer.feed(2);
    printer.beep(n: 2, duration: PosBeepDuration.beep100ms);
    printer.cut();
    printer.disconnect();
  }

}