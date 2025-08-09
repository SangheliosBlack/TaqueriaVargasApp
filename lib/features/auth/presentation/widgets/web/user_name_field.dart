// ignore_for_file: dead_code

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/validators/validate_email.dart';

class UsernameFieldWidget extends StatefulWidget {

  const UsernameFieldWidget({
    super.key,
    required this.controller,
    required this.focus,
  });
  final FocusNode focus;
  final TextEditingController controller;

  @override
  State<UsernameFieldWidget> createState() => _UsernameFieldWidgetState();
}

class _UsernameFieldWidgetState extends State<UsernameFieldWidget> {
  String _textUser = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('emailField'),
      autofocus: false,
      autofillHints: const [AutofillHints.email],
      style: GoogleFonts.poppins(
        color: Colors.black, 
        fontSize: 14,
        fontWeight: FontWeight.w300
      ),
      controller: widget.controller,
      maxLines: 1,
      onFieldSubmitted: (v) {
        //FocusScope.of(context).requestFocus(widget.focus);
      },
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: _validator,
      onChanged: (text) {},
      decoration: InputDecoration(
        
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        label: Text(
          "Numero de telefono",
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .5),
            fontSize: 14,
            fontWeight: FontWeight.w300
          )
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13, horizontal: 17
        ),
        suffixIcon: _textUser.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  setState(() {
                    _textUser = '';
                  });
                  widget.controller.clear();
                })
            : null,
      ),
    );
  }

  String? _validator(String? value) {

    return null;

    if (value == null) return null;

    if (value.isEmpty) {

      return UiConstants.emailRequired;

    }

    if(!validateEmail(value)){

      return UiConstants.invalidEmail; 

    }

    return null;

  }
}
