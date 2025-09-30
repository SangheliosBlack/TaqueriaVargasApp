import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/utils/dates/dates_format.dart';
import 'package:taqueria_vargas/features/orders/application/providers/providers.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/buttons/scan_qr_button.dart';
import 'package:taqueria_vargas/features/reports/config/constants/order_status_enum.dart';

import '../../../shared/presentation/widgets/data_table/cool_data_table.dart';
import '../../../shared/presentation/widgets/data_table/row/row.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  static const String path = "/point-of-sale/sales";

  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      ref.read(ordersProvider.notifier).fetchAllOrders();
      
    });

  }

  @override
  Widget build(BuildContext context) {

    final ordersState = ref.watch(ordersProvider);

    return Container(
      color: AppTheme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
        ),
        child: CoolDataTable<OrderEntity>(
          title: "Ventas",
          data: ordersState.orderList.values.toList(), 
          onRefresh: () {
            
            ref.read(ordersProvider.notifier).refresFetchAllOrders();
            
          },
          onRowTap: (OrderEntity item) {  
            
            context.push(OrderDetail.path,extra: item);
            
          },
          cellsPerPage: [
            20,30,50,100
          ],
          totalDocuments: 126,
          actionButtons: [
            ScanQrButton()
          ],
          headers: [
            RowHeader(
              title: 'Id',
              alignment: Alignment.center,
              width: 60
            ),
            RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
            RowHeader(
              width: 130,
              alignment: Alignment.centerLeft,
              title: "Cliente",
            ),
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
              width: 130,
              alignment: Alignment.centerLeft,
            ),
            RowHeader(
              title: 'Nota',
              width: 60,
              alignment: Alignment.center,
            ),
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
                width: 130,
                alignment: Alignment.centerLeft,
                text: sale.customerOrder?.fullName ?? "",
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
                      color: status!.color.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: status.color.withValues(alpha: .2), width: 1
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
                width: 130,
                alignment: Alignment.centerLeft,
                text: DatesFormat(sale.date).formatoFechaHora
              ),
              SizedBox(
                width: 60,
                child: Center(
                  child: Icon(
                    Icons.check_box_outlined,
                    color: sale.note.isNotEmpty ? AppTheme.primary : Colors.white,
                    size: 18,
                  ),
                ),
              )
            ];
          }, 
          isLoading: ordersState.isLoading,
        ),
      ),
    );

  }

}