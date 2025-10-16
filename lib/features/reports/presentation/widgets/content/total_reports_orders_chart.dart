import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';

class OrderCountReportsChart extends StatefulWidget {
  final List<OrderEntity> orders;

  int get totalVentas => orders.length;

  String get rangoFechasVentas {
    if (orders.isEmpty) return '';
    final sorted = [...orders]..sort((a, b) => a.date.compareTo(b.date));
    final desde = sorted.first.date;
    final hasta = sorted.last.date;
    final desdeStr = "${desde.day}/${desde.month}/${desde.year}";
    final hastaStr = "${hasta.day}/${hasta.month}/${hasta.year}";
    return "$desdeStr - $hastaStr";
  }

  const OrderCountReportsChart({super.key, required this.orders});

  @override
  State<OrderCountReportsChart> createState() => _OrderCountReportsChartState();
}

class _OrderCountReportsChartState extends State<OrderCountReportsChart> {
  List<Color> gradientColors = [
    AppTheme.primary,
    AppTheme.primary.withOpacity(.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
          width: 1,
        ),
      ),
      width: 350,
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cantidad de ventas",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.rangoFechasVentas,
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
              
              Text(
                "${widget.totalVentas}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                width: 191,
                height: 80,
                child: LineChart(mainData()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value.toInt() < 0 || value.toInt() >= widget.orders.length) {
      return const SizedBox.shrink();
    }
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(
      "${value.toInt()}",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        color: Colors.black87,
        fontSize: 11,
      ),
    );
  }

  LineChartData mainData() {
    final orders = [...widget.orders]..sort((a, b) => a.date.compareTo(b.date));
    final spots = <FlSpot>[];
    for (int i = 0; i < orders.length; i++) {
      spots.add(FlSpot(i.toDouble(), 1));
    }

    return LineChartData(
      backgroundColor: Colors.transparent,
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
            interval: 1,
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
      maxY: 2,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
                Colors.white,
              ].map((c) => c.withOpacity(0.2)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
