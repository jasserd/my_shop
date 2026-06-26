import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/story.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

Future<void> showStoryViewer(BuildContext context, {required Story story}) {
  final localizations = AppLocalizations.of(context);

  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: localizations.closeStoryTooltip,
    barrierColor: AppColors.textPrimary,
    pageBuilder: (context, animation, secondaryAnimation) {
      return _StoryViewer(story: story);
    },
  );
}

class _StoryViewer extends StatelessWidget {
  const _StoryViewer({required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Material(
      color: AppColors.textPrimary,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AppNetworkImage(imageUrl: story.imageUrl ?? AppSettings.emptyString, fit: .contain),
            ),
            Positioned(
              top: AppSizes.spacingLg,
              left: AppSizes.spacingLg,
              right: AppSizes.spacingLg,
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      localizations.byKey(story.titleKey ?? AppSettings.emptyString),
                      style: AppTextStyles.h2(color: AppColors.background),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: localizations.closeStoryTooltip,
                    icon: const AppIcon.small(Icons.close, color: AppColors.background),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
