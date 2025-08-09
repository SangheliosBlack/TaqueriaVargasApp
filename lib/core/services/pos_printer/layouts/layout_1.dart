// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/services.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:image/image.dart';

class EscPosPrinterLayout1{

  static Future<void> createTicket({required NetworkPrinter printer,required Ref ref,required String orderId}) async{

    final orderCartState = ref.read(orderCartProvider);
    final amount = ref.read(enterAmountProvider);
    final clientState = ref.read(orderCartProvider);

    final ByteData data = await rootBundle.load('assets/images/printer_logo.png');
    final Uint8List bytes = data.buffer.asUint8List();
    final Image? image = decodeImage(bytes);
    printer.image(image!,align: PosAlign.center);

    printer.text('20 de Noviembre, 209 Unidad Habitacional', styles: PosStyles(align: PosAlign.center));
    printer.text('San Pedro, 66215, Monterrey, NL', styles: PosStyles(align: PosAlign.center));
    printer.text('Tel: 813 428 7699', styles: PosStyles(align: PosAlign.center));

    printer.hr();

    printer.row([
      PosColumn(text: '', width: 1),
      PosColumn(text: 'Producto', width: 7),
      PosColumn(
          text: 'Precio', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: 'Total', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);


    for (var i = 0; i < orderCartState.productList.length; i++) {

      final product = orderCartState.productList.values.elementAt(i);

      printer.row([
        PosColumn(text: product.quantity.toString(), width: 1),
        PosColumn(text: product.name, width: 7),
        PosColumn(
            text: product.pricePf.toStringAsFixed(2), width: 2, styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: (product.pricePf * product.quantity).toStringAsFixed(2), width: 2, styles: PosStyles(align: PosAlign.right)),
      ]);

      if(product.parciality > 0){

        printer.row([
          PosColumn(text: product.quantity.toString(), width: 3),
          PosColumn(text: "Unidad", width: 5),
          PosColumn(text: ((product.pricePf / 5)  *  product.parciality).toStringAsFixed(2), width: 2, styles: PosStyles(align: PosAlign.right)),
          PosColumn(text: (product.pricePf * product.quantity).toStringAsFixed(2), width: 2, styles: PosStyles(align: PosAlign.right)),
        ]);
        
      }

      
    }

    if(orderCartState.deliveryAdded){

      printer.row([
        PosColumn(text: "1", width: 1),
        PosColumn(text: "Envio", width: 7),
        PosColumn(text: "30.00", width: 2, styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: "30.00", width: 2, styles: PosStyles(align: PosAlign.right)),
      ]);

    }
    
    printer.hr();

    printer.row([
      PosColumn(
          text: 'TOTAL',
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
      PosColumn(
          text: '\$${ref.read(orderCartProvider).calculateTotalAmount()}',
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
    ]);

    printer.hr(ch: '=', linesAfter: 1);

    if(amount != 0){

      printer.row([
      PosColumn(
          text: 'Efectivo',
          width: 8,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '\$ $amount',
          width: 4,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);
    printer.row([
      PosColumn(
          text: 'Su cambio',
          width: 8,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '\$ ${amount - ref.read(orderCartProvider).calculateTotalAmount()}',
          width: 4,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);

    }

    printer.hr(ch: ' ', linesAfter: 1);

    printer.row([
        PosColumn(text: "$orderId                    ", width: 5,styles: PosStyles(align: PosAlign.left,reverse: true, height: PosTextSize.size3,width: PosTextSize.size3)),
        PosColumn(text: clientState.clientSelected != null ? "${clientState.clientSelected!.fullName.split(" ")[0]}                                 " :"                                      ", width: 7, styles: PosStyles(align: PosAlign.right,reverse: true, height: PosTextSize.size3,width: PosTextSize.size3)),
    ]);
    


    if (clientState.clientSelected != null) {

      printer.hr(ch: ' ', linesAfter: 0);

      printer.row([
        PosColumn(
          text: 'Domicilio:',
          width: 3,
          styles: PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: clientState.clientSelected!.address,
          width: 9,
          styles: PosStyles(align: PosAlign.left),
        ),
      ]);

      printer.row([
        PosColumn(
          text: 'Referencia:',
          width: 3,
          styles: PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: clientState.clientSelected!.references,
          width: 9,
          styles: PosStyles(align: PosAlign.left),
        ),
      ]);

      printer.row([
        PosColumn(
          text: 'Teléfono:',
          width: 3,
          styles: PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: clientState.clientSelected!.phone,
          width: 9,
          styles: PosStyles(align: PosAlign.left),
        ),
      ]);

    }

    printer.hr(ch: ' ', linesAfter: 0);

    printer.qrcode(
      orderId,
      size: QRSize.Size8
    );

    printer.text('¡Gracias por su compra!',styles: PosStyles(align: PosAlign.center));

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timestamp = formatter.format(now);
    printer.text(timestamp,styles: PosStyles(align: PosAlign.center), linesAfter: 2);

    //printer.feed(2);
    printer.beep(n: 1,duration: PosBeepDuration.beep100ms);
    printer.cut();
    printer.disconnect();

  }

}