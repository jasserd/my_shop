import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';

class AppIcon extends StatelessWidget {
  const AppIcon.small(this.icon, {this.color, this.semanticLabel, super.key})
    : size = AppSizes.smallIconSize;

  const AppIcon.large(this.icon, {this.color, this.semanticLabel, super.key})
    : size = AppSizes.largeIconSize;

  final IconData icon;
  final Color? color;
  final String? semanticLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size, semanticLabel: semanticLabel);
  }
}
