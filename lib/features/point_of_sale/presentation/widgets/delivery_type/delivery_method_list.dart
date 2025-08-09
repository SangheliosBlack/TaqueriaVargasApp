import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class DeliveryMethodList extends ConsumerWidget {

  const DeliveryMethodList({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final typesSalesList = ref.watch(authProvider).user!.roles.first.saleTypes;

    final typeSaleSelected = ref.watch(orderCartProvider).selectedSaleTypeId;

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(  
        horizontal: 15
      ),
      itemBuilder: ( _, i) {
    
        final data = typesSalesList[i];
    
        return DeliveryMethodButton(
          active: typeSaleSelected == 0 ? i == 0 : typeSaleSelected == data.id, 
          data: data
        );
    
      }, 
      separatorBuilder: (_,__) => Gap(5), 
      itemCount: typesSalesList.length,
    
    );

  }
  
}