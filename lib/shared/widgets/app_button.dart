import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.border;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryPressed;
            }
            return AppColors.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.textSecondary;
            }
            return AppColors.background;
          }),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: .all(.circular(AppSizes.radiusMedium)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(AppTextStyles.button),
        ),
        child: isLoading
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: AppColors.background,
                  strokeWidth: 2,
                ),
              )
            : AppText(
                text,
                style: AppTextStyles.button.copyWith(
                  color: onPressed == null
                      ? AppColors.textSecondary
                      : AppColors.background,
                ),
              ),
      ),
    );
  }
}
