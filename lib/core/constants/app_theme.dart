import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.background,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.h1,
      headlineMedium: AppTextStyles.h2,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyRegular,
      labelSmall: AppTextStyles.caption,
    ),
  );
}
