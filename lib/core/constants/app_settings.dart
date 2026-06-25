import 'package:flutter/material.dart';

abstract final class AppSettings {
  static const emptyString = '';
  static const localeLanguageCode = 'ru';
  static const numberFormatLocale = localeLanguageCode;
  static const defaultLocale = Locale(localeLanguageCode);
  static const shortAnimationDuration = Duration(milliseconds: 200);
  static const defaultCartQuantity = 1;
  static const minimumCartQuantity = 0;
}
