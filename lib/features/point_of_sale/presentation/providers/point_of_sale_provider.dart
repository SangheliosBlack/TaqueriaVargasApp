import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/point_of_sale_use_cases.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/states/point_of_sale_state.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/views/dialogs/close_po_dialog.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/shared/presentation/utils/show_custom_dialog.dart';

part 'point_of_sale_provider.g.dart';

@Riverpod(keepAlive: true)
class PointOfSale extends _$PointOfSale {

  @override
  PointOfSaleState build() => PointOfSaleState();

  PointOfSaleUseCases get useCases => ref.read(pointOfSaleUseCasesProvider);

  Future<void> openTurn() async {

    final response = await useCases.openTurn();

    response.fold(
      (error) {
        // Handle error
        print('Error opening turn: $error');
      },
      (success) {
        // Handle success
        print('Turn opened successfully: $success');
      },
    );

  }

   Future<void> openPo({required BuildContext context}) async {

    state = state.copyWith(isLoading: true);

    final totalDue = ref.watch(enterAmountProvider);

    final response = await useCases.openPo(amount: totalDue);

    response.fold(
      (error) {
        // Handle error
        //MessageServiceImpl().showBottom(context: context, title: "Error OPEN PO: $error");
      },
      (success) {

        state = state.copyWith(isLoading: false);

        context.pop(true);

        ref.read(authProvider.notifier).isOpenUpdate(isOpenToday: true);

        ref.read(enterAmountProvider.notifier).clearAmount();

        MessageServiceImpl().showBottom(context: context,title: "¡Caja abierta exitosamente!", message: 'Gracias por tu apoyo.', backgroundColor: AppTheme.primary,);
      },
    );

    state = state.copyWith(isLoading: false);

  }

  Future<bool> closePo({required BuildContext context}) async {

    state = state.copyWith(isLoading: true);

    final totalDue = ref.watch(enterAmountProvider);

    final response = await useCases.closePo(amount: totalDue);

    return response.fold(
      (error) {

        state = state.copyWith(isLoading: false);
        
        MessageServiceImpl().showBottom(context: context,title: "Error al cerrar la caja",message: error.toString(),backgroundColor: AppTheme.delete,);
        
        context.pop(false);

        return true;


      },
      (success) {

        state = state.copyWith(isLoading: false);

        context.pop(true);

        ref.read(authProvider.notifier).isOpenUpdate(isOpenToday: false);

        ref.read(enterAmountProvider.notifier).clearAmount();

        MessageServiceImpl().showBottom(context: context,title: "¡Caja cerrada exitosamente!", message: 'Gracias por tu apoyo.', backgroundColor: AppTheme.primary,);

        return false;


      },
    );

    


  }

  void toggleMenu() async {
    
    if (!state.isMenuOpen) {
      // AL ABRIR: Primero expandir el menú, luego mostrar contenido
      state = state.copyWith(isMenuOpen: true);
      
      // Delay para que el contenedor se expanda primero
      await Future.delayed(Duration(milliseconds: 150));
      
      state = state.copyWith(showMenuContent: true);
    } else {
      // AL CERRAR: Primero ocultar contenido, luego contraer menú
      state = state.copyWith(showMenuContent: false);
      
      // Delay para que el contenido desaparezca primero
      await Future.delayed(Duration(milliseconds: 80));
      
      state = state.copyWith(isMenuOpen: false);
    }

  }

  Future<void> closeTurn({required BuildContext context,required int turnId}) async {

    final response = await useCases.closeTurn(turnId:turnId);

    await response.fold(
      (error) async {

        final isOpenToday = ref.read(authProvider).user!.isOpenToday ?? true;

        if(isOpenToday){

          if(error == "Para cerrar el turno es necesario cerrar todos los puntos de venta."){

            MessageServiceImpl().showBottom(
              context: context,
              title: "Error al cerrar el turno",
              message: "Para cerrar el turno debes tener todos tus puntos de venta cerrados",
              backgroundColor: AppTheme.delete
            );

            return;

          }

        
          return;

        }

        MessageServiceImpl().showBottom(
          context: context,
          title: "Turno cerrado con exito",
          message: "El turno actual se ha cerrado satisfactoriamente.",
          backgroundColor: AppTheme.primary
        );

        ref.read(authProvider.notifier).isOpenUpdate(isOpenToday: false);

        ref.read(reportsProvider.notifier).closeTurn();
        
        
        //MessageServiceImpl().showBottom(context: context, title: error);

        print('Error closing turn: $error');
      },
      (success) {
        // Handle success
         //MessageServiceImpl().showBottom(context: context, title: "¡Turno cerrado exitosamente!");

            return;

      },
    );

  }


}