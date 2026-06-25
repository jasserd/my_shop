import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _controller = PageController();
  int _activeIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banners = _banners(context);

    return Column(
      children: [
        SizedBox(
          height: AppSizes.bannerHeight,
          child: PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() => _activeIndex = index);
            },
            itemBuilder: (context, index) {
              return _BannerItem(banner: banners[index]);
            },
          ),
        ),
        const SizedBox(height: AppSizes.spacingSm),
        _PageIndicator(itemCount: banners.length, activeIndex: _activeIndex),
      ],
    );
  }

  List<({String imageUrl, String title, String subtitle})> _banners(
    BuildContext context,
  ) {
    final localizations = AppLocalizations.of(context);

    return [
      (
        imageUrl: RemoteImages.bannerCollection,
        title: localizations.bannerCollectionTitle,
        subtitle: localizations.bannerCollectionSubtitle,
      ),
      (
        imageUrl: RemoteImages.bannerComfort,
        title: localizations.bannerComfortTitle,
        subtitle: localizations.bannerComfortSubtitle,
      ),
      (
        imageUrl: RemoteImages.bannerDetails,
        title: localizations.bannerDetailsTitle,
        subtitle: localizations.bannerDetailsSubtitle,
      ),
    ];
  }
}

class _BannerItem extends StatelessWidget {
  const _BannerItem({required this.banner});

  final ({String imageUrl, String title, String subtitle}) banner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const .all(.circular(AppSizes.radiusLarge)),
      child: Stack(
        fit: .expand,
        children: [
          AppNetworkImage(imageUrl: banner.imageUrl, fit: .cover),
          ColoredBox(
            color: AppColors.surface.withValues(
              alpha: AppOpacities.bannerOverlay,
            ),
          ),
          Padding(
            padding: const .all(AppSizes.spacingXl),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      AppText(
                        banner.title,
                        style: AppTextStyles.h2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingSm),
                      AppText(
                        banner.subtitle,
                        style: AppTextStyles.bodyRegular.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.itemCount, required this.activeIndex});

  final int itemCount;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: AppSettings.shortAnimationDuration,
          width: index == activeIndex
              ? AppSizes.bannerIndicatorActiveWidth
              : AppSizes.bannerIndicatorInactiveWidth,
          height: AppSizes.bannerIndicatorHeight,
          margin: const .symmetric(horizontal: AppSizes.bannerIndicatorSpacing),
          decoration: BoxDecoration(
            color: index == activeIndex ? AppColors.primary : AppColors.border,
            borderRadius: const .all(.circular(AppSizes.radiusFull)),
          ),
        ),
      ),
    );
  }
}
