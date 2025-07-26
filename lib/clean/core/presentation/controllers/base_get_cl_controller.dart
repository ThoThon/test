import 'dart:async';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/app_controller_cl.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/app_navigator.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:v_bhxh/clean/shared/exceptions/exception_handler.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/clean/shared/exceptions/uncaught/app_uncaught_exception.dart';
import 'package:v_bhxh/clean/shared/utils/logger.dart';

/// typedef action for [buildState] method
typedef ActionCallback = FutureOr<void> Function();

/// typedef onError for [buildState] method
typedef OnErrorCallback = FutureOr<AppException?> Function(AppException error);

/// typedef for onFinally for [buildState] method
typedef OnFinallyCallback = FutureOr<void> Function();

abstract class BaseGetClController extends GetxController {
  late final AppControllerCl appController;
  late final AppNavigator appNavigator;
  late final _exceptionHandler = Get.find<ExceptionHandler>();

  final isLoading = false.obs;
  final isLoadingOverlay = false.obs;

  /// [action] Nếu bên trong hàm action có gọi hàm bất đồng bộ thì
  /// `BẮT BUỘC` phải `await` để `buildState` có thể bắt được lỗi nếu xảy ra
  Future<void> buildState({
    required ActionCallback action,
    OnErrorCallback? onError,
    OnFinallyCallback? onFinally,
    bool showLoading = false,
    bool showLoadingOverlay = false,
    bool handleError = true,
    String? overrideErrorMessage,
  }) async {
    bool hideLoadingOnFinally = true;
    try {
      if (showLoadingOverlay) {
        showPageLoadingOverlay();
      }

      if (showLoading) {
        showPageLoading();
      }

      await action();
    } catch (e, stackTrace) {
      logger.e(e);
      final appException = e is AppException ? e : AppUncaughtException(e);

      if (appException.appExceptionType == AppExceptionType.remote) {
        final remoteException = appException as RemoteException;
        if (remoteException.kind == RemoteExceptionKind.cancellation) {
          hideLoadingOnFinally = false;
        }
      }

      // onError nếu được truyền vào sẽ luôn được gọi để controller xử lý thêm nếu cần
      // Nếu onError trả về null thì lỗi đã được xử lý và không cần xử lý tiếp nữa, còn nếu trả về một exception khác để core sẽ xử lý tiếp
      final unHandledException = await onError?.call(appException);
      if (onError != null && unHandledException == null) {
        return;
      }

      if (handleError) {
        // Tự động xử lý exception đã biết
        _exceptionHandler.handleException(
          AppExceptionWrapper(
            appException: unHandledException ?? appException,
            stackTrace: stackTrace,
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      if (hideLoadingOnFinally) {
        if (showLoading) {
          hidePageLoading();
        }

        if (showLoadingOverlay) {
          hidePageLoadingOverlay();
        }
      }

      await onFinally?.call();
    }
  }

  void showPageLoading() {
    isLoading.value = true;
  }

  void hidePageLoading() {
    isLoading.value = false;
  }

  void showPageLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hidePageLoadingOverlay() {
    isLoadingOverlay.value = false;
  }
}
