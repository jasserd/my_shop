import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/app_localizations.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final destinations = [
      (icon: Icons.home, label: localizations.homeNavigation),
      (icon: Icons.search, label: localizations.searchNavigation),
      (icon: Icons.favorite_border, label: localizations.wishlistNavigation),
      (icon: Icons.shopping_cart, label: localizations.ordersNavigation),
    ];

    return Container(
      height: AppSizes.bottomNavigationHeight,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: List.generate(destinations.length, (index) {
            final destination = destinations[index];
            return _NavigationItem(
              icon: destination.icon,
              label: destination.label,
              isSelected: selectedIndex == index,
              onTap: () => onDestinationSelected(index),
            );
          }),
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: const .all(.circular(AppSizes.radiusLarge)),
      child: Container(
        padding: const .symmetric(
          horizontal: AppSizes.spacingMd,
          vertical: AppSizes.spacingXs,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.border : AppColors.surface,
          borderRadius: const .all(.circular(AppSizes.radiusLarge)),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(icon, color: color, size: 24),
            AppText(label, style: AppTextStyles.caption.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
