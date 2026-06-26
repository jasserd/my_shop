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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @catalogTitle.
  ///
  /// In ru, this message translates to:
  /// **'Каталог'**
  String get catalogTitle;

  /// No description provided for @sortByPrice.
  ///
  /// In ru, this message translates to:
  /// **'Цена'**
  String get sortByPrice;

  /// No description provided for @sortAlphabetAscending.
  ///
  /// In ru, this message translates to:
  /// **'А–Я'**
  String get sortAlphabetAscending;

  /// No description provided for @sortAlphabetDescending.
  ///
  /// In ru, this message translates to:
  /// **'Я–А'**
  String get sortAlphabetDescending;

  /// No description provided for @categoryClothing.
  ///
  /// In ru, this message translates to:
  /// **'Одежда'**
  String get categoryClothing;

  /// No description provided for @categoryShoes.
  ///
  /// In ru, this message translates to:
  /// **'Обувь'**
  String get categoryShoes;

  /// No description provided for @categoryAccessories.
  ///
  /// In ru, this message translates to:
  /// **'Аксессуары'**
  String get categoryAccessories;

  /// No description provided for @categoryElectronics.
  ///
  /// In ru, this message translates to:
  /// **'Электроника'**
  String get categoryElectronics;

  /// No description provided for @categoryBooks.
  ///
  /// In ru, this message translates to:
  /// **'Книги'**
  String get categoryBooks;

  /// No description provided for @categoryHome.
  ///
  /// In ru, this message translates to:
  /// **'Дом'**
  String get categoryHome;

  /// No description provided for @catalogLinenShirt.
  ///
  /// In ru, this message translates to:
  /// **'Льняная рубашка'**
  String get catalogLinenShirt;

  /// No description provided for @catalogWoolCoat.
  ///
  /// In ru, this message translates to:
  /// **'Шерстяное пальто'**
  String get catalogWoolCoat;

  /// No description provided for @catalogSilkDress.
  ///
  /// In ru, this message translates to:
  /// **'Шёлковое платье'**
  String get catalogSilkDress;

  /// No description provided for @catalogCottonTrousers.
  ///
  /// In ru, this message translates to:
  /// **'Хлопковые брюки'**
  String get catalogCottonTrousers;

  /// No description provided for @catalogLeatherSneakers.
  ///
  /// In ru, this message translates to:
  /// **'Кожаные кеды'**
  String get catalogLeatherSneakers;

  /// No description provided for @catalogClassicLoafers.
  ///
  /// In ru, this message translates to:
  /// **'Классические лоферы'**
  String get catalogClassicLoafers;

  /// No description provided for @catalogSuedeBoots.
  ///
  /// In ru, this message translates to:
  /// **'Замшевые ботинки'**
  String get catalogSuedeBoots;

  /// No description provided for @catalogMinimalSandals.
  ///
  /// In ru, this message translates to:
  /// **'Минималистичные сандалии'**
  String get catalogMinimalSandals;

  /// No description provided for @catalogLeatherBag.
  ///
  /// In ru, this message translates to:
  /// **'Кожаная сумка'**
  String get catalogLeatherBag;

  /// No description provided for @catalogGoldEarrings.
  ///
  /// In ru, this message translates to:
  /// **'Золотистые серьги'**
  String get catalogGoldEarrings;

  /// No description provided for @catalogSilkScarf.
  ///
  /// In ru, this message translates to:
  /// **'Шёлковый шарф'**
  String get catalogSilkScarf;

  /// No description provided for @catalogClassicWatch.
  ///
  /// In ru, this message translates to:
  /// **'Классические часы'**
  String get catalogClassicWatch;

  /// No description provided for @catalogWirelessHeadphones.
  ///
  /// In ru, this message translates to:
  /// **'Беспроводные наушники'**
  String get catalogWirelessHeadphones;

  /// No description provided for @catalogSmartSpeaker.
  ///
  /// In ru, this message translates to:
  /// **'Умная колонка'**
  String get catalogSmartSpeaker;

  /// No description provided for @catalogCompactCamera.
  ///
  /// In ru, this message translates to:
  /// **'Компактная камера'**
  String get catalogCompactCamera;

  /// No description provided for @catalogPortableCharger.
  ///
  /// In ru, this message translates to:
  /// **'Портативный аккумулятор'**
  String get catalogPortableCharger;

  /// No description provided for @catalogDesignBook.
  ///
  /// In ru, this message translates to:
  /// **'Книга о дизайне'**
  String get catalogDesignBook;

  /// No description provided for @catalogArchitectureAlbum.
  ///
  /// In ru, this message translates to:
  /// **'Альбом по архитектуре'**
  String get catalogArchitectureAlbum;

  /// No description provided for @catalogArtHistory.
  ///
  /// In ru, this message translates to:
  /// **'История искусства'**
  String get catalogArtHistory;

  /// No description provided for @catalogModernInteriors.
  ///
  /// In ru, this message translates to:
  /// **'Современные интерьеры'**
  String get catalogModernInteriors;

  /// No description provided for @catalogCeramicVase.
  ///
  /// In ru, this message translates to:
  /// **'Керамическая ваза'**
  String get catalogCeramicVase;

  /// No description provided for @catalogAmberCandles.
  ///
  /// In ru, this message translates to:
  /// **'Набор свечей Amber'**
  String get catalogAmberCandles;

  /// No description provided for @catalogGeometryPoster.
  ///
  /// In ru, this message translates to:
  /// **'Постер Geometrical Harmony'**
  String get catalogGeometryPoster;

  /// No description provided for @catalogJuteBasket.
  ///
  /// In ru, this message translates to:
  /// **'Корзина из джута'**
  String get catalogJuteBasket;

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

  /// No description provided for @cartTitle.
  ///
  /// In ru, this message translates to:
  /// **'Корзина'**
  String get cartTitle;

  /// No description provided for @emptyCartTitle.
  ///
  /// In ru, this message translates to:
  /// **'Корзина пуста'**
  String get emptyCartTitle;

  /// No description provided for @deliveryAddressTitle.
  ///
  /// In ru, this message translates to:
  /// **'Адрес доставки'**
  String get deliveryAddressTitle;

  /// No description provided for @cityLabel.
  ///
  /// In ru, this message translates to:
  /// **'Город *'**
  String get cityLabel;

  /// No description provided for @cityHint.
  ///
  /// In ru, this message translates to:
  /// **'Москва'**
  String get cityHint;

  /// No description provided for @streetLabel.
  ///
  /// In ru, this message translates to:
  /// **'Улица *'**
  String get streetLabel;

  /// No description provided for @streetHint.
  ///
  /// In ru, this message translates to:
  /// **'Никольская'**
  String get streetHint;

  /// No description provided for @houseLabel.
  ///
  /// In ru, this message translates to:
  /// **'Дом *'**
  String get houseLabel;

  /// No description provided for @houseHint.
  ///
  /// In ru, this message translates to:
  /// **'10'**
  String get houseHint;

  /// No description provided for @apartmentLabel.
  ///
  /// In ru, this message translates to:
  /// **'Квартира *'**
  String get apartmentLabel;

  /// No description provided for @apartmentHint.
  ///
  /// In ru, this message translates to:
  /// **'42'**
  String get apartmentHint;

  /// No description provided for @postalCodeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Индекс'**
  String get postalCodeLabel;

  /// No description provided for @postalCodeHint.
  ///
  /// In ru, this message translates to:
  /// **'101000'**
  String get postalCodeHint;

  /// No description provided for @totalPaymentLabel.
  ///
  /// In ru, this message translates to:
  /// **'Итого к оплате'**
  String get totalPaymentLabel;

  /// No description provided for @checkoutButton.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к оплате'**
  String get checkoutButton;

  /// No description provided for @increaseQuantityTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Увеличить количество'**
  String get increaseQuantityTooltip;

  /// No description provided for @decreaseQuantityTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Уменьшить количество'**
  String get decreaseQuantityTooltip;

  /// No description provided for @paymentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Оплата'**
  String get paymentTitle;

  /// No description provided for @paymentSuccessTitle.
  ///
  /// In ru, this message translates to:
  /// **'Оплата прошла успешно!'**
  String get paymentSuccessTitle;

  /// No description provided for @paymentSuccessDescription.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо за заказ! Ваш заказ принят в обработку. Ожидайте доставку в ближайшее время.'**
  String get paymentSuccessDescription;

  /// No description provided for @paymentFailureTitle.
  ///
  /// In ru, this message translates to:
  /// **'Оплата не прошла'**
  String get paymentFailureTitle;

  /// No description provided for @paymentFailureDescription.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось завершить оплату. Попробуйте ещё раз или выберите другой способ оплаты.'**
  String get paymentFailureDescription;

  /// No description provided for @paymentOrderSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Оплата заказа в MyShop'**
  String get paymentOrderSubtitle;

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

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

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
