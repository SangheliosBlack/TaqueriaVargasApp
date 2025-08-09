
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';
import 'package:taqueria_vargas/features/orders/application/providers/orders_provider.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/header_menu/header_label_cart.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/account_menu/select_client_extra_data/select_client_selector.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/total_description/total_description_widget.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/presentation.dart';
import 'package:taqueria_vargas/features/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';


class AccountMenu extends ConsumerWidget {

  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final orderCartState = ref.watch(orderCartProvider);

    final isLoading = ref.watch(ordersProvider.select((state) => state.isLoading));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 250,
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                HeaderLabelCart(),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Stack(
                        children: [
                          CartProductList(),
                          SelectClientAvatar(),
                          Positioned.fill(
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: isLoading 
                              ? Offstage(
                                key: ValueKey(isLoading),
                                offstage: !isLoading,
                                child: Container(
                                  color: Colors.white.withValues(alpha: .7),
                                  child: Center(
                                    child: CircularProgressIndicator()
                                  )
                                )
                              ) : Container(
                                key: ValueKey(isLoading),
                                
                              ) 
                            ),
                          )
                        ],
                      )),
                      TotalDescription(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PaymentMethodCard(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Button(
              onTap: () async { 

                if(orderCartState.productList.isEmpty) return;

                final OrderEntity? orderId = await ref.read(ordersProvider.notifier).createOrder();

                final isConnected = ref.watch(printerConnectionProvider);

                if(isConnected) {

                  await ref.read(printerServiceProvider).printReceipt(orderId: orderId!.id.toString());

                }

                if(orderId != null) {

                  ref.read(orderCartProvider.notifier).cleanOrder();

                  ref.read(enterAmountProvider.notifier).updateAmount(amount: 0);

                  ref.read(orderCartProvider.notifier).removeClient();

                }

                final errorMessage = ref.read(ordersProvider.select((state) => state.errorMessage));

                // ignore: use_build_context_synchronously
                MessageServiceImpl().showBottom(
                  context: context, 
                  title: orderId != null ? "Orden creada con exito!": 
                  errorMessage, message: orderId != null ? "Registro de ventas actulizado" :  "Verifica el estado de tu punto de venta" , 
                  backgroundColor: orderId != null ? AppTheme.primary : AppTheme.error
                );

                /*
                
                final result = await CustomDialogService.showAlertDialog(
                  // ignore: use_build_context_synchronously
                  context: context, 
                  content:  CheckoutOrderDialog(
                  )
                );

                if(result == null || !result) return;

                MessageServiceImpl().showTop(context: context, message: "Orden creada con exito!");

                */

              },
              isLoading: isLoading,
              borderRadius: 100,
              locked: orderCartState.productList.isEmpty,
              child: Text(
                "Ordenar",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}