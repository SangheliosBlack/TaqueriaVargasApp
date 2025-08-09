import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrinterConfigurationView extends StatelessWidget {

  const PrinterConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Configuracion",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              Text(
                "Mi Impresora",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/printer.png",
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Para configurar tu impresora, por favor sigue las instrucciones de tu dispositivo.",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );

  }

}