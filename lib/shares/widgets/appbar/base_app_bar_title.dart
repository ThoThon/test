import 'package:flutter/material.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';

class BaseAppBarTitle extends StatelessWidget {
  const BaseAppBarTitle({
    super.key,
    required this.title,
    this.textStyle,
  });

  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SDSBuildText(
      title,
      style: textStyle ?? AppTextStyle.font20Bo,
    );
  }
}
