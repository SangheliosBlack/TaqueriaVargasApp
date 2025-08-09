import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_user_entity.dart';


class UserSaleDetail extends StatelessWidget {

  final OrderUserEntity user;

  const UserSaleDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
        spacing: 10,
          children: [
            Container(
              height: 50,
              width:  50,
              padding: EdgeInsets.symmetric(
                vertical:   10,
                horizontal: 10
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
                Text(
                  user.fullName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withValues(alpha: .8),
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ID Usuario: ',
                        style: GoogleFonts.poppins(
                          color: Colors.black.withValues(alpha: 0.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500, 
                        ),
                      ),
                      TextSpan(
                        text: user.id.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.w300, 
                        ),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ],
        ),
        Icon(
          Icons.chevron_right_sharp,
          color: AppTheme.primary,
        ),
      ],
    );

  }

}