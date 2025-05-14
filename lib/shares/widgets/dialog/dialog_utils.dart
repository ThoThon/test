import 'package:flutter/material.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';

import '../../../core/core.src.dart';
import '../../shares.src.dart';

class ShowDialog {
  static int _numberOfDialogs = 0;

  static void dismissDialog() {
    if (_numberOfDialogs > 0) {
      Get.back();
    }
  }

  static void _showDialog(
    Widget dialog,
    bool isActiveBack, {
    Function? onBackPress,
    bool barrierDismissible = false,
    String? name,
  }) {
    Get.dialog(
      PopScope(
        onPopInvokedWithResult: (_, v) =>
            onBackPress == null ? () {} : onBackPress(isActiveBack),
        canPop: isActiveBack,
        child: dialog,
      ),
      barrierDismissible: barrierDismissible,
      name: name,
    ).then((value) => _numberOfDialogs--);
    _numberOfDialogs++;
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotificationError(
    String content, {
    bool isActiveBack = true,
    Function? function,
    String nameAction = LocaleKeys.dialog_close,
    bool isExpiredToken = false,
  }) {
    _showDialog(
      Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Icon(
                  _buildIconDialog(content),
                  size: AppDimens.size45,
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: TextUtils(
                    text: content,
                    availableStyle: StyleEnum.bodyRegular,
                    color: AppColors.primaryNavy,
                    textAlign: TextAlign.center,
                    maxLine: 4,
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: double.infinity,
                child: _baseButton(
                  function,
                  nameAction.tr,
                  colorText: AppColors.primaryNavy,
                ),
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static Widget _baseButton(
    Function? function,
    String text, {
    Color? colorText,
  }) {
    return ButtonUtils.baseOnAction(
        onTap: () {
          dismissDialog();
          function?.call();
        },
        child: TextButton(
          onPressed: null,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: TextUtils(
            text: text,
            availableStyle: StyleEnum.bodyRegular,
            color: colorText ?? AppColors.primaryNavy,
          ),
        ));
  }

  static IconData _buildIconDialog(String errorStr) {
    IconData iconData;
    switch (errorStr) {
      case LocaleKeys.dialog_errorConnectTimeOut:
        iconData = Icons.alarm_off;
        break;
      case LocaleKeys.dialog_error400:
      case LocaleKeys.dialog_error401:
      case LocaleKeys.dialog_error404:
      case LocaleKeys.dialog_error502:
      case LocaleKeys.dialog_error503:
      case LocaleKeys.dialog_errorInternalServer:
        iconData = Icons.warning;
        break;
      case LocaleKeys.dialog_errorConnectFailedStr:
        iconData = Icons.signal_wifi_off;
        break;
      default:
        iconData = Icons.notifications_none;
    }
    return iconData;
  }

  static void showErrorMessage(String error, {bool isExpiredToken = false}) {
    if (_numberOfDialogs < 1) {
      if (isExpiredToken) {
        // showDialogNotificationError(error,
        //     nameAction: LocaleKeys.dialog_confirm, function: () {
        //       Get.offAllNamed(AppRoutes.routeLogin);
        //     });
      } else {
        showDialogNotificationError(error, isActiveBack: false);
      }
    }
  }

  static void showDialogConfirm({
    final bool isActiveBack = true,
    String? title,
    required String textBtnRight,
    Function()? onPressed,
    Function()? funcBack,
    String? name,
  }) {
    _showDialog(
      Dialog(
        backgroundColor: AppColors.colorWhite,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SDSImageSvg(
                  Assets.ASSETS_IMAGES_IMG_CHECK_SUCCESS_SVG,
                  width: 80,
                  height: 80,
                ).paddingOnly(
                  top: AppDimens.defaultPadding,
                  bottom: AppDimens.paddingSmall,
                ),
                // SDSBuildText(
                //   title ?? LocaleKeys.dialog_success.tr,
                //   style: AppTextStyle.font16Bo,
                // ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                // SDSBuildText(
                //   LocaleKeys.dialog_checkEmail.tr,
                //   style: AppTextStyle.font14Re,
                // ),
                // SDSBuildText(
                //   LocaleKeys.dialog_processTime.tr,
                //   style: AppTextStyle.font14Re,
                // ),
                TextUtils(
                  text: title ?? LocaleKeys.dialog_success.tr,
                  availableStyle: StyleEnum.subBold,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                TextUtils(
                  text: LocaleKeys.dialog_checkEmail.tr,
                  availableStyle: StyleEnum.bodyRegular,
                ),
                TextUtils(
                  text: LocaleKeys.dialog_processTime.tr,
                  availableStyle: StyleEnum.bodyRegular,
                ),
                Row(
                  children: [
                    Expanded(
                      child: UtilWidget.buildSolidButtonBack(
                        title: LocaleKeys.dialog_exit.tr,
                        onPressed: funcBack ?? Get.back,
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.paddingSmall,
                    ),
                    Expanded(
                      child: UtilWidget.buildSolidButton(
                        title: textBtnRight,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ).paddingOnly(
                  top: AppDimens.paddingSmall,
                  bottom: AppDimens.defaultPadding,
                  right: AppDimens.defaultPadding,
                  left: AppDimens.defaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
      isActiveBack,
      name: name,
    );
  }

  static Future<void> showDialogConfirm2({
    String? title,
    String? content,
    String? exitTitle,
    String? confirmTitle,
    VoidCallback? onCancelFunc,
    VoidCallback? onConfirm,
    bool isAutoCloseDialog = false,
    bool isActiveBack = true,
  }) async {
    _showDialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppDimens.paddingMedium),
                  child: SDSBuildText(
                    title,
                    maxLines: 1,
                    style: AppTextStyle.font20Bo,
                  ),
                ),
              content != null
                  ? Container(
                      padding: const EdgeInsets.only(
                          top: AppDimens.paddingSmall,
                          bottom: AppDimens.padding25),
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Text(
                          content,
                          style: AppTextStyle.font16Semi,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ).paddingSymmetric(horizontal: AppDimens.padding6),
                      ),
                    )
                  : UtilWidget.sizedBox16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UtilWidget.sizedBoxWidth20,
                  Expanded(
                    child: UtilWidget.buildSolidButtonBack(
                      title: exitTitle ?? 'Hủy',
                      onPressed: () {
                        dismissDialog();
                        onCancelFunc?.call();
                      },
                    ),
                  ),
                  UtilWidget.sizedBoxWidth20,
                  Expanded(
                    child: UtilWidget.buildSolidButton(
                      title: confirmTitle ?? 'Đồng ý',
                      onPressed: () {
                        dismissDialog();
                        onConfirm?.call();
                      },
                    ),
                  ),
                  UtilWidget.sizedBoxWidth20,
                ],
              ).paddingOnly(bottom: AppDimens.paddingMedium),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void showDialogFail({
    final bool isActiveBack = true,
    String? title,
    String? contentError,
    Function()? onPressed,
    Function()? funcBack,
  }) {
    _showDialog(
      Dialog(
        backgroundColor: AppColors.colorWhite,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SDSImageSvg(
                  Assets.ASSETS_IMAGES_IMG_CHECK_FAILURE_SVG,
                  width: 80,
                  height: 80,
                ).paddingOnly(
                  top: AppDimens.defaultPadding,
                  bottom: AppDimens.paddingSmall,
                ),
                TextUtils(
                  text: title ?? LocaleKeys.dialog_fail.tr,
                  availableStyle: StyleEnum.subBold,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                TextUtils(
                  text: LocaleKeys.dialog_registerFail.tr +
                      (contentError != null ? ("\n$contentError ") : ""),
                  availableStyle: StyleEnum.bodyRegular,
                ),
                Row(
                  children: [
                    Expanded(
                      child: UtilWidget.buildSolidButtonBack(
                        title: LocaleKeys.dialog_exit.tr,
                        onPressed: funcBack ?? Get.back,
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.paddingSmall,
                    ),
                    Expanded(
                      child: UtilWidget.buildSolidButton(
                        title: LocaleKeys.dialog_consignment.tr,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ).paddingOnly(
                  top: AppDimens.paddingSmall,
                  bottom: AppDimens.defaultPadding,
                  right: AppDimens.defaultPadding,
                  left: AppDimens.defaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void showDialogError({
    final bool isActiveBack = true,
    String? title,
    List<String>? missingFields,
  }) {
    _showDialog(
      Dialog(
        backgroundColor: AppColors.colorWhite,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          constraints: BoxConstraints(
            maxWidth: 300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.redAccent,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextUtils(
                      text: title ?? 'Cảnh báo',
                      availableStyle: StyleEnum.bodyRegular,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              if (missingFields != null && missingFields.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: missingFields
                      .map(
                        (field) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: TextUtils(
                            text: '• $field',
                            availableStyle: StyleEnum.bodyRegular,
                            color: AppColors.colorBlack,
                          ),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
      isActiveBack,
    );
  }
}
