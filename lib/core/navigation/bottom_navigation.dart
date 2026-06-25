import 'app_routes.dart';
import 'bottom_navigation_constants.dart';

abstract final class BottomNavigation {
  static int selectedIndex(String location) {
    return switch (location) {
      AppRoutes.home => BottomNavigationIndexes.home,
      AppRoutes.catalog => BottomNavigationIndexes.catalog,
      AppRoutes.favorites => BottomNavigationIndexes.favorites,
      AppRoutes.cart || AppRoutes.payment => BottomNavigationIndexes.cart,
      _ => BottomNavigationIndexes.home,
    };
  }

  static String? routeForIndex(int index) {
    return switch (index) {
      BottomNavigationIndexes.home => AppRoutes.home,
      BottomNavigationIndexes.catalog => AppRoutes.catalog,
      BottomNavigationIndexes.favorites => AppRoutes.favorites,
      BottomNavigationIndexes.cart => AppRoutes.cart,
      _ => null,
    };
  }
}
