import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_cubit.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_state.dart';
import 'package:my_shop/presentation/screens/catalog/widgets/category_card.dart';
import 'package:my_shop/presentation/screens/catalog/widgets/category_sort_tags.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CatalogContent extends StatelessWidget {
  const CatalogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoader();
        }

        return _CategoryList(state: state);
      },
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.state});

  final CatalogState state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (final category in state.categories)
          ..._categorySlivers(context, category),
        const SliverToBoxAdapter(child: SizedBox(height: AppSizes.spacingXl)),
      ],
    );
  }

  List<Widget> _categorySlivers(BuildContext context, Category category) {
    final categoryState = state.categoryStates[category.id];
    final isExpanded = categoryState != null;
    final localizations = AppLocalizations.of(context);

    return [
      SliverPadding(
        padding: const .fromLTRB(
          AppSizes.screenPadding,
          AppSizes.spacingSm,
          AppSizes.screenPadding,
          0,
        ),
        sliver: SliverToBoxAdapter(
          child: CategoryCard(
            category: category,
            title: localizations.byKey(category.titleKey),
            isExpanded: isExpanded,
            onTap: () {
              context.read<CatalogCubit>().toggleCategory(category.id);
            },
          ),
        ),
      ),
      if (categoryState != null) ...[
        SliverPadding(
          padding: const .fromLTRB(
            AppSizes.screenPadding,
            AppSizes.spacingMd,
            AppSizes.screenPadding,
            0,
          ),
          sliver: SliverToBoxAdapter(
            child: CategorySortTags(
              activeSort: categoryState.sortType,
              onPriceTap: () {
                context.read<CatalogCubit>().togglePriceSort(category.id);
              },
              onAlphabetTap: () {
                context.read<CatalogCubit>().toggleAlphabetSort(category.id);
              },
            ),
          ),
        ),
        if (categoryState.isLoading)
          const SliverToBoxAdapter(
            child: SizedBox(height: 180, child: AppLoader()),
          )
        else
          SliverPadding(
            padding: const .fromLTRB(
              AppSizes.screenPadding,
              AppSizes.spacingMd,
              AppSizes.screenPadding,
              AppSizes.spacingLg,
            ),
            sliver: ProductGrid(
              products: categoryState.products,
              onProductTap: (product) {},
              onFavoriteTap: (product) {
                context.read<CatalogCubit>().toggleFavorite(
                  category.id,
                  product,
                );
              },
              onCartTap: (product) {
                context.read<CatalogCubit>().toggleCart(category.id, product);
              },
            ),
          ),
      ],
    ];
  }
}
