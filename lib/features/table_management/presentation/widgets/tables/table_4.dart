import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

import 'package:taqueria_vargas/core/config/themes/main_theme.dart';

class Table4 extends StatelessWidget {

  const Table4({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned.fill(
          child: Transform.rotate(
            angle: -45 * math.pi / 180,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: .1),
                        blurRadius: 10,
                        spreadRadius: 10
                      )
                    ],
                  ),
                  width: 33,
                  height: 33,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Transform.rotate(
            angle: -45 * math.pi / 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: .1),
                        blurRadius: 10,
                        spreadRadius: 10
                      )
                    ],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  width: 33,
                  height: 33,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Transform.rotate(
            angle: -45 * math.pi / 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: .1),
                        blurRadius: 10,
                        spreadRadius: 10
                      )
                    ],
                  ),
                  width: 33,
                  height: 33,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Transform.rotate(
            angle: -45 * math.pi / 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: .1),
                        blurRadius: 10,
                        spreadRadius: 10
                      )
                    ],
                  ),
                  width: 33,
                  height: 33,
                ),
              ],
            ),
          ),
        ),
        Transform.rotate(
          angle: -45 * math.pi / 180,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(151,176,248, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: .1),
                        blurRadius: 10,
                        spreadRadius: 10
                      )
                    ],
            ),
            width: 100,
            height: 100,
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    "101",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }

}