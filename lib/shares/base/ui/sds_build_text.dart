import 'package:flutter/material.dart';

import '../../../core/const/src.dart';

class SDSBuildText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;
  final TextOverflow? overflow;

  const SDSBuildText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.style,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: style ?? AppTextStyle.font14Re,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
