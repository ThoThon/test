import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_svg/svg.dart';

import '../../../modules/src.dart';
import '../../../shares/widgets/dialog/dialog.src.dart';
import '../../model/base_model.src.dart';
import '../../repository_base/repository_base.src.dart';

class BaseGetxController extends GetxController {
  /// Show loading button
  RxBool isShowLoading = false.obs;
  String errorContent = '';
  RxBool isRemember = true.obs;

  ///1 CancelToken để huỷ 1 request.
  ///1 màn hình gắn với 1 controller, 1 controller có nhiều requests khi huỷ 1 màn hình => huỷ toàn bộ requests `INCOMPLETED` tại màn hình đó.
  List<CancelToken> cancelTokens = [];

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  void addCancelToken(CancelToken cancelToken) {
    cancelTokens.add(cancelToken);
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Cancel when close controller!!!');
    }
  }

  void _setOnErrorListener() {
    BaseApi().setOnErrorListener((error) async {
      errorContent = LocaleKeys.dialog_errorConnectFailedStr.tr;

      if (error is DioException) {
        //Nếu server có trả về message thì hiển thị
        if (error.response?.data != null &&
            error.response!.data is Map &&
            error.response!.data["Message"] != null) {
          errorContent = error.response!.data['Message'];
        } else {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              errorContent = LocaleKeys.dialog_errorConnectTimeOut.tr;
              break;
            case DioExceptionType.cancel:
              // không hiện thông báo khi huỷ request
              errorContent = '';
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case AppConst.error400:
                  errorContent = LocaleKeys.dialog_error400.tr;
                  break;
                case AppConst.error401:
                  errorContent = LocaleKeys.dialog_error401.tr;
                  ShowDialog.showDialogNotificationError(
                    errorContent,
                    isActiveBack: false,
                    function: () {
                      Get.offAllNamed(AppRoutes.login.path);
                    },
                  );
                  return;
                case AppConst.error404:
                  errorContent = LocaleKeys.dialog_error404.tr;
                  break;
                case AppConst.error500:
                  errorContent = LocaleKeys.dialog_errorInternalServer.tr;
                  break;
                case AppConst.error502:
                  errorContent = LocaleKeys.dialog_error502.tr;
                  break;
                case AppConst.error503:
                  errorContent = LocaleKeys.dialog_error503.tr;
                  break;
                default:
                  errorContent = LocaleKeys.dialog_errorInternalServer.tr;
              }
              break;
            default:
              errorContent = LocaleKeys.dialog_errorConnectFailedStr.tr;
          }
          // await FirebaseCloud.addLogError(error, errorContent);
          /*  // check lỗi khi tải pdf
         if (error.response?.data != null &&
              error.response?.data is List<int>) {
            var result = utf8.decode(error.response?.data);
            var err = jsonDecode(result);
            if (err is Map) {
              errorContent = err['Message'];
            }
          }*/
        }
      }

      isShowLoading.value = false;
      isLoadingOverlay.value = false;
      if (errorContent.isNotEmpty) {
        ShowDialog.showErrorMessage(errorContent);
      }
    });
  }

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    String typeAction = AppConst.actionFail,
  }) async {
    BotToast.showCustomText(
      duration: message.length > 100 ? 5.seconds : duration,
      align: Alignment.topCenter,
      toastBuilder: (cancel) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(AppDimens.paddingSmall),
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding5,
              vertical: AppDimens.padding10,
            ),
            decoration: BoxDecoration(
              color: AppCollection.mapColorBackgroundSnackBar[typeAction],
              border: Border.all(
                color: AppCollection.mapColorBorderSnackBar[typeAction] ??
                    AppColors.statusRed,
              ),
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
                      SvgPicture.asset(
                        AppCollection.mapIconSnackBar[typeAction] ??
                            Assets.ASSETS_ICONS_ICON_SNACK_BAR_FAIL_SVG,
                      ).paddingOnly(
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

  @override
  void onClose() {
    for (var cancelToken in cancelTokens) {
      cancelRequest(cancelToken);
    }
    super.onClose();
  }

  @override
  void onInit() {
    _setOnErrorListener();
    super.onInit();
  }

  /// Func goi API Danh sách
  Future<void> callAPIList<T>({
    required Future<BaseResponseList<T>> functionAPI,
    required List<T> listResponse,
    bool isRefresh = true,
  }) async {
    try {
      if (isRefresh) {
        showLoading();
      }

      final res = await functionAPI;

      if (res.code == AppConst.statusCodeSuccess && res.result.isNotEmpty) {
        if (isRefresh) {
          listResponse.clear();
        }
        listResponse.addAll(res.result);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      if (isRefresh) {
        hideLoading();
      }
    }
  }

  /// Func goi API Đơn
  Future<void> callAPIBE<T>({
    required Future<BaseResponse<T>> functionAPI,
    required Function(T? result) functionSuccess,
    Function(T? result)? functionFail,
    bool isOverlay = true,
    bool isShowLoading = false,
  }) async {
    try {
      if (isShowLoading) {
        showLoading();
      } else if (isOverlay) {
        showLoadingOverlay();
      }

      final res = await functionAPI;

      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        functionSuccess(res.result);
      } else {
        functionFail?.call(res.result);
      }
    } finally {
      if (isShowLoading) {
        hideLoading();
      } else if (isOverlay) {
        hideLoadingOverlay();
      }
    }
  }
}
