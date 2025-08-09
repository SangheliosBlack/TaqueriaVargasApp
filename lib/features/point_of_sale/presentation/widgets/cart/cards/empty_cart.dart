import 'package:flutter/material.dart';
import 'package:taqueria_vargas/core/constants/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartCard extends StatelessWidget {

  const EmptyCartCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 60
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Image(
            image: AssetImage("assets/images/empty_cart.png"),
            fit: BoxFit.fitWidth,
          ),
          Text(
            UiConstants.emptyCart,
            overflow: TextOverflow.visible,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black
            ),
          ),
        ],
      ),
    );

  }

}