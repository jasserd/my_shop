import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/domain/entities/product.dart';

import 'app_network_image.dart';
import 'app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.title,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onCartTap,
    super.key,
  });

  final Product product;
  final String title;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final formattedPrice = NumberFormat.decimalPattern(
      AppSettings.numberFormatLocale,
    ).format(product.price);

    return Material(
      color: AppColors.background,
      child: InkWell(
        onTap: onTap,
        borderRadius: const .all(.circular(AppSizes.radiusMedium)),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: AppSizes.productImageHeight,
              child: Stack(
                fit: .expand,
                children: [
                  ClipRRect(
                    borderRadius: const .all(.circular(AppSizes.radiusMedium)),
                    child: AppNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: .cover,
                    ),
                  ),
                  Positioned(
                    top: AppSizes.spacingSm,
                    right: AppSizes.spacingSm,
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        _ProductAction(
                          icon: Icons.shopping_cart,
                          color: product.isInCart
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          tooltip: product.isInCart
                              ? localizations.removeFromCartTooltip
                              : localizations.addToCartTooltip,
                          onTap: onCartTap,
                        ),
                        const SizedBox(width: AppSizes.spacingXs),
                        _ProductAction(
                          icon: product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          tooltip: product.isFavorite
                              ? localizations.removeFromFavoritesTooltip
                              : localizations.addToFavoritesTooltip,
                          onTap: onFavoriteTap,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacingSm),
            AppText(
              title,
              style: AppTextStyles.bodyRegular,
              maxLines: AppSizes.productTitleMaxLines,
              overflow: .ellipsis,
            ),
            const SizedBox(height: AppSizes.spacingXs),
            AppText(
              localizations.productPrice(formattedPrice),
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.primary,
                fontWeight: .w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductAction extends StatelessWidget {
  const _ProductAction({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: color, size: AppSizes.productActionIconSize),
        tooltip: tooltip,
        visualDensity: .compact,
        constraints: const BoxConstraints.tightFor(
          width: AppSizes.productActionSize,
          height: AppSizes.productActionSize,
        ),
        padding: .zero,
      ),
    );
  }
}
