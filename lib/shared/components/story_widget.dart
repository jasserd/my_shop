import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/story.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    required this.story,
    required this.title,
    required this.onTap,
    super.key,
  });

  final Story story;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.storyItemWidth,
      child: InkWell(
        onTap: onTap,
        borderRadius: const .all(.circular(AppSizes.radiusMedium)),
        child: Column(
          spacing: AppSizes.spacingXs,
          children: [
            Container(
              width: AppSizes.storyImageSize + AppSizes.storyRingSizeOffset,
              height: AppSizes.storyImageSize + AppSizes.storyRingSizeOffset,
              padding: const .all(AppSizes.storyRingPadding),
              decoration: _storyDecoration,
              child: ClipOval(
                child: AppNetworkImage(
                  imageUrl: story.imageUrl ?? AppSettings.emptyString,
                  fit: .cover,
                ),
              ),
            ),
            AppText(
              title,
              style: AppTextStyles.caption(color: AppColors.textPrimary),
              maxLines: AppSizes.storyTitleMaxLines,
              overflow: .ellipsis,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _storyDecoration {
    return BoxDecoration(
      shape: .circle,
      border: Border.all(
        color: story.isViewed == true ? AppColors.border : AppColors.primary,
        width: story.isViewed == true
            ? AppSizes.borderThin
            : AppSizes.borderRegular,
      ),
    );
  }
}
