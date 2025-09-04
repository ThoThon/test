import 'package:v_bhxh/modules/src.dart';

enum DialogIconType {
  success,
  failure,
  note,
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

  @Deprecated("Use nav.showNotificationDialog instead")

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

  @Deprecated("Use nav.showErrorDialog instead")
  static void showErrorMessage(String error) {
    // Không check bằng _numberOfDialogs để ngăn ngừa việc mở nhiều dialog cùng lúc
    // vì có bug là nếu 1 dialog đang mở mà bị chuyển màn hình (user không chủ động bấm đóng dialog),
    // thì _numberOfDialogs không bị giảm, dẫn đến việc không thể mở dialog mới
    if (Get.isDialogOpen ?? false) {
      return;
    }

    showDialogNotificationError(error, isActiveBack: false);
  }

  @Deprecated("Use nav.showInfoDialog instead")
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
    TextStyle? textStyleBack,
    TextStyle? textStyleConfirm,
    Color? backgroundColorBack,
    Color? borderColorButtonBack,
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
            if (iconType != null) _buildDialogIcon(iconType),
            content != null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.padding24,
                    ),
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: SingleChildScrollView(
                      child: Text(
                        content,
                        style: AppTextStyle.font14Re,
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
                          borderColor: borderColorButtonBack,
                          title: exitTitle ?? 'Hủy',
                          borderRadius: AppDimens.radius30,
                          backgroundColor:
                              backgroundColorBack ?? AppColors.primaryColor,
                          textStyle: textStyleBack ??
                              AppTextStyle.font14Re
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
                            textStyle: AppTextStyle.font14Re
                                .copyWith(color: AppColors.basicWhite),
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

  static Widget _buildDialogIcon(DialogIconType iconType) {
    switch (iconType) {
      case DialogIconType.success:
        return SDSImageSvg(
          Assets.ASSETS_IMAGES_IMG_CHECK_SUCCESS_SVG,
          color: AppColors.colorIconSuccess,
          width: 60,
          height: 60,
        );
      case DialogIconType.failure:
        return SDSImageSvg(
          Assets.ASSETS_IMAGES_IMG_CHECK_FAILURE_SVG,
          color: AppColors.primaryColor,
          width: 60,
          height: 60,
        );
      case DialogIconType.note:
        return SDSImageSvg(
          Assets.ASSETS_ICONS_IC_NOTE_SVG,
          color: const Color(0xFFFE9705),
          width: 60,
          height: 60,
        );
    }
  }

  @Deprecated("Use nav.showTimerDialog instead")
  static Future<void> showDialogTimerCount({
    required String title,
    required String content,
    VoidCallback? onFinish,
    VoidCallback? onCancel,
    bool isActiveBack = true,
    int? timerCount,
    bool showCloseButton = false,
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
            const SizedBox(height: 16),
            if (showCloseButton)
              SizedBox(
                width: double.infinity,
                child: UtilWidget.buildSolidButton(
                  title: 'Đóng',
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: AppDimens.radius30,
                  textStyle: AppTextStyle.font14Bo
                      .copyWith(color: AppColors.basicWhite),
                  onPressed: () {
                    dismissDialog();
                    onCancel?.call();
                  },
                ),
              ),
          ],
        ).paddingAll(AppDimens.padding24),
      ),
      isActiveBack,
    );
  }

  @Deprecated("Use nav.showInfoDialog instead")
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
