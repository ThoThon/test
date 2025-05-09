import 'package:flutter/cupertino.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/shares/shares.src.dart';

class SDSItemSwitch extends StatelessWidget {
  final String title;
  final bool? value;
  final Color? activeColor;
  final void Function(bool) onChanged;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? fontSize;
  final StyleEnum? style;

  const SDSItemSwitch({
    super.key,
    required this.title,
    required this.onChanged,
    this.value,
    this.activeColor,
    this.fontWeight,
    this.textColor,
    this.fontSize,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          inactiveTrackColor: AppColors.trackColorSwitch.withValues(alpha: 0.2),
          thumbColor:
              value == true ? AppColors.colorWhite : AppColors.thumbColorSwitch,
          activeTrackColor: activeColor ?? AppColors.primaryColor,
          value: value ?? false,
          onChanged: onChanged,
        ),
        sdsSBWidth8,
        TextUtils(
          text: title,
          color: textColor,
          fontWeight: fontWeight,
          availableStyle: style,
        ),
      ],
    );
  }
}
