import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:taqueria_vargas/features/products/application/providers/product_provider.dart';
import 'package:taqueria_vargas/features/products/domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends ConsumerWidget {

  final CategoryEntity category;

  const CategoryCard({
    super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      key: ValueKey('category_card_${category.id}'),
      behavior: HitTestBehavior.translucent,
      onTap: () => ref.read(productsProvider.notifier).toggleCategorySelection(category),
      child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(10),
      width:  70,
      height: 70,
      decoration: BoxDecoration(
        color: category.isSelected ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
       
      ),
      child: Column(
        spacing: 5,
        children: [
        Expanded(
            child: category.imgUrl.isNotEmpty
              ? CachedNetworkImage(
                imageUrl: category.imgUrl,
                placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    category.isSelected ? Colors.white : AppTheme.primary,
                  ),
                  ),
                ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                fit: BoxFit.contain,
              )
              : Icon(Icons.image_not_supported, color: Colors.grey),
        ),
        Center(
          child: Text(
          category.name,
          style: GoogleFonts.poppins(
            color: category.isSelected ? Colors.white : Colors.black.withValues(alpha: .8),
            fontSize: 9,
            fontWeight: FontWeight.w400
          ),
          ),
        ),
        ],
      ),
      ),
    );

  }

}