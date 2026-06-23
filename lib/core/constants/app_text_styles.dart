import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shop/core/constants/app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle get h1 => GoogleFonts.playfairDisplay(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: .bold,
    height: 32 / 24,
  );

  static TextStyle get h2 => GoogleFonts.playfairDisplay(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: .w600,
    height: 24 / 18,
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    color: AppColors.textPrimary,
    fontSize: 15,
    fontWeight: .w500,
    height: 20 / 15,
  );

  static TextStyle get bodyRegular => GoogleFonts.inter(
    color: AppColors.textPrimary,
    fontSize: 13,
    fontWeight: .normal,
    height: 18 / 13,
  );

  static TextStyle get button =>
      bodyRegular.copyWith(color: AppColors.background, fontWeight: .w500);

  static TextStyle get caption => GoogleFonts.inter(
    color: AppColors.textSecondary,
    fontSize: 11,
    fontWeight: .normal,
    height: 14 / 11,
  );
}
