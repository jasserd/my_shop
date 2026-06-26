import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_state.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CategorySortTags extends StatelessWidget {
  const CategorySortTags({required this.activeSort, required this.onPriceTap, required this.onAlphabetTap, super.key});

  final CatalogSortType activeSort;
  final VoidCallback onPriceTap;
  final VoidCallback onAlphabetTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isPriceAscending = activeSort != CatalogSortType.priceDescending;
    final isAlphabetAscending = activeSort != CatalogSortType.alphabetDescending;

    return SizedBox(
      height: AppSizes.sortTagsViewportHeight,
      child: ListView(
        scrollDirection: .horizontal,
        children: [
          _SortTag(
            label: localizations.sortByPrice,
            icon: isPriceAscending ? Icons.arrow_upward : Icons.arrow_downward,
            isSelected: activeSort == CatalogSortType.priceAscending || activeSort == CatalogSortType.priceDescending,
            onTap: onPriceTap,
          ),
          const SizedBox(width: AppSizes.spacingSm),
          _SortTag(
            label: isAlphabetAscending ? localizations.sortAlphabetAscending : localizations.sortAlphabetDescending,
            isSelected:
                activeSort == CatalogSortType.alphabetAscending || activeSort == CatalogSortType.alphabetDescending,
            onTap: onAlphabetTap,
          ),
        ],
      ),
    );
  }
}

class _SortTag extends StatelessWidget {
  const _SortTag({required this.label, required this.isSelected, required this.onTap, this.icon});

  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected ? AppColors.background : AppColors.textPrimary;

    return Material(
      color: isSelected ? AppColors.primary : AppColors.surface,
      borderRadius: const .all(.circular(AppSizes.radiusFull)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const .all(.circular(AppSizes.radiusFull)),
        child: Container(
          height: AppSizes.sortTagHeight,
          alignment: .center,
          padding: const .symmetric(horizontal: AppSizes.spacingLg),
          decoration: _tagDecoration,
          child: Row(
            spacing: AppSizes.spacingXs,
            mainAxisSize: .min,
            children: [
              AppText(label, style: AppTextStyles.bodyRegular(color: foregroundColor)),
              ...switch (icon) {
                final icon? => [AppIcon.small(icon, color: foregroundColor)],
                null => const [],
              },
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration get _tagDecoration {
    return BoxDecoration(
      border: isSelected ? null : Border.all(color: AppColors.border),
      borderRadius: const .all(.circular(AppSizes.radiusFull)),
    );
  }
}
