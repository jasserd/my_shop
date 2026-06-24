import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AppHeader(
            title: localizations.paymentTitle,
            actionIcon: Icons.person,
            actionTooltip: localizations.profileTooltip,
            onActionPressed: () {},
          ),
          Expanded(
            child: _PaymentSuccessContent(
              onGoHome: () => context.go(AppRoutes.home),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentSuccessContent extends StatelessWidget {
  const _PaymentSuccessContent({required this.onGoHome});

  final VoidCallback onGoHome;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const .all(AppSizes.screenPadding),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 96,
              height: 96,
              alignment: .center,
              decoration: BoxDecoration(
                shape: .circle,
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.25),
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.success,
                child: Icon(Icons.check, color: AppColors.background, size: 32),
              ),
            ),
            const SizedBox(height: AppSizes.spacingXxl),
            AppText(
              localizations.paymentSuccessTitle,
              style: AppTextStyles.h1,
              textAlign: .center,
            ),
            const SizedBox(height: AppSizes.spacingSm),
            AppText(
              localizations.paymentSuccessDescription,
              style: AppTextStyles.bodyRegular.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: 40),
            AppButton(
              text: localizations.goShoppingButton,
              onPressed: onGoHome,
            ),
          ],
        ),
      ),
    );
  }
}
