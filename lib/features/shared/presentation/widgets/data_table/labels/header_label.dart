import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLabel extends StatelessWidget {

  final String title;
  final List<Widget>? actionButtons;

  const HeaderLabel({
    super.key,
    required this.title,
    this.actionButtons
    });

  @override
  Widget build(BuildContext context) {

    if(title.isEmpty){

      return SizedBox();

    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          if (actionButtons != null) ...actionButtons!,
        ],
      ),
    );

  }

}