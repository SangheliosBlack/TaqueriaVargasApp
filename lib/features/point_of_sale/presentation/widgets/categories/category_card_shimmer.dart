import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';

import 'package:shimmer/shimmer.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/categories/category_card.dart';
import 'package:taqueria_vargas/features/products/domain/entities/category_entity.dart';

class CategoryCardShimmer extends StatelessWidget {

  final CategoryEntity? category;


  const CategoryCardShimmer({
    super.key,
    this.category
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600), 
      reverseDuration: Duration(milliseconds: 600),
      child:  category != null 
        ? CategoryCard(category: category!)
        : Shimmer.fromColors(
          key: ValueKey('category_card_shimmer}'),
      baseColor: Colors.white.withValues(alpha: .3),
      highlightColor: Colors.white.withValues(alpha: 1),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
           
        padding: EdgeInsets.all(10),
        width:  80,
        height: 80,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Column(
          spacing: 5,
          children: [
            Expanded(child: Image.network("")),
            Center(
              child: Text(
                "CATERGORIA",
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );

  
  }

  }
