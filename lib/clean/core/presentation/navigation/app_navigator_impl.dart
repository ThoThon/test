import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/snack_bar_type.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/shares/base/ui/text_widget.dart';

import 'app_navigator.dart';

class AppNavigatorImpl extends AppNavigator {
  @override
  Future<T?>? toNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  @override
  Future<T?>? offNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.offNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  @override
  void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  @override
  Future<T?>? offAllNamed<T>(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return Get.offAllNamed(
      newRouteName,
      predicate: predicate,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  @override
  Future<T?>? toNamedFactory<T>(
    String page, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: false,
      parameters: parameters,
    );
  }

  @override
  Future<T?> showBottomSheet<T>(
    BaseGetBtsDialog bottomSheet, {
    RouteSettings? settings,
  }) {
    return Get.bottomSheet(
      bottomSheet,
      settings: settings,
      isScrollControlled: true,
    );
  }

  @override
  Future<T?> bottomSheet<T>(
    Widget bottomsheet, {
    bool isScrollControlled = false,
  }) {
    return Get.bottomSheet(
      bottomsheet,
      isScrollControlled: isScrollControlled,
    );
  }

  @override
  Future<T?> showDialog<T>(
    BaseGetBtsDialog dialog, {
    RouteSettings? settings,
    bool barrierDismissible = true,
  }) {
    return Get.dialog(
      dialog,
      routeSettings: settings,
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Future<T?> dialog<T>(
    Widget widget, {
    bool barrierDismissible = true,
  }) {
    return Get.dialog(
      widget,
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarType type = SnackBarType.failure,
  }) async {
    BotToast.showCustomText(
      duration: message.length > 100 ? 5.seconds : duration,
      align: Alignment.topCenter,
      toastBuilder: (cancel) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(AppDimens.paddingSmall),
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding5,
              vertical: AppDimens.padding10,
            ),
            decoration: BoxDecoration(
              color: type.backgroundColor,
              border: Border.all(color: type.borderColor),
              borderRadius: BorderRadius.circular(
                AppDimens.padding6,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 8.1,
                  color: Colors.black.withValues(alpha: 0.15),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(type.iconPath).paddingOnly(
                        right: AppDimens.paddingVerySmall,
                      ),
                      Expanded(
                        child: SDSBuildText(
                          message.tr,
                          style: AppTextStyle.font14Bo,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                // if (mainButton != null) mainButton,
                InkWell(
                  onTap: cancel,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.basicBlack,
                  ).paddingOnly(left: AppDimens.padding14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
