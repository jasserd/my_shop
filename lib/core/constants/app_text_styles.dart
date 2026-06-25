import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shop/core/constants/app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle h1({Color color = AppColors.textPrimary}) =>
      GoogleFonts.playfairDisplay(
        color: color,
        fontSize: 24,
        fontWeight: .bold,
        height: 32 / 24,
      );

  static TextStyle h2({Color color = AppColors.textPrimary}) =>
      GoogleFonts.playfairDisplay(
        color: color,
        fontSize: 18,
        fontWeight: .w600,
        height: 24 / 18,
      );

  static TextStyle bodyLarge({Color color = AppColors.textPrimary}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 15,
        fontWeight: .w500,
        height: 20 / 15,
      );

  static TextStyle bodyRegular({Color color = AppColors.textPrimary}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 13,
        fontWeight: .normal,
        height: 18 / 13,
      );

  static TextStyle button({Color color = AppColors.background}) =>
      bodyRegular(color: color).copyWith(fontWeight: .w500);

  static TextStyle caption({Color color = AppColors.textSecondary}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 11,
        fontWeight: .normal,
        height: 14 / 11,
      );
}
