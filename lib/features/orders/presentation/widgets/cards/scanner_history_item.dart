import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannerHistoryItem extends StatelessWidget {

  const ScannerHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey.withValues(alpha: .2)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                BootstrapIcons.qr_code_scan,
                size: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ORDER-TV-8349275610-23",
                      style: GoogleFonts.poppins(
                        color: Colors.black.withValues(alpha: .8),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Orden",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "12/02/25 '02:30",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .5),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );

  }

}