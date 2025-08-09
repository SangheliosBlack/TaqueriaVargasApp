import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/customers/application/providers/customers_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDialogReferenceField extends ConsumerStatefulWidget {
  const ClientDialogReferenceField({super.key});

  @override
  ConsumerState<ClientDialogReferenceField> createState() => _ClientDialogReferenceFieldState();
}

class _ClientDialogReferenceFieldState extends ConsumerState<ClientDialogReferenceField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(
      orderCartProvider.select((state) => state.clientSelected),
      (prev, next) {
        if (next == null) {
          _controller.clear();
        } else {
          _controller.text = next.references; // Asegúrate de que `reference` exista en el modelo
        }
      },
    );

    final bool formStatusIsValid = ref.watch(clientFormProvider).isValid;

    return TextField(
      controller: _controller,
      onChanged: (value) {
        ref.read(clientFormProvider.notifier).updateReference(value: value);
      },
      textInputAction: TextInputAction.done,
      onSubmitted: formStatusIsValid ?  (value) {

        ref.read(customersProvider.notifier).addClient();

        context.pop();
        
      } : null ,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
        label: Text(
          "Referencias",
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .7),
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        ),
        
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        fillColor:  Colors.white,        
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
