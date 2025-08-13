import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementFilterButton extends StatelessWidget {

  final String label;
  final IconData icon;
 
  const ManagementFilterButton({
    super.key, 
    required this.label, 
    required this.icon
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
            Icon(
              icon,
              size: 20,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 12
              ),
            )
          ],
        ),
      )
    );

  }

}