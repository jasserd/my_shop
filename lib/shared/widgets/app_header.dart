import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';

import 'app_text.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    required this.title,
    this.actionIcon,
    this.actionTooltip,
    this.onActionPressed,
    super.key,
  });

  final String title;
  final IconData? actionIcon;
  final String? actionTooltip;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        SizedBox(
          height: AppSizes.headerHeight,
          child: Padding(
            padding: const .symmetric(horizontal: AppSizes.screenPadding),
            child: Row(
              children: [
                AppText(
                  title,
                  style: AppTextStyles.h1.copyWith(color: AppColors.primary),
                ),
                const Spacer(),
                if (actionIcon case final icon?)
                  IconButton(
                    onPressed: onActionPressed,
                    tooltip: actionTooltip,
                    icon: Icon(
                      icon,
                      color: AppColors.textPrimary,
                      size: AppSizes.headerActionIconSize,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const Divider(
          height: AppSizes.dividerThickness,
          color: AppColors.border,
        ),
      ],
    );
  }
}
