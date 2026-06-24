import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';

import 'app_text.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    super.key,
  });

  final String label;
  final String hint;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        AppText(label),
        const SizedBox(height: AppSizes.spacingSm),
        SizedBox(
          height: AppSizes.inputHeight,
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            cursorColor: AppColors.primary,
            style: AppTextStyles.bodyRegular,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodyRegular.copyWith(
                color: AppColors.textSecondary,
              ),
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const .symmetric(horizontal: AppSizes.spacingLg),
              enabledBorder: const OutlineInputBorder(
                borderRadius: .all(.circular(AppSizes.radiusMedium)),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: .all(.circular(AppSizes.radiusMedium)),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: .all(.circular(AppSizes.radiusMedium)),
                borderSide: BorderSide(color: AppColors.error),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: .all(.circular(AppSizes.radiusMedium)),
                borderSide: BorderSide(color: AppColors.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
