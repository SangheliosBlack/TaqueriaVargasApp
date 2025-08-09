// ignore_for_file: dead_code

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';

import '../../../../../core/constants/constants.dart';


class PassFieldWidget extends StatefulWidget {

  const PassFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = true,
    required this.focus,
    required this.formKey,
  });

  final bool obscureText;
  final TextEditingController controller;
  final String labelText;
  final GlobalKey<FormState> formKey;
  final FocusNode focus;

  @override
  State<PassFieldWidget> createState() => _PassFieldWidget();

}

class _PassFieldWidget extends State<PassFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      key: const ValueKey('passwordField'),
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      //focusNode: widget.focus,
      autofillHints: const [AutofillHints.password],
      style: GoogleFonts.poppins(
        color: Colors.black, 
        fontSize: 14,
        fontWeight: FontWeight.w300
      ),
      controller: widget.controller,
      obscureText: _obscureText,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onEditingComplete: () {

        if (!widget.formKey.currentState!.validate()) {

          return;

        }
        
        //FocusScope.of(context).unfocus();
      },
      validator: _validator,
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        label: Text(
          "Contraseña",
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .5),
            fontSize: 14,
            fontWeight: FontWeight.w300
          )
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 17),
        suffixIcon: widget.obscureText
          ? Container(
              padding: EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: _obscureText ? AppTheme.primary : Colors.black,
                  ),
                ),
          )
          : Container()),
    );
  }

  String? _validator(String? value) {

    return null;

    if (value == null) return null;

    if (value.isEmpty) {

      return UiConstants.passwordRequired;

    }

    if(value.length < 6 || value.length > 16){

      return UiConstants.invalidPassword;

    }

    return null;
  }
}
