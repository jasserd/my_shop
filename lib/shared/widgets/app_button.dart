import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/shared/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.text, required this.onPressed, this.isLoading = false, super.key});

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
        style: _buttonStyle,
        child: isLoading
            ? const SizedBox.square(
                dimension: AppSizes.buttonLoaderSize,
                child: CircularProgressIndicator(color: AppColors.background, strokeWidth: AppSizes.loaderStrokeWidth),
              )
            : AppText(
                text,
                style: AppTextStyles.button(color: onPressed == null ? AppColors.textSecondary : AppColors.background),
              ),
      ),
    );
  }

  ButtonStyle get _buttonStyle {
    return ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.resolveWith(_backgroundColor),
      foregroundColor: WidgetStateProperty.resolveWith(_foregroundColor),
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: .all(.circular(AppSizes.radiusMedium)))),
      textStyle: WidgetStatePropertyAll(AppTextStyles.button()),
    );
  }

  Color _backgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.border;
    }
    if (states.contains(WidgetState.pressed)) {
      return AppColors.primaryPressed;
    }
    return AppColors.primary;
  }

  Color _foregroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.textSecondary;
    }
    return AppColors.background;
  }
}
