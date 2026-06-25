import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/shared/components/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    required this.products,
    required this.onProductTap,
    required this.onFavoriteTap,
    required this.onCartTap,
    super.key,
  });

  final List<Product> products;
  final ValueChanged<Product> onProductTap;
  final ValueChanged<Product> onFavoriteTap;
  final ValueChanged<Product> onCartTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppSizes.productGridColumnCount,
        crossAxisSpacing: AppSizes.spacingLg,
        mainAxisSpacing: AppSizes.spacingXl,
        mainAxisExtent: AppSizes.productGridItemExtent,
      ),
      delegate: SliverChildBuilderDelegate(childCount: products.length, (
        context,
        index,
      ) {
        final product = products[index];
        return ProductCard(
          product: product,
          title: localizations.byKey(
            product.titleKey ?? AppSettings.emptyString,
          ),
          onTap: () => onProductTap(product),
          onFavoriteTap: () => onFavoriteTap(product),
          onCartTap: () => onCartTap(product),
        );
      }),
    );
  }
}
