import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/cards/scanner_history_item.dart';

class ScannerHistoryContent extends StatelessWidget {

  const ScannerHistoryContent({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 250,
      padding: EdgeInsetsGeometry.only(
        bottom: 0,
        top: 20,
        left: 5,
        right: 5
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Text(
            "Historial",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_,i) { 

              return ScannerHistoryItem();

            }, 
            separatorBuilder: (_,__) => Gap(10),
            itemCount: 1
          )
        ],
      ),
    );

  }
  
}