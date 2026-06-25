import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_cubit.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_state.dart';
import 'package:my_shop/presentation/screens/catalog/widgets/category_sort_tags.dart';
import 'package:my_shop/shared/components/components.dart';
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
    final slivers = <Widget>[];
    for (final category in state.categories) {
      slivers.addAll(_categorySlivers(context, category));
    }
    slivers.add(
      const SliverToBoxAdapter(child: SizedBox(height: AppSizes.spacingXl)),
    );

    return CustomScrollView(slivers: slivers);
  }

  List<Widget> _categorySlivers(BuildContext context, Category category) {
    final categoryId = category.id ?? AppSettings.emptyString;
    final categoryState = state.categoryStates[categoryId];
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
            title: localizations.byKey(
              category.titleKey ?? AppSettings.emptyString,
            ),
            isExpanded: isExpanded,
            onTap: () {
              context.read<CatalogCubit>().toggleCategory(categoryId);
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
                context.read<CatalogCubit>().togglePriceSort(categoryId);
              },
              onAlphabetTap: () {
                context.read<CatalogCubit>().toggleAlphabetSort(categoryId);
              },
            ),
          ),
        ),
        _buildCategoryProducts(
          context,
          categoryId: categoryId,
          categoryState: categoryState,
        ),
      ],
    ];
  }

  Widget _buildCategoryProducts(
    BuildContext context, {
    required String categoryId,
    required CategoryState categoryState,
  }) {
    if (categoryState.isLoading) {
      return const SliverToBoxAdapter(
        child: SizedBox(
          height: AppSizes.categoryLoaderHeight,
          child: AppLoader(),
        ),
      );
    }

    return SliverPadding(
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
          context.read<CatalogCubit>().toggleFavorite(categoryId, product);
        },
        onCartTap: (product) {
          context.read<CatalogCubit>().toggleCart(categoryId, product);
        },
      ),
    );
  }
}
