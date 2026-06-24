import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/app_localizations.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_cubit.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class PopularProductsGrid extends StatelessWidget {
  const PopularProductsGrid({required this.products, super.key});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.spacingLg,
        mainAxisSpacing: AppSizes.spacingXl,
        mainAxisExtent: 252,
      ),
      delegate: SliverChildBuilderDelegate(childCount: products.length, (
        context,
        index,
      ) {
        final product = products[index];
        return ProductCard(
          product: product,
          title: localizations.byKey(product.titleKey),
          onTap: () {},
          onFavoriteTap: () {
            context.read<HomeCubit>().toggleFavorite(product.id);
          },
          onCartTap: () {
            context.read<HomeCubit>().toggleCart(product.id);
          },
        );
      }),
    );
  }
}
