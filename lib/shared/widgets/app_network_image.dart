import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/shared/widgets/app_icon.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    required this.imageUrl,
    required this.fit,
    this.width,
    this.height,
    super.key,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }

        return const ColoredBox(
          color: AppColors.surface,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: AppSizes.loaderStrokeWidth,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const ColoredBox(
          color: AppColors.surface,
          child: Center(
            child: AppIcon.small(
              Icons.image_not_supported_outlined,
              color: AppColors.textSecondary,
            ),
          ),
        );
      },
    );
  }
}
