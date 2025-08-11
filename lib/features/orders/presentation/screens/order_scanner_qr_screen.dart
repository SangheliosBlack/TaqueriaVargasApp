import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/features/orders/application/providers/providers.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/order_detail_screen.dart';
import 'dart:math' as math;

import 'package:taqueria_vargas/features/orders/presentation/widgets/content/scanner_history_content.dart';

class QRScannerScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/order-scanner";
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Stack(
                children: [
                  MobileScanner(
                    fit: BoxFit.cover,
                    onDetect: (capture) async {

                      final String? code = capture.barcodes.first.rawValue;

                      if (code != null) {

                        final (:error, :order) = await ref.read(ordersProvider.notifier).searchOrderById(id: code);

                        if (error.isNotEmpty) {

                          MessageServiceImpl().showBottom(
                            context: context, 
                            title: "Error al escanear",
                            backgroundColor: AppTheme.error, 
                            message: error
                          );

                        } else {

                          context.push(OrderDetail.path,extra: order);

                        }

                        Navigator.pop(context, code);

                      }

                    },
                  ),
                  IgnorePointer(
                    child: CustomPaint(
                      size: MediaQuery.of(context).size,
                      painter: _LensStyleOverlayPainter(),
                    ),
                  ),
                  CustomPaint(
                    size: Size.infinite,
                    painter: LensStyleOverlayPainterMirror(),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 2 - 220,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Escanea una orden",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ScannerHistoryContent()
        ],
      ),
    );

  }

}

class _LensStyleOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final layer = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.saveLayer(layer, Paint());

    // Fondo oscuro
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.6);
    canvas.drawRect(layer, backgroundPaint);

    // Dimensiones del cuadro
    const double boxSize = 250;
    final double left = (size.width - boxSize) / 2;
    final double top = (size.height - boxSize) / 2;
    final RRect cutout = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, boxSize, boxSize),
      const Radius.circular(25),
    );

    // Recorte
    final cutoutPaint = Paint()..blendMode = BlendMode.clear;
    canvas.drawRRect(cutout, cutoutPaint);

    canvas.restore();

    // Estilo de esquinas
    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double cornerLength = 40;
    const double cornerRadius = 20;

void drawCorner(double x, double y, bool topSide, bool leftSide) {
  if (topSide && leftSide) {
    // Superior izquierda (original)
    canvas.drawLine(
      Offset(x + cornerRadius, y),
      Offset(x + cornerLength, y),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(x, y + cornerRadius),
      Offset(x, y + cornerLength),
      cornerPaint,
    );
    canvas.drawArc(
      Rect.fromLTWH(x, y, cornerRadius * 2, cornerRadius * 2),
      math.pi,
      math.pi / 2,
      false,
      cornerPaint,
    );
  } else if (topSide && !leftSide) {
    // Superior derecha (misma lógica invertida horizontalmente)
    canvas.drawLine(
      Offset(x - cornerRadius, y),
      Offset(x - cornerLength, y),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(x, y + cornerRadius),
      Offset(x, y + cornerLength),
      cornerPaint,
    );
    canvas.drawArc(
      Rect.fromLTWH(x - 2 * cornerRadius, y, cornerRadius * 2, cornerRadius * 2),
      0,
      math.pi / 2,
      false,
      cornerPaint,
    );
  } else if (!topSide && leftSide) {
    // Inferior izquierda (original)
    canvas.drawLine(
      Offset(x + cornerRadius, y),
      Offset(x + cornerLength, y),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(x, y - cornerRadius),
      Offset(x, y - cornerLength),
      cornerPaint,
    );
    canvas.drawArc(
      Rect.fromLTWH(x, y - 2 * cornerRadius, cornerRadius * 2, cornerRadius * 2),
      math.pi / 2,
      math.pi / 2,
      false,
      cornerPaint,
    );
  } else if (!topSide && !leftSide) {
    // Inferior derecha (misma lógica invertida horizontalmente)
    canvas.drawLine(
      Offset(x - cornerRadius, y),
      Offset(x - cornerLength, y),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(x, y - cornerRadius),
      Offset(x, y - cornerLength),
      cornerPaint,
    );
    canvas.drawArc(
      Rect.fromLTWH(x - 2 * cornerRadius, y - 2 * cornerRadius, cornerRadius * 2, cornerRadius * 2),
      3 * math.pi / 2,
      math.pi / 2,
      false,
      cornerPaint,
    );
  }
}



drawCorner(left, top, true, true); // sup izq
drawCorner(left, top + boxSize, false, true); // infizq 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class LensStyleOverlayPainterMirror extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Fondo oscuro
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.6);
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    const double boxSize = 250;
    final double left = (size.width - boxSize) / 2;
    final double top = (size.height - boxSize) / 2;

    // Recorte transparente
    final cutout = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, boxSize, boxSize),
      const Radius.circular(25),
    );
    final cutoutPaint = Paint()..blendMode = BlendMode.clear;

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRRect(cutout, cutoutPaint);
    canvas.restore();

    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double cornerLength = 40;
    const double cornerRadius = 20;

    void drawCornerLeft(double x, double y, bool topSide, bool leftSide) {
      // Esta función dibuja la esquina izquierda normal, que luego reflejamos para la derecha
      if (topSide && leftSide) {
        // superior izquierda
        canvas.drawLine(
          Offset(x + cornerRadius, y),
          Offset(x + cornerLength, y),
          cornerPaint,
        );
        canvas.drawLine(
          Offset(x, y + cornerRadius),
          Offset(x, y + cornerLength),
          cornerPaint,
        );
        canvas.drawArc(
          Rect.fromLTWH(x, y, cornerRadius * 2, cornerRadius * 2),
          math.pi,
          math.pi / 2,
          false,
          cornerPaint,
        );
      } else if (!topSide && leftSide) {
        // inferior izquierda
        canvas.drawLine(
          Offset(x + cornerRadius, y),
          Offset(x + cornerLength, y),
          cornerPaint,
        );
        canvas.drawLine(
          Offset(x, y - cornerRadius),
          Offset(x, y - cornerLength),
          cornerPaint,
        );
        canvas.drawArc(
          Rect.fromLTWH(x, y - 2 * cornerRadius, cornerRadius * 2, cornerRadius * 2),
          math.pi / 2,
          math.pi / 2,
          false,
          cornerPaint,
        );
      }
    }

    // Dibuja superior izquierda normal
    drawCornerLeft(left, top, true, true);

    // Dibuja inferior izquierda normal
    drawCornerLeft(left, top + boxSize, false, true);

    // Ahora reflejamos para dibujar superior derecha
    canvas.save();
    // Mover origen al centro vertical de la caja para no afectar vertical
    // Luego reflejar horizontalmente alrededor del centro de la caja
    canvas.translate(size.width, 0);
    canvas.scale(-1, 1);
    // Al hacer esto, la esquina izquierda dibujada en x=left se reflejará a la derecha en x = size.width - left
    // Pero queremos que coincida con la posición derecha original: left + boxSize
    // Por eso, restamos (size.width - (left + boxSize)) para posicionar exactamente
    final double mirroredXTopRight = size.width - (left + boxSize);
    final double mirroredXBottomRight = size.width - (left + boxSize);

    // Dibuja superior derecha reflejada
    drawCornerLeft(mirroredXTopRight, top, true, true);

    // Dibuja inferior derecha reflejada
    drawCornerLeft(mirroredXBottomRight, top + boxSize, false, true);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}