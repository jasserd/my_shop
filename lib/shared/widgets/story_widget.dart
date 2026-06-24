import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/story.dart';

import 'app_network_image.dart';
import 'app_text.dart';

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
      width: 76,
      child: InkWell(
        onTap: onTap,
        borderRadius: const .all(.circular(AppSizes.radiusMedium)),
        child: Column(
          children: [
            Container(
              width: AppSizes.storyImageSize + 6,
              height: AppSizes.storyImageSize + 6,
              padding: const .all(2),
              decoration: BoxDecoration(
                shape: .circle,
                border: Border.all(
                  color: story.isViewed ? AppColors.border : AppColors.primary,
                  width: story.isViewed ? 1 : 2,
                ),
              ),
              child: ClipOval(
                child: AppNetworkImage(imageUrl: story.imageUrl, fit: .cover),
              ),
            ),
            const SizedBox(height: AppSizes.spacingXs),
            AppText(
              title,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: .ellipsis,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
