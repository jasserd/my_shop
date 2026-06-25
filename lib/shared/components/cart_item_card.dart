import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

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
    final product = cartItem.product ?? const Product();
    final price = NumberFormat.decimalPattern(
      AppSettings.numberFormatLocale,
    ).format(product.price ?? 0);

    return Container(
      height: AppSizes.cartItemHeight,
      padding: const .all(AppSizes.spacingSm),
      decoration: _cardDecoration,
      child: Row(
        spacing: AppSizes.spacingMd,
        children: [
          ClipRRect(
            borderRadius: const .all(.circular(AppSizes.radiusSmall)),
            child: AppNetworkImage(
              imageUrl: product.imageUrl ?? AppSettings.emptyString,
              width: AppSizes.cartItemImageSize,
              height: AppSizes.cartItemImageSize,
              fit: .cover,
            ),
          ),
          Expanded(
            child: Column(
              spacing: AppSizes.spacingXs,
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                AppText(
                  localizations.byKey(
                    product.titleKey ?? AppSettings.emptyString,
                  ),
                  style: AppTextStyles.bodyRegular(),
                  maxLines: AppSizes.productTitleMaxLines,
                  overflow: .ellipsis,
                ),
                AppText(
                  localizations.productPrice(price),
                  style: AppTextStyles.bodyLarge(color: AppColors.primary),
                ),
              ],
            ),
          ),
          _QuantityControl(
            quantity: cartItem.quantity ?? 0,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ),
        ],
      ),
    );
  }

  BoxDecoration get _cardDecoration {
    return BoxDecoration(
      color: AppColors.background,
      border: Border.all(color: AppColors.border),
      borderRadius: const .all(.circular(AppSizes.radiusMedium)),
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
      decoration: _decoration,
      child: Row(
        mainAxisSize: .min,
        children: [
          IconButton(
            onPressed: onDecrement,
            tooltip: localizations.decreaseQuantityTooltip,
            icon: const AppIcon.small(Icons.remove, color: AppColors.primary),
            visualDensity: .compact,
          ),
          AppText('$quantity', style: AppTextStyles.bodyLarge()),
          IconButton(
            onPressed: onIncrement,
            tooltip: localizations.increaseQuantityTooltip,
            icon: const AppIcon.small(Icons.add, color: AppColors.primary),
            visualDensity: .compact,
          ),
        ],
      ),
    );
  }

  BoxDecoration get _decoration {
    return const BoxDecoration(
      color: AppColors.surface,
      borderRadius: .all(.circular(AppSizes.radiusMedium)),
    );
  }
}
