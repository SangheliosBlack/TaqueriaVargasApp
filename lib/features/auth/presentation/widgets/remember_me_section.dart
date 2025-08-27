import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {

    return Container();

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox.adaptive(
                value: false,
                checkColor: Colors.white,
                fillColor: WidgetStateProperty.resolveWith((states) => Colors.white),
                onChanged: (value){

                }
              ),
              Text(
                "Recordarme",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300
                )
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Text("Olvide mi contraseña?",
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300
            )
          ),
        )
      ],
    );
  }
}