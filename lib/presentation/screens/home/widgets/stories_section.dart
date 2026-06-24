import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/app_localizations.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/story.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({
    required this.stories,
    required this.onStoryTap,
    super.key,
  });

  final List<Story> stories;
  final ValueChanged<Story> onStoryTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SizedBox(
      height: AppSizes.storyBlockHeight,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: stories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: AppSizes.spacingMd);
        },
        itemBuilder: (context, index) {
          final story = stories[index];
          return StoryWidget(
            story: story,
            title: localizations.byKey(story.titleKey),
            onTap: () => onStoryTap(story),
          );
        },
      ),
    );
  }
}
