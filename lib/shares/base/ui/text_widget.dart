import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../../core/const/src.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/dimens.dart';

class SDSBuildText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final TextStyle? style;

  const SDSBuildText(
    this.text, {
    super.key,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.maxLines,
    this.fontSize,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
          AppTextStyle.font14Re.copyWith(
            color: color ?? AppColors.colorBlack,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize ?? AppDimens.sizeTextSmall,
          ),
      maxLines: maxLines,
    );
  }
}
