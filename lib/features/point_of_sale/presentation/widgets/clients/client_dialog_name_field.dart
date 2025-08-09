import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDialogNameField extends ConsumerStatefulWidget {
  const ClientDialogNameField({super.key});

  @override
  ConsumerState<ClientDialogNameField> createState() => _ClientDialogNameFieldState();
}

class _ClientDialogNameFieldState extends ConsumerState<ClientDialogNameField> {
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

      // Escucha cuando cambia el cliente seleccionado y actualiza el controller
    ref.listen(
      orderCartProvider.select((state) => state.clientSelected),
      (prev, next) {
        if (next == null) {
          _controller.clear(); // Cliente eliminado
        } else {
          _controller.text = next.fullName; // Asumiendo que `name` es la propiedad del cliente
        }
      },
    );

    return TextField(
      controller: _controller,
      onChanged: (value) {
      ref.read(clientFormProvider.notifier).updateName(value: value);
      },
      textInputAction: TextInputAction.next,
      style: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 13.0,
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
        "Nombre del cliente",
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
