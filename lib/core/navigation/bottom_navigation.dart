import 'app_routes.dart';

abstract final class BottomNavigation {
  static int selectedIndex(String location) {
    return switch (location) {
      AppRoutes.home => 0,
      _ => 0,
    };
  }

  static String? routeForIndex(int index) {
    return switch (index) {
      0 => AppRoutes.home,
      _ => null,
    };
  }
}
