import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/navigation/navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: BottomNavigation.selectedIndex(location),
        onDestinationSelected: (index) => _navigate(context, index),
      ),
    );
  }

  void _navigate(BuildContext context, int index) {
    final route = BottomNavigation.routeForIndex(index);
    if (route != null) {
      context.go(route);
    }
  }
}
