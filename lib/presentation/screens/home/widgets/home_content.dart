import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/domain/entities/story.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_cubit.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_state.dart';
import 'package:my_shop/presentation/screens/home/widgets/banner_carousel.dart';
import 'package:my_shop/presentation/screens/home/widgets/stories_section.dart';
import 'package:my_shop/presentation/screens/home/widgets/story_viewer.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoader();
        }

        return _LoadedHomeContent(state: state);
      },
    );
  }
}

class _LoadedHomeContent extends StatelessWidget {
  const _LoadedHomeContent({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        _section(
          top: AppSizes.spacingLg,
          child: StoriesSection(
            stories: state.stories,
            onStoryTap: (story) => _openStory(context, story),
          ),
        ),
        _section(top: AppSizes.spacingXl, child: const BannerCarousel()),
        _section(
          top: AppSizes.homePopularSectionTopSpacing,
          bottom: AppSizes.spacingMd,
          child: AppText(localizations.popularTitle, style: AppTextStyles.h2),
        ),
        SliverPadding(
          padding: const .fromLTRB(
            AppSizes.screenPadding,
            0,
            AppSizes.screenPadding,
            AppSizes.spacingXl,
          ),
          sliver: ProductGrid(
            products: state.products,
            onProductTap: (product) {},
            onFavoriteTap: (product) {
              context.read<HomeCubit>().toggleFavorite(product.id);
            },
            onCartTap: (product) {
              context.read<HomeCubit>().toggleCart(product.id);
            },
          ),
        ),
      ],
    );
  }

  SliverPadding _section({
    required Widget child,
    required double top,
    double bottom = 0,
  }) {
    return SliverPadding(
      padding: .fromLTRB(
        AppSizes.screenPadding,
        top,
        AppSizes.screenPadding,
        bottom,
      ),
      sliver: SliverToBoxAdapter(child: child),
    );
  }

  Future<void> _openStory(BuildContext context, Story story) {
    context.read<HomeCubit>().markStoryViewed(story.id);
    return showStoryViewer(context, story: story);
  }
}
