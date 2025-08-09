import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarClientSelector extends ConsumerWidget {

  final IconData icon;
  final Function()? onTap;
  final bool isActive;

  const AvatarClientSelector({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isActive
  });

  @override
  Widget build(BuildContext context,ref) {

    //final orderCartState= ref.watch(orderCartProvider);

    return GestureDetector(
      onTap:  onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primary : AppTheme.primary.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              'Envio',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
              color: !isActive ? AppTheme.primary : Colors.white,
              fontSize: 11,
              // No margin or padding here
              ),
            ),
            Icon(
              BootstrapIcons.truck,
              color: !isActive ? AppTheme.primary : Colors.white,
              size: 17,
            ),
          ],
        ),
      ),
    );

  }

}