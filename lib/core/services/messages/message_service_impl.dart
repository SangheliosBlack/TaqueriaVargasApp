import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/services/messages/messages.dart';

Flushbar? _flushbar; 

class MessageServiceImpl implements MessageService {

  @override
  Future<void> showBottom({required BuildContext context, required String title, required String message,required Color backgroundColor}) async {

    _flushbar = Flushbar<bool>(
      titleSize: 25,
      messageSize: 20,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 4),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(5),
      titleText: Text(
        title,
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontSize: 25,
        ),
        ),
      messageText: Text(
        message,
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
      mainButton: TextButton(
        onPressed: () {
          _flushbar?.dismiss(); 
        },
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 18,
        ),
      ),
    );

    await _flushbar!.show(Navigator.of(context, rootNavigator: true).context);


  }
  
}
