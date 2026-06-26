import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/navigation/navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _navigate,
      ),
    );
  }

  void _navigate(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex || index == NavigationConstants.cartBranchIndex,
    );
  }
}
