import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLabelCart extends StatelessWidget {
  const HeaderLabelCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),
           child: Text(
              "Cuenta actual",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300
              )
            ),
         ),
          Divider(
            color: Colors.grey.withValues(alpha: .2),
            height: 1,
            thickness: 1,
          ),
      ],
    );
  }
}