import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailOrder extends StatelessWidget {

  final String label;
  final String value;
  final IconData icon;

  const DetailOrder({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 10,
      children: [
        
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .5),
            fontWeight: FontWeight.w300,
            fontSize: 13
          ),
        ),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.grey.withValues(alpha: .6),
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
          ),
        ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 13
            ),
        ),
      ],
    );


  }

}