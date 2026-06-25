import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    super.key,
  });

  final Category category;
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: const .all(.circular(AppSizes.radiusMedium)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const .all(.circular(AppSizes.radiusMedium)),
        child: SizedBox(
          height: AppSizes.categoryCardHeight,
          child: Padding(
            padding: const .symmetric(horizontal: AppSizes.spacingLg),
            child: Row(
              children: [
                Icon(
                  _iconFor(category.icon),
                  color: AppColors.primary,
                  size: AppSizes.categoryCardIconSize,
                ),
                const SizedBox(width: AppSizes.spacingMd),
                Expanded(child: AppText(title, style: AppTextStyles.bodyLarge)),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_down : Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _iconFor(CategoryIcon icon) {
    return switch (icon) {
      CategoryIcon.clothing => Icons.checkroom,
      CategoryIcon.shoes => Icons.hiking,
      CategoryIcon.accessories => Icons.watch,
      CategoryIcon.electronics => Icons.devices,
      CategoryIcon.books => Icons.menu_book,
      CategoryIcon.home => Icons.home,
    };
  }
}
