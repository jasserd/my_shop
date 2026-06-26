import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/presentation/screens/payment/widgets/payment_result_content.dart';
import 'package:my_shop/shared/components/components.dart';

class PaymentFailureScreen extends StatelessWidget {
  const PaymentFailureScreen({super.key});

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
            child: PaymentResultContent(
              icon: Icons.close,
              iconColor: AppColors.error,
              title: localizations.paymentFailureTitle,
              description: localizations.paymentFailureDescription,
              onGoHome: () => context.go(AppRoutes.home),
            ),
          ),
        ],
      ),
    );
  }
}
