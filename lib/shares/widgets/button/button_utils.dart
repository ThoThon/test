import 'package:flutter_svg/svg.dart';
import 'package:v_bhxh/modules/src.dart';

class ButtonUtils {
  static DateTime? _dateTime;
  static int _oldFunc = 0;

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
    bool isContinuous = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isContinuous) {
          onTap();
        } else {
          DateTime now = DateTime.now();
          if (_dateTime == null ||
              now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
              onTap.hashCode != _oldFunc) {
            _dateTime = now;
            _oldFunc = onTap.hashCode;
            onTap();
          }
        }
      },
      child: child,
    );
  }

  static void onTapButton({required Function onTap, required bool isLoading}) {
    if (!isLoading) {
      DateTime now = DateTime.now();
      if (_dateTime == null ||
          now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
          onTap.hashCode != _oldFunc) {
        _dateTime = now;
        _oldFunc = onTap.hashCode;
        onTap();
      }
    }
  }

  static Widget buildButton(
    String btnTitle,
    Function function, {
    List<Color> colors = AppColors.primaryMain,
    Color? backgroundColor,
    bool isLoading = false,
    bool visibleTextCenter = true,
    bool showLoading = true,
    String? icon,
    String? iconPng,
    Color? iconColor,
    double? iconSize,
    double? width,
    double? height,
    Color? colorText,
    Color? colorOverlay,
    BorderRadiusGeometry? borderRadius,
    Border? border,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppDimens.btnDefaultFigma,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? const Border(),
        gradient:
            backgroundColor != null ? null : LinearGradient(colors: colors),
        borderRadius: borderRadius ?? BorderRadius.circular(AppDimens.radius4),
      ),
      child: ElevatedButton(
        onPressed: () => onTapButton(isLoading: isLoading, onTap: function),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.colorTransparent,
          backgroundColor: AppColors.colorTransparent,
          shadowColor: AppColors.colorTransparent,
          padding: padding,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppDimens.radius8)),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return colorOverlay;
              }
              return null;
            },
          ),
        ),
        child: Stack(
          children: [
            if (icon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                    ).paddingOnly(right: AppDimens.defaultPadding),
                    // Icon(
                    //   icon,
                    //   size: iconSize,
                    //   color: iconColor,
                    // ),
                    SDSBuildText(
                      btnTitle,
                      style: AppTextStyle.font14Bo.copyWith(
                        color: colorText ?? AppColors.colorWhite,
                      ),
                    ),
                  ],
                ),
              ),
            if (visibleTextCenter)
              Center(
                child: SDSBuildText(
                  btnTitle,
                  style: AppTextStyle.font16Bo.copyWith(
                    color: colorText ?? AppColors.colorWhite,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: isLoading && showLoading,
                child: const SizedBox(
                  height: AppDimens.btnSmall,
                  width: AppDimens.btnSmall,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: AppColors.colorWhite,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.statusRed,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
