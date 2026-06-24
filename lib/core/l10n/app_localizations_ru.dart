// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'MyShop';

  @override
  String get loginLabel => 'Логин';

  @override
  String get loginHint => 'example@myshop.ru';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get passwordHint => 'Введите пароль';

  @override
  String get signInButton => 'Войти';

  @override
  String get popularTitle => 'Популярное';

  @override
  String get storyNew => 'Новинки';

  @override
  String get storyDecor => 'Декор';

  @override
  String get storyAccessories => 'Аксессуары';

  @override
  String get storyCare => 'Уход';

  @override
  String get productLamp => 'Керамическая лампа «Эфир»';

  @override
  String get productCandle => 'Ароматическая свеча «Сандал и Кожа»';

  @override
  String get productLinen =>
      'Комплект постельного белья из органического хлопка';

  @override
  String get productBowl => 'Ваза для фруктов из массива ореха';

  @override
  String get productVase => 'Керамическая ваза ручной работы';

  @override
  String get productChair => 'Кресло из натурального дерева';

  @override
  String get productPerfume => 'Парфюмированная вода Amber';

  @override
  String get productDecor => 'Декоративный набор для гостиной';

  @override
  String get bannerCollectionTitle => 'Сезонная\nколлекция';

  @override
  String get bannerCollectionSubtitle =>
      'Скидки до 30% на\nизбранные товары\ndекора';

  @override
  String get bannerComfortTitle => 'Тёплый\nинтерьер';

  @override
  String get bannerComfortSubtitle => 'Новая коллекция для\nуютного дома';

  @override
  String get bannerDetailsTitle => 'Важные\nдетали';

  @override
  String get bannerDetailsSubtitle => 'Акценты, которые\nсоздают настроение';

  @override
  String get homeNavigation => 'Home';

  @override
  String get searchNavigation => 'Search';

  @override
  String get wishlistNavigation => 'Wishlist';

  @override
  String get ordersNavigation => 'Orders';

  @override
  String get profileTooltip => 'Профиль';

  @override
  String get addToFavoritesTooltip => 'Добавить в избранное';

  @override
  String get removeFromFavoritesTooltip => 'Удалить из избранного';

  @override
  String get addToCartTooltip => 'Добавить в корзину';

  @override
  String get removeFromCartTooltip => 'Удалить из корзины';

  @override
  String get closeStoryTooltip => 'Закрыть историю';

  @override
  String productPrice(String price) {
    return '$price ₽';
  }
}
