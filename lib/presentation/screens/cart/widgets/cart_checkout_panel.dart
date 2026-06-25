import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CartCheckoutPanel extends StatelessWidget {
  const CartCheckoutPanel({
    required this.totalPrice,
    required this.isCheckoutEnabled,
    required this.onCheckout,
    super.key,
  });

  final int totalPrice;
  final bool isCheckoutEnabled;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final price = NumberFormat.decimalPattern(
      AppSettings.numberFormatLocale,
    ).format(totalPrice);

    return Container(
      padding: const .all(AppSizes.spacingLg),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Row(
            children: [
              Expanded(
                child: AppText(
                  localizations.totalPaymentLabel,
                  style: AppTextStyles.bodyLarge,
                ),
              ),
              AppText(
                localizations.productPrice(price),
                style: AppTextStyles.h2.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spacingMd),
          AppButton(
            text: localizations.checkoutButton,
            onPressed: isCheckoutEnabled ? onCheckout : null,
          ),
        ],
      ),
    );
  }
}
