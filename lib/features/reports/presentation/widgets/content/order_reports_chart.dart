import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class OrderReportsChart extends StatefulWidget {
  final List<OrderEntity> orders;

  double get totalVendido {
    return orders.fold(0.0, (sum, order) => sum + (double.tryParse(order.totalAmount) ?? 0.0));
  }
  String get rangoFechasVentas {
    if (orders.isEmpty) return '';
    final sorted = [...orders]..sort((a, b) => a.date.compareTo(b.date));
    final desde = sorted.first.date;
    final hasta = sorted.last.date;
    final desdeStr = "${desde.day}/${desde.month}/${desde.year}";
    final hastaStr = "${hasta.day}/${hasta.month}/${hasta.year}";
    return "$desdeStr - $hastaStr";
  }

  const OrderReportsChart({super.key, required this.orders});

  @override
  State<OrderReportsChart> createState() => _OrderReportsChartState();
}

class _OrderReportsChartState extends State<OrderReportsChart> {

  List<Color> gradientColors = [
    AppTheme.primary,
    AppTheme.primary.withValues(alpha: .7),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withValues(alpha: .2),
          width: 1
        )
      ),
      width: 350,
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Text(
                "Total vendido",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.rangoFechasVentas.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text("\$${widget.totalVendido.toStringAsFixed(2)}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),
              Container(
                width: 191,
                child: AspectRatio(
                  aspectRatio: 1.70,
                  child: LineChart(
                    showAvg ? avgData() : mainData(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// --- TITULOS EJE X (FECHA/HORA) ---
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value.toInt() < 0 || value.toInt() >= widget.orders.length) {
      return const SizedBox.shrink();
    }

    return const SizedBox.shrink();

    final order = widget.orders[value.toInt()];
    final date = order.date;
    final text = Text(
      "${date.day}/${date.month}",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        color: Colors.black87,
        fontSize: 11,
      ),
      textAlign: TextAlign.center,
    );

    return SideTitleWidget(meta: meta, child: text);
  }

  /// --- TITULOS EJE Y (MONTOS) ---
  Widget leftTitleWidgets(double value, TitleMeta meta) {

    return const SizedBox.shrink();
    return Text(
      "\$${value.toInt()}",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        color: Colors.black87,
        fontSize: 11,
      ),
    );
  }

  /// --- DATOS PRINCIPALES ---
  LineChartData mainData() {
    final orders = [...widget.orders]..sort((a, b) => a.date.compareTo(b.date));

    final spots = <FlSpot>[];
    for (int i = 0; i < orders.length; i++) {
      final amount = double.tryParse(orders[i].totalAmount) ?? 0.0;
      spots.add(FlSpot(i.toDouble(), amount));
    }

    return LineChartData(
      backgroundColor: Colors.transparent, // 🔴 sin fondo
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 0,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 60,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.white),
      ),
      minX: 0,
      maxX: spots.isNotEmpty ? spots.length.toDouble() - 1 : 0,
      minY: 0,
      maxY: spots.isNotEmpty
          ? spots.map((s) => s.y).reduce((a, b) => a > b ? a : b) + 20
          : 100,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter, // 🔴 de arriba
            end: Alignment.bottomCenter, // 🔴 hacia abajo
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              AppTheme.primary,
              Colors.white
            ]
                  .map((c) => c.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  /// --- DATOS PROMEDIO ---
  LineChartData avgData() {
    final orders = [...widget.orders];
    if (orders.isEmpty) return mainData();

    final avg = orders
            .map((o) => double.tryParse(o.totalAmount) ?? 0.0)
            .reduce((a, b) => a + b) /
        orders.length;

    return LineChartData(
      backgroundColor: Colors.transparent, // 🔴 sin fondo
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 0,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 0,
            interval: 50,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      minX: 0,
      maxX: orders.length.toDouble(),
      minY: 0,
      maxY: avg + 20,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            orders.length,
            (i) => FlSpot(i.toDouble(), avg),
          ),
          isCurved: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
