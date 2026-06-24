import 'app_routes.dart';

abstract final class BottomNavigation {
  static int selectedIndex(String location) {
    return switch (location) {
      AppRoutes.home => 0,
      AppRoutes.catalog => 1,
      AppRoutes.favorites => 2,
      AppRoutes.cart || AppRoutes.payment => 3,
      _ => 0,
    };
  }

  static String? routeForIndex(int index) {
    return switch (index) {
      0 => AppRoutes.home,
      1 => AppRoutes.catalog,
      2 => AppRoutes.favorites,
      3 => AppRoutes.cart,
      _ => null,
    };
  }
}
