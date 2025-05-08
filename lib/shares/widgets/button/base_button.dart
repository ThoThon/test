import 'package:flutter/material.dart';

import '../../../core/core.src.dart';
import '../../shares.src.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final Color? boderColor;
  final double radius;
  final StyleEnum? style;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.boderColor,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.colorWhite,
    this.radius = AppDimens.radius8,
    this.style,
    this.padding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isLoading = ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (context, loading, child) {
        return Container(
          width: width ?? Get.width,
          padding: padding ?? EdgeInsets.all(AppDimens.defaultPadding),
          child: ElevatedButton(
            onPressed: (onPressed == null || loading)
                ? null
                : () async {
                    isLoading.value = true;
                    try {
                      final result = onPressed?.call();
                      if (result is Future) await result;
                    } finally {
                      isLoading.value = false;
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: textColor,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.paddingMedium,
                vertical: AppDimens.paddingSmall,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: boderColor ?? Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextUtils(
                  text: text,
                  color: textColor,
                  availableStyle: style ?? StyleEnum.subBold,
                ),
                if (loading) ...[
                  sdsSBWidth8,
                  SizedBox(
                    width: AppDimens.sizeIconDefault,
                    height: AppDimens.sizeIconDefault,
                    child: CircularProgressIndicator(
                      color: AppColors.colorWhite,
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
