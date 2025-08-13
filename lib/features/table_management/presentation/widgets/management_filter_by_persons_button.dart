import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementFilterByPersonsButton extends StatelessWidget {

  final String label;
  final String description;
 
  const ManagementFilterByPersonsButton({
    super.key, 
    required this.label, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                height: 1
              ),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                height: 1,
                fontSize: 12
              ),
            )
          ],
        ),
      )
    );

  }

}