import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class PaymentResultContent extends StatelessWidget {
  const PaymentResultContent({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.onGoHome,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final VoidCallback onGoHome;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const .all(AppSizes.screenPadding),
        child: Column(
          spacing: AppSizes.spacingXxl,
          mainAxisSize: .min,
          children: [
            Container(
              width: AppSizes.paymentSuccessOuterSize,
              height: AppSizes.paymentSuccessOuterSize,
              alignment: .center,
              decoration: _resultDecoration,
              child: CircleAvatar(
                radius: AppSizes.paymentSuccessIconRadius,
                backgroundColor: iconColor,
                child: AppIcon.small(icon, color: AppColors.background),
              ),
            ),
            Column(
              spacing: AppSizes.spacingSm,
              children: [
                AppText(title, style: AppTextStyles.h1(), textAlign: .center),
                AppText(
                  description,
                  style: AppTextStyles.bodyRegular(color: AppColors.textSecondary),
                  textAlign: .center,
                ),
              ],
            ),
            AppButton(text: localizations.goShoppingButton, onPressed: onGoHome),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _resultDecoration {
    return BoxDecoration(
      shape: .circle,
      border: Border.all(
        color: iconColor.withValues(alpha: AppOpacities.successBorder),
        width: AppSizes.borderRegular,
      ),
    );
  }
}
