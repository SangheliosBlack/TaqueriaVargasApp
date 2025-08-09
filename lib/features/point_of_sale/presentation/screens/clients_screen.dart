import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/customers/application/application.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

import 'package:taqueria_vargas/core/config/themes/main_theme.dart';


import '../../../shared/presentation/widgets/data_table/cool_data_table.dart';
import '../../../shared/presentation/widgets/data_table/row/row.dart';


class ClientsScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/clients";

  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final customerState = ref.watch(customersProvider);

    return Container(
      color: AppTheme.backgroundColor,
      child: CoolDataTable<CustomerEntity>(
        title: "Clientes",
        isLoading: customerState.isLoading,
        data: customerState.customerList.values.toList(), 
        cellsPerPage: [
          20,30,50,100
        ],
        totalDocuments: 126,
        onRowTap: (CustomerEntity item) {  
            
          
            
        },
        headers: [
          RowHeader(
            title: 'No. celular',
            alignment: Alignment.centerLeft,
            width: 120,
          ),
          RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
          RowHeader(
            title: 'Direccion',
            alignment: Alignment.centerLeft,
          ),
          RowHeader(
            title: 'Referencias',
            alignment: Alignment.centerLeft,
          ),
           RowHeader(
            width: 100,
            title: 'Creado',
            alignment: Alignment.centerLeft,
          ),
        ], 
        buildRow: (CustomerEntity client) {     
          return [
            RowCell(
              width: 120,
              text: client.formattedPhone
            ),
            RowCell(
              text: client.fullName,
            ),
            RowCell(
              text:client.address
            ),
            RowCell(
              text:client.references
            ),
             RowCell(
              width: 100,
              text:client.createdAt.toString().substring(0,10),
            )
          ];
        }, 
      ),
    );

  }

}