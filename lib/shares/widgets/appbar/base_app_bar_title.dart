import 'package:flutter/material.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';

class BaseAppBarTitle extends StatelessWidget {
  const BaseAppBarTitle({
    super.key,
    required this.title,
    this.textColor,
  });

  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SDSBuildText(
      title,
      style: AppTextStyle.font20Bo.copyWith(color: textColor),
    );
  }
}
