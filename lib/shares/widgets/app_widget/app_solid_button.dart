import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';

import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/const.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

class AppSolidButton extends StatelessWidget {
  const AppSolidButton({
    super.key,
    required this.title,
    this.onPressed,
    this.throttleKey,
  });

  final String title;
  final VoidCallback? onPressed;

  /// Nếu truyền vào `throttleKey`, thì sẽ sử dụng EasyThrottle để tránh việc nhấn quá nhanh
  ///
  /// `throttleKey` sẽ là một chuỗi unique để xác định việc nhấn nút cụ thể nào đó, tránh trùng lặp key.
  final String? throttleKey;

  @override
  Widget build(BuildContext context) {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      height: AppDimens.btnLargeFigma,
      title: title,
      onPressed: () {
        if (throttleKey != null) {
          EasyThrottle.throttle(
            throttleKey!,
            AppConst.defaultButtonThrottleDuration,
            () {
              onPressed?.call();
            },
          );
        } else {
          onPressed?.call();
        }
      },
    );
  }
}
