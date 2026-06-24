import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'MyShop'**
  String get appName;

  /// No description provided for @loginLabel.
  ///
  /// In ru, this message translates to:
  /// **'Логин'**
  String get loginLabel;

  /// No description provided for @loginHint.
  ///
  /// In ru, this message translates to:
  /// **'example@myshop.ru'**
  String get loginHint;

  /// No description provided for @passwordLabel.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль'**
  String get passwordHint;

  /// No description provided for @signInButton.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get signInButton;

  /// No description provided for @popularTitle.
  ///
  /// In ru, this message translates to:
  /// **'Популярное'**
  String get popularTitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Избранное'**
  String get favoritesTitle;

  /// No description provided for @emptyFavoritesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Список пуст'**
  String get emptyFavoritesTitle;

  /// No description provided for @emptyFavoritesDescription.
  ///
  /// In ru, this message translates to:
  /// **'Сохраняйте товары, которые вам понравились, чтобы вернуться к ним позже.'**
  String get emptyFavoritesDescription;

  /// No description provided for @goShoppingButton.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к покупкам'**
  String get goShoppingButton;

  /// No description provided for @storyNew.
  ///
  /// In ru, this message translates to:
  /// **'Новинки'**
  String get storyNew;

  /// No description provided for @storyDecor.
  ///
  /// In ru, this message translates to:
  /// **'Декор'**
  String get storyDecor;

  /// No description provided for @storyAccessories.
  ///
  /// In ru, this message translates to:
  /// **'Аксессуары'**
  String get storyAccessories;

  /// No description provided for @storyCare.
  ///
  /// In ru, this message translates to:
  /// **'Уход'**
  String get storyCare;

  /// No description provided for @productLamp.
  ///
  /// In ru, this message translates to:
  /// **'Керамическая лампа «Эфир»'**
  String get productLamp;

  /// No description provided for @productCandle.
  ///
  /// In ru, this message translates to:
  /// **'Ароматическая свеча «Сандал и Кожа»'**
  String get productCandle;

  /// No description provided for @productLinen.
  ///
  /// In ru, this message translates to:
  /// **'Комплект постельного белья из органического хлопка'**
  String get productLinen;

  /// No description provided for @productBowl.
  ///
  /// In ru, this message translates to:
  /// **'Ваза для фруктов из массива ореха'**
  String get productBowl;

  /// No description provided for @productVase.
  ///
  /// In ru, this message translates to:
  /// **'Керамическая ваза ручной работы'**
  String get productVase;

  /// No description provided for @productChair.
  ///
  /// In ru, this message translates to:
  /// **'Кресло из натурального дерева'**
  String get productChair;

  /// No description provided for @productPerfume.
  ///
  /// In ru, this message translates to:
  /// **'Парфюмированная вода Amber'**
  String get productPerfume;

  /// No description provided for @productDecor.
  ///
  /// In ru, this message translates to:
  /// **'Декоративный набор для гостиной'**
  String get productDecor;

  /// No description provided for @bannerCollectionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сезонная\nколлекция'**
  String get bannerCollectionTitle;

  /// No description provided for @bannerCollectionSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Скидки до 30% на\nизбранные товары\ndекора'**
  String get bannerCollectionSubtitle;

  /// No description provided for @bannerComfortTitle.
  ///
  /// In ru, this message translates to:
  /// **'Тёплый\nинтерьер'**
  String get bannerComfortTitle;

  /// No description provided for @bannerComfortSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Новая коллекция для\nуютного дома'**
  String get bannerComfortSubtitle;

  /// No description provided for @bannerDetailsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Важные\nдетали'**
  String get bannerDetailsTitle;

  /// No description provided for @bannerDetailsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Акценты, которые\nсоздают настроение'**
  String get bannerDetailsSubtitle;

  /// No description provided for @homeNavigation.
  ///
  /// In ru, this message translates to:
  /// **'Home'**
  String get homeNavigation;

  /// No description provided for @searchNavigation.
  ///
  /// In ru, this message translates to:
  /// **'Search'**
  String get searchNavigation;

  /// No description provided for @wishlistNavigation.
  ///
  /// In ru, this message translates to:
  /// **'Wishlist'**
  String get wishlistNavigation;

  /// No description provided for @ordersNavigation.
  ///
  /// In ru, this message translates to:
  /// **'Orders'**
  String get ordersNavigation;

  /// No description provided for @profileTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileTooltip;

  /// No description provided for @addToFavoritesTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Добавить в избранное'**
  String get addToFavoritesTooltip;

  /// No description provided for @removeFromFavoritesTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Удалить из избранного'**
  String get removeFromFavoritesTooltip;

  /// No description provided for @addToCartTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Добавить в корзину'**
  String get addToCartTooltip;

  /// No description provided for @removeFromCartTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Удалить из корзины'**
  String get removeFromCartTooltip;

  /// No description provided for @closeStoryTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть историю'**
  String get closeStoryTooltip;

  /// No description provided for @productPrice.
  ///
  /// In ru, this message translates to:
  /// **'{price} ₽'**
  String productPrice(String price);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
