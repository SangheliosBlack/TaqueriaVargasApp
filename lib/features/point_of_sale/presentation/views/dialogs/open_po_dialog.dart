import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/features/point_of_sale/application/providers/enter_amount/enter_amount_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';

import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/calculator/calculator.dart';

class OpenPoDialog extends ConsumerWidget {

  final BuildContext context;

  const OpenPoDialog({super.key,required this.context});

  @override
  Widget build(BuildContext _,ref) {

    final isLoading = ref.watch(pointOfSaleProvider.select((state) => state.isLoading));

    final totalDue = ref.watch(enterAmountProvider);

    final userData = ref.watch(authProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 30
        ),
        color: Colors.white,
        width: 450,
        child: Stack(
          children: [
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 20,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Container(
                                  height: 35,
                                  width:  35,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 7
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primary,
                                    shape: BoxShape.circle
                          
                                  ),
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/example.png",
                                    ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Hola, ",
                                           style: GoogleFonts.poppins(
                                            color: Colors.black.withValues(alpha: .8),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        Text(
                                          userData.user!.fullName,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: Colors.black.withValues(alpha: .8),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                      Row(
                                        spacing: 5,
                                        children: [
                                          Text(
                                            userData.user!.posInfo?.name ?? "",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black.withValues(alpha: .8),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300
                                            ),
                                                                ),
                                          Text(
                                            "(${userData.user!.posInfo?.code ?? ""})",
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300
                                            ),
                                                                ),
                                        ],
                                      ),
                          
                                  ],
                                ),
                          
                              ],
                            ),
                          ],
                                                ),
                        ),
                        Text(
                            "¿Con cuánto abrimos hoy?",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),
                        ),

                      ],
                    ),
                    CurrencyText(
                      price: totalDue,
                      textStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Column(
                      children: [
                        Divider(color: Colors.grey.withAlpha(100)),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    width: 400,
                    child: CalculatorGrid(
                    
                      onPressed: (String value ) async { 
                    
                        if(value == "C") {
                    
                          ref.read(enterAmountProvider.notifier).deleteLastDigit();
                    
                          return;
                        }
                    
                        if(value == "O"){
                    
                          Navigator.of(context).pop(true);
                    
                          return;
                    
                        }
                    
                        ref.read(enterAmountProvider.notifier).updateAmount(amount: double.parse(value));
                    
                      },
                    
                    ),
                  ),
                ),
                Button(

                  onTap: () async {

                    if(totalDue <= 0) return;

                    await ref.read(pointOfSaleProvider.notifier).openPo(context: context);

                  },
                  locked: totalDue <= 0,
                  isLoading: isLoading,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      "Confirmar",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                    ) 
                ),
              ],
            ),
            Positioned(
             right: 10,
             top: 0,
              child: FilledButton.icon(
                 onPressed: () {
                  
                  Navigator.of(context).pop(false);

                  ref.read(enterAmountProvider.notifier).clearAmount();

                 },
                 label: Icon(Icons.close), 
                  style: FilledButton.styleFrom(
                   backgroundColor: Colors.grey[200],
                   foregroundColor: Colors.black,
                   shape: CircleBorder(),
                   padding: EdgeInsets.all(10),
                 ),),
            )
          ],
        ),
      ),
    );
  }
}