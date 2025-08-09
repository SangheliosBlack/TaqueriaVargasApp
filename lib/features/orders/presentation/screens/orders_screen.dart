import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/orders/application/providers/providers.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/buttons/scan_qr_button.dart';

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
              width: 100,
            ),
            RowHeader(
              title: 'Fecha',
              width: 180,
              alignment: Alignment.centerLeft,
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
                width: 150,
                text: sale.posStation.name,
              ),
              RowCell(
                width: 100,
                alignment: Alignment.centerLeft,
                text: "\$ ${sale.totalAmount}"
              ),
              RowCell(
                width: 100,
                text: sale.status.value
              ),
              RowCell(
                width: 180,
                alignment: Alignment.centerLeft,
                text:sale.date.toLocal().toString()
              )
            ];
          }, 
          isLoading: ordersState.isLoading,
        ),
      ),
    );

  }

}