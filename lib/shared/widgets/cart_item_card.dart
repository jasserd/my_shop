import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/cart_item.dart';

import 'app_network_image.dart';
import 'app_text.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.cartItem,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final CartItem cartItem;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final product = cartItem.product;
    final price = NumberFormat.decimalPattern(
      AppSettings.numberFormatLocale,
    ).format(product.price);

    return Container(
      height: AppSizes.cartItemHeight,
      padding: const .all(AppSizes.spacingSm),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: const .all(.circular(AppSizes.radiusMedium)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const .all(.circular(AppSizes.radiusSmall)),
            child: AppNetworkImage(
              imageUrl: product.imageUrl,
              width: AppSizes.cartItemImageSize,
              height: AppSizes.cartItemImageSize,
              fit: .cover,
            ),
          ),
          const SizedBox(width: AppSizes.spacingMd),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                AppText(
                  localizations.byKey(product.titleKey),
                  style: AppTextStyles.bodyRegular,
                  maxLines: AppSizes.productTitleMaxLines,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: AppSizes.spacingXs),
                AppText(
                  localizations.productPrice(price),
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.spacingSm),
          _QuantityControl(
            quantity: cartItem.quantity,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ),
        ],
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  const _QuantityControl({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: .all(.circular(AppSizes.radiusMedium)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          IconButton(
            onPressed: onDecrement,
            tooltip: localizations.decreaseQuantityTooltip,
            icon: const Icon(Icons.remove, color: AppColors.primary),
            visualDensity: .compact,
          ),
          AppText('$quantity', style: AppTextStyles.bodyLarge),
          IconButton(
            onPressed: onIncrement,
            tooltip: localizations.increaseQuantityTooltip,
            icon: const Icon(Icons.add, color: AppColors.primary),
            visualDensity: .compact,
          ),
        ],
      ),
    );
  }
}
