import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/core.dart';

class OrderCreateNewTicketButton extends StatelessWidget {

  const OrderCreateNewTicketButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10
      ),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            Icons.print,
            color: AppTheme.primary,
          ),
          Text(
            "Imprimir ticket",
            style: GoogleFonts.poppins(
              color: AppTheme.primary,
              fontWeight: FontWeight.w300,
              fontSize: 15
            ),
          ),
        ],
      ),
    );

  }

}