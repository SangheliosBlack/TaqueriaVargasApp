import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementSearch extends StatelessWidget {

  const ManagementSearch({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),     
      child: Row(
        spacing: 10,
        children: [
          Icon(BootstrapIcons.search),
          Text(
            "Buscar...",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ), 
    );

  }

}
