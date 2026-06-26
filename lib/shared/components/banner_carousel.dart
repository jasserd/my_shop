import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/promo_banner.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({required this.banners, super.key});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final controller = PageController();
  var activeIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.spacingSm,
      children: [
        SizedBox(
          height: AppSizes.bannerHeight,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() => activeIndex = index);
            },
            itemBuilder: (context, index) {
              return _BannerItem(banner: widget.banners[index]);
            },
          ),
        ),
        _PageIndicator(itemCount: widget.banners.length, activeIndex: activeIndex),
      ],
    );
  }
}

class _BannerItem extends StatelessWidget {
  const _BannerItem({required this.banner});

  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ClipRRect(
      borderRadius: const .all(.circular(AppSizes.radiusLarge)),
      child: Stack(
        fit: .expand,
        children: [
          AppNetworkImage(imageUrl: banner.imageUrl ?? AppSettings.emptyString, fit: .cover),
          ColoredBox(color: AppColors.surface.withValues(alpha: AppOpacities.bannerOverlay)),
          Padding(
            padding: const .all(AppSizes.spacingXl),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: AppSizes.spacingSm,
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      AppText(
                        localizations.byKey(banner.titleKey ?? AppSettings.emptyString),
                        style: AppTextStyles.h2(color: AppColors.primary),
                      ),
                      AppText(
                        localizations.byKey(banner.subtitleKey ?? AppSettings.emptyString),
                        style: AppTextStyles.bodyRegular(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                const AppIcon.small(Icons.arrow_forward, color: AppColors.primary),
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
          width: index == activeIndex ? AppSizes.bannerIndicatorActiveWidth : AppSizes.bannerIndicatorInactiveWidth,
          height: AppSizes.bannerIndicatorHeight,
          margin: const .symmetric(horizontal: AppSizes.bannerIndicatorSpacing),
          decoration: _indicatorDecoration(index),
        ),
      ),
    );
  }

  BoxDecoration _indicatorDecoration(int index) {
    return BoxDecoration(
      color: index == activeIndex ? AppColors.primary : AppColors.border,
      borderRadius: const .all(.circular(AppSizes.radiusFull)),
    );
  }
}
