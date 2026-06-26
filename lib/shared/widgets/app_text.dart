import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';

class AppText extends StatelessWidget {
  const AppText(this.data, {super.key, this.style, this.textAlign, this.maxLines, this.overflow});

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? AppTextStyles.bodyRegular(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
