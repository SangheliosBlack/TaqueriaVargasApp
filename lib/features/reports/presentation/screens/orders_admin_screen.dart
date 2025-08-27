import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/buttons/scan_qr_button.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';
import 'package:taqueria_vargas/features/reports/config/constants/order_status_enum.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/reports/presentation/widgets/content/order_reports_chart.dart';
import 'package:taqueria_vargas/features/reports/presentation/widgets/content/total_reports_orders_chart.dart';
import 'package:taqueria_vargas/features/reports/presentation/widgets/filter_select_order_status.dart';
import 'package:taqueria_vargas/features/shared/shared.dart';

class OrdersAdminScreen extends ConsumerStatefulWidget {

  static const String path = "/point-of-sale/reports-orders";

  const OrdersAdminScreen({super.key});

  @override
  ConsumerState<OrdersAdminScreen> createState() => _OrdersAdminScreenState();
}

class _OrdersAdminScreenState extends ConsumerState<OrdersAdminScreen> {

    @override
  void initState() {

    super.initState();

     Future.microtask(() {
      ref.read(reportsProvider.notifier).fetchAllOrders();
    });

  }

  @override
  Widget build(BuildContext context) {

    final reportsState = ref.watch(reportsProvider);

    return Container(
      color: AppTheme.backgroundColor,
      child: CoolDataTable<OrderEntity>(
        title: "Mi negocio",
        onRefresh: () {
          
          ref.read(reportsProvider.notifier).fetchAllOrders();

        },
        isSelectable: false,
        isLoading: reportsState.isLoading,
        data: reportsState.getFilteredOrders,
        cellsPerPage: [
          20, 30, 50, 100
        ],
        actionButtons: [
          ScanQrButton(),
        ],
        filtersButtons: [
          FilterSelectOrderStatus()
        ],
        onRowTap: (OrderEntity item) {},
        totalDocuments: 126,
        headers: [
          RowHeader(
            title: 'Id',
            alignment: Alignment.center,
            width: 60
          ),
          RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
          RowHeader(
            title: 'POS', 
            width: 150,
            alignment: Alignment.centerLeft
          ),
          RowHeader(
            title: 'Total',
            alignment: Alignment.centerLeft,
            width: 100,
          ),
          RowHeader(
            title: 'Estatus',
            alignment: Alignment.centerLeft,
            width: 110,
          ),
          RowHeader(
            title: 'Fecha',
            width: 180,
            alignment: Alignment.centerLeft,
          ),
        ],
        charts: [
          OrderReportsChart(orders: reportsState.getFilteredOrders),
          Gap(20),
          OrderCountReportsChart(orders: reportsState.getFilteredOrders)
        ],
        buildRow: (OrderEntity sale) {     
            return [
              RowCell(
                width: 60,
                text: sale.id.toString(),
                alignment: Alignment.center,
              ),
              RowCell(
                text: sale.orderUser.fullName,
              ),
              RowCell(
                width: 150,
                text: sale.posStation.name,
              ),
              RowCell(
                width: 100,
                alignment: Alignment.centerLeft,
                text: "\$ ${sale.totalAmount}"
              ),
              SizedBox(
                width: 110,
                child: Builder(

                  builder: (context) {

                  final status = OrderStatus.fromCode(sale.status.code);

                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: status!.color.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: status.color, width: 1
                    ),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          width:  5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: status.color,
                            shape: BoxShape.circle
                          ),
                        ),
                        Text(
                          status.value,
                          style: GoogleFonts.poppins(
                            color: status.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  );
                  },
                ),
              ),
              RowCell(
                width: 180,
                alignment: Alignment.centerLeft,
                text:sale.date.toLocal().toString()
              )
            ];
          }, 
      ),
    );
  }
}
