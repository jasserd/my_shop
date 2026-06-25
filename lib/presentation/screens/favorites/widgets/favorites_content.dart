import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_cubit.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_state.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoader();
        }
        if (state.favorites.isEmpty) {
          return const _EmptyFavorites();
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const .all(AppSizes.screenPadding),
              sliver: ProductGrid(
                products: state.favorites,
                onProductTap: (product) {},
                onFavoriteTap: (product) {
                  context.read<FavoritesCubit>().removeFromFavorites(product);
                },
                onCartTap: (product) {
                  context.read<FavoritesCubit>().toggleCart(product);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const .all(AppSizes.screenPadding),
        child: Column(
          mainAxisSize: .min,
          children: [
            const Icon(
              Icons.favorite_border,
              size: AppSizes.emptyStateIconSize,
              color: AppColors.border,
            ),
            const SizedBox(height: AppSizes.spacingXl),
            AppText(
              localizations.emptyFavoritesTitle,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: AppSizes.spacingSm),
            AppText(
              localizations.emptyFavoritesDescription,
              style: AppTextStyles.bodyRegular.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: .center,
            ),
            const SizedBox(height: AppSizes.spacingXl),
            AppButton(
              text: localizations.goShoppingButton,
              onPressed: () => context.go(AppRoutes.home),
            ),
          ],
        ),
      ),
    );
  }
}
