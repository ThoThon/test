import 'package:flutter/material.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';

class BaseAppBarTitle extends StatelessWidget {
  const BaseAppBarTitle({
    super.key,
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SDSBuildText(
      title,
      style: style ?? AppTextStyle.font18Bo,
    );
  }
}
