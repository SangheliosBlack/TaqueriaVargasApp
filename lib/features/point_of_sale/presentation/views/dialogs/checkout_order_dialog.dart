import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/pos_printer/providers/pos_printer_provider.dart';
import 'package:taqueria_vargas/features/orders/application/providers/orders_provider.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';

import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/calculator/calculator.dart';

class CheckoutOrderDialog extends ConsumerWidget {

  const CheckoutOrderDialog({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
          top: 30
        ),
        color: Colors.white,
        width: 450,
        child: Stack(
          children: [
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TotalAmountCalculator(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          EnterAmountWidget(),
                          Divider(color: Colors.grey.withAlpha(100)),
                          CalculatorChangeAmount()
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: CalculatorGrid(
                    onPressed: (String value ) async { 
                          
                      if(value == "C") {
                          
                        ref.read(enterAmountProvider.notifier).deleteLastDigit();
                          
                        return;
                        
                      }

                      if(value == "O"){

                        final OrderEntity? order = await ref.read(ordersProvider.notifier).createOrder();

                        final isConnected = ref.watch(printerConnectionProvider);

                        if(isConnected) {

                          await ref.read(printerServiceProvider).printReceipt(order: order!);

                        }

                        ref.read(orderCartProvider.notifier).cleanOrder();

                        ref.read(enterAmountProvider.notifier).updateAmount(amount: 0);

                        ref.read(orderCartProvider.notifier).removeClient();

                        Navigator.of(context).pop(true);

                        return;

                      }
                      
                      ref.read(enterAmountProvider.notifier).updateAmount(amount: double.parse(value));
                  
                    },
                  ),
                ),
                //CalculatorContinueButton(),
                /*
                FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Icon(Icons.close), 
                 style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(12),
                ),
              ),
            */
              ],
            ),
             Positioned(
              right: -5,
              top: 0,
               child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  label: Icon(Icons.close), 
                   style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(12),
                  ),),
             )
          ],
        ),
      ),
    );
  }
}