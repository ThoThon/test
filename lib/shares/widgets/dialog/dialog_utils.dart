import 'package:v_bhxh/modules/src.dart';

enum DialogIconType {
  success,
  failure,
}

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
                  child: SDSBuildText(
                    content,
                    style: AppTextStyle.font14Re.copyWith(
                      color: AppColors.primaryNavy,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
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
          child: SDSBuildText(
            text,
            style: AppTextStyle.font14Re.copyWith(
              color: colorText ?? AppColors.primaryNavy,
            ),
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
    String? status,
    required String textBtnRight,
    String? textBthLeft,
    Function()? onPressed,
    Function()? funcBack,
    String? name,
    bool activeIcon = true,
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
                activeIcon
                    ? SDSImageSvg(
                        Assets.ASSETS_IMAGES_IMG_CHECK_SUCCESS_SVG,
                        width: 80,
                        height: 80,
                      ).paddingOnly(
                        top: AppDimens.defaultPadding,
                        bottom: AppDimens.paddingSmall,
                      )
                    : sdsSBHeight16,
                SDSBuildText(
                  status ?? LocaleKeys.dialog_success.tr,
                  style: AppTextStyle.font16Bo,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                title == null
                    ? const SizedBox.shrink()
                    : SDSBuildText(
                        title,
                        style: AppTextStyle.font14Re,
                      ),
                Row(
                  children: [
                    Expanded(
                      child: UtilWidget.buildSolidButtonBack(
                        title: textBthLeft ?? LocaleKeys.dialog_exit.tr,
                        onPressed: funcBack ?? Get.back,
                      ),
                    ),
                    const SizedBox(
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
    required String title,
    String? content,
    String? exitTitle,
    String? confirmTitle,
    DialogIconType? iconType,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool showConfirmButton = true,
    bool isActiveBack = true,
    bool isDisableButtonConfirm = false,
  }) async {
    _showDialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SDSBuildText(
              title,
              maxLines: 3,
              style: AppTextStyle.font18Bo,
              textAlign: TextAlign.center,
            ),
            sdsSBHeight24,
            if (iconType != null)
              iconType == DialogIconType.success
                  ? SDSImageSvg(
                      Assets.ASSETS_IMAGES_IMG_CHECK_SUCCESS_SVG,
                      color: AppColors.colorIconSuccess,
                      width: 60,
                      height: 60,
                    )
                  : SDSImageSvg(
                      Assets.ASSETS_IMAGES_IMG_CHECK_FAILURE_SVG,
                      color: AppColors.primaryColor,
                      width: 60,
                      height: 60,
                    ),
            content != null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.padding24,
                    ),
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
            showConfirmButton
                ? Row(
                    children: [
                      Expanded(
                        child: UtilWidget.buildSolidButtonBack(
                          title: exitTitle ?? 'Hủy',
                          borderRadius: AppDimens.radius30,
                          backgroundColor: AppColors.primaryColor,
                          textStyle: AppTextStyle.font14Bo
                              .copyWith(color: AppColors.basicWhite),
                          onPressed: () {
                            dismissDialog();
                            onCancel?.call();
                          },
                        ),
                      ),
                      if (!isDisableButtonConfirm) UtilWidget.sizedBoxWidth20,
                      Visibility(
                        visible: !isDisableButtonConfirm,
                        child: Expanded(
                          child: UtilWidget.buildSolidButton(
                            borderRadius: AppDimens.radius30,
                            title: confirmTitle ?? 'Đồng ý',
                            onPressed: () {
                              dismissDialog();
                              onConfirm?.call();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : UtilWidget.buildSolidButtonBack(
                    width: double.infinity,
                    title: exitTitle ?? 'Hủy',
                    borderRadius: AppDimens.radius30,
                    backgroundColor: AppColors.primaryColor,
                    textStyle: AppTextStyle.font14Bo
                        .copyWith(color: AppColors.basicWhite),
                    onPressed: () {
                      dismissDialog();
                      onCancel?.call();
                    },
                  ),
          ],
        ).paddingAll(AppDimens.padding24),
      ),
      isActiveBack,
    );
  }

  static Future<void> showDialogTimerCount({
    required String title,
    required String content,
    VoidCallback? onFinish,
    bool isActiveBack = true,
    int? timerCount,
  }) async {
    _showDialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SDSBuildText(
              title,
              maxLines: 3,
              style: AppTextStyle.font18Bo,
              textAlign: TextAlign.center,
            ),
            sdsSBHeight16,
            CountDownTimer(
              start: timerCount ?? 120,
              onFinish: () {
                dismissDialog();
                onFinish?.call();
              },
            ),
            Container(
              padding: const EdgeInsets.only(
                top: AppDimens.defaultPadding,
              ),
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: AppTextStyle.font16Semi,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ).paddingAll(AppDimens.padding24),
      ),
      isActiveBack,
    );
  }

  static Future<void> showDialogWithWidget({
    required String title,
    String? content,
    Widget? child,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SDSBuildText(
              title,
              maxLines: 1,
              style: AppTextStyle.font20Bo,
            ),
            content != null
                ? Container(
                    padding: const EdgeInsets.only(
                      top: AppDimens.paddingSmall,
                    ),
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
            if (child != null) child,
          ],
        ).paddingAll(AppDimens.defaultPadding),
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
                SDSBuildText(
                  title ?? LocaleKeys.dialog_fail.tr,
                  style: AppTextStyle.font16Bo,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                SDSBuildText(
                  LocaleKeys.dialog_registerFail.tr +
                      (contentError != null ? ("\n$contentError ") : ""),
                ),
                Row(
                  children: [
                    Expanded(
                      child: UtilWidget.buildSolidButtonBack(
                        title: LocaleKeys.dialog_exit.tr,
                        onPressed: funcBack ?? Get.back,
                      ),
                    ),
                    const SizedBox(
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
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.redAccent,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SDSBuildText(
                      title ?? 'Cảnh báo',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (missingFields != null && missingFields.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: missingFields
                      .map(
                        (field) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: SDSBuildText(
                            '• $field',
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

  static Future<void> funcOpenDialog(Widget child, Object? argument) async {
    Get.dialog(
      buildShowPopupOption(child),
      barrierDismissible: false,
      arguments: argument,
    );
  }

  static Widget buildShowPopupOption(Widget? child) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      backgroundColor: AppColors.colorWhite,
      contentPadding: const EdgeInsets.all(0),
      elevation: 0.0,
      content: SizedBox(
        width: Get.width,
        child: child,
      ),
    );
  }

  static Future<void> showDialogConfirmNew({
    required String title,
    String? content,
    String? exitTitle,
    String? confirmTitle,
    TextStyle? styleContent,
    DialogIconType? iconType,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool showConfirmButton = true,
    bool isActiveBack = true,
    bool isDisableButtonConfirm = false,
  }) async {
    _showDialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(AppDimens.defaultPadding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (iconType != null)
              iconType == DialogIconType.success
                  ? SDSImageSvg(
                      Assets.ASSETS_IMAGES_IMG_CHECK_SUCCESS_SVG,
                      width: 60,
                      height: 60,
                    )
                  : SDSImageSvg(
                      Assets.ASSETS_IMAGES_IMG_CHECK_FAILURE_SVG,
                      width: 60,
                      height: 60,
                    ),
            sdsSBHeight12,
            SDSBuildText(
              title,
              maxLines: 3,
              style: AppTextStyle.font18Bo,
              textAlign: TextAlign.center,
            ),
            content != null
                ? Container(
                    padding: const EdgeInsets.only(
                      top: AppDimens.paddingSmall,
                      bottom: AppDimens.padding25,
                    ),
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: SingleChildScrollView(
                      child: Text(
                        content,
                        style: styleContent ?? AppTextStyle.font14Re,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ).paddingSymmetric(horizontal: AppDimens.padding6),
                    ),
                  )
                : UtilWidget.sizedBox16,
            showConfirmButton
                ? Row(
                    children: [
                      Expanded(
                        child: UtilWidget.buildSolidButtonBack(
                          title: exitTitle ?? LocaleKeys.dialog_close.tr,
                          onPressed: () {
                            dismissDialog();
                            onCancel?.call();
                          },
                        ),
                      ),
                      if (!isDisableButtonConfirm) UtilWidget.sizedBoxWidth20,
                      Visibility(
                        visible: !isDisableButtonConfirm,
                        child: Expanded(
                          child: UtilWidget.buildSolidButton(
                            title: confirmTitle ?? LocaleKeys.dialog_confirm.tr,
                            onPressed: () {
                              dismissDialog();
                              onConfirm?.call();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : UtilWidget.buildSolidButtonBack(
                    title: exitTitle ?? LocaleKeys.dialog_close.tr,
                    borderRadius: AppDimens.radius30,
                    width: double.infinity,
                    backgroundColor: AppColors.primaryColor,
                    textStyle: AppTextStyle.font16Re
                        .copyWith(color: AppColors.basicWhite),
                    onPressed: () {
                      dismissDialog();
                      onCancel?.call();
                    },
                  ),
          ],
        ).paddingAll(AppDimens.defaultPadding),
      ),
      isActiveBack,
    );
  }
}
