import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/categories/categories.dart';
import 'package:taqueria_vargas/features/products/application/providers/providers.dart';
import 'package:gap/gap.dart';
import 'package:taqueria_vargas/features/products/domain/entities/category_entity.dart';

class CategoryList extends ConsumerStatefulWidget {

  const CategoryList({super.key});

  @override
  ConsumerState<CategoryList> createState() => _CategoryListState();

}

class _CategoryListState extends ConsumerState<CategoryList> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {
      ref.read(productsProvider.notifier).fetchAllProducts();
    });

  }

  @override
  Widget build(BuildContext context) {

    final categoryState = ref.watch(productsProvider);

    return SizedBox(
      height: 70,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, i) {

          final CategoryEntity? category = categoryState.isLoading ? null : categoryState.products[i];

          return CategoryCardShimmer(category: category);

        },
        separatorBuilder: (_, __) => const Gap(10),
        itemCount: categoryState.isLoading ? 10 :  categoryState.products.length,
      ),
    );

  }

}
