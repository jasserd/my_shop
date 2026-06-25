import 'package:flutter/material.dart';

abstract final class AppSettings {
  static const String emptyString = '';
  static const String localeLanguageCode = 'ru';
  static const String numberFormatLocale = localeLanguageCode;
  static const Locale defaultLocale = Locale(localeLanguageCode);
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const int defaultCartQuantity = 1;
  static const int minimumCartQuantity = 0;
}
