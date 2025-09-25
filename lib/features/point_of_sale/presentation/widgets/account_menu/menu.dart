
import 'package:bootstrap_icons/bootstrap_icons.dart';
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


class AccountMenu extends ConsumerStatefulWidget {

  const AccountMenu({super.key});

  @override
  ConsumerState<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends ConsumerState<AccountMenu> {
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
    // Initialize controller with current state value
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentNote = ref.read(orderCartProvider).note;
      _notesController.text = currentNote;
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final orderCartState = ref.watch(orderCartProvider);

    final isLoading = ref.watch(ordersProvider.select((state) => state.isLoading));

    // Sync controller with state changes (e.g., when cart is cleaned)
    if (_notesController.text != orderCartState.note) {
      _notesController.text = orderCartState.note;
    }

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
                      Container(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Notas",
                               style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                                )
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      BootstrapIcons.arrow_down_circle,
                                      color: Colors.black,
                                      size: 12,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom: 10
                              ),
                              child: TextField(
                                controller: _notesController,
                                onChanged: (value) {
                                  ref.read(orderCartProvider.notifier).setNote(note: value);
                                },
                                decoration: InputDecoration(
                                  hintText: "Agrega notas adicionales...",
                                  suffixIcon: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _notesController.clear();
                                          ref.read(orderCartProvider.notifier).setNote(note: '');
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black54,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  hintStyle: GoogleFonts.poppins(
                                  color: Colors.black.withValues(alpha: .5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                                ),
                                  filled: true,
                                  fillColor: Colors.grey.withValues(alpha: .05),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none, 
                                  ),
                                ),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                                ),
                                
                              )
                            ),
                          ],
                        )
                      ),
                      Divider(
                        color: Colors.grey.withValues(alpha: .2),
                        height: 1,
                        thickness: 1,
                      ),
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

                final OrderEntity? order = await ref.read(ordersProvider.notifier).createOrder();

                if(order != null) {

                  final isConnected = ref.watch(printerConnectionProvider);

                  if(isConnected) {

                    await ref.read(printerServiceProvider).printReceipt(order: order);

                  }

                  ref.read(orderCartProvider.notifier).cleanOrder();

                  ref.read(enterAmountProvider.notifier).updateAmount(amount: 0);

                  ref.read(orderCartProvider.notifier).removeClient();

                }

                final errorMessage = ref.read(ordersProvider.select((state) => state.errorMessage));

                // ignore: use_build_context_synchronously
                MessageServiceImpl().showBottom(
                  context: context, 
                  title: order != null ? "Orden creada con exito!": 
                  errorMessage, message: order != null ? "Registro de ventas actulizado" :  "Verifica el estado de tu punto de venta" , 
                  backgroundColor: order != null ? AppTheme.primary : AppTheme.error
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