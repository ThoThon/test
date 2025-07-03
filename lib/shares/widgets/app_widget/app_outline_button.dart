import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/cupertino.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
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
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.colorBlack),
      side: const BorderSide(width: 1, color: AppColors.colorBlack),
      backgroundColor: AppColors.basicWhite,
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
