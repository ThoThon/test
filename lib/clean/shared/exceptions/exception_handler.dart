import 'dart:io';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class ExceptionHandler {
  final AppNavigator nav;

  const ExceptionHandler({
    required this.nav,
  });

  void handleException(
    AppExceptionWrapper appExceptionWrapper,
  ) {
    switch (appExceptionWrapper.appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appExceptionWrapper.appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.noInternet:
          case RemoteExceptionKind.timeout:
            nav.showSnackBar(
              LocaleKeys.app_cannotConnectToServer.tr,
            );
            break;
          case RemoteExceptionKind.serverDefined:
            if (exception.httpErrorCode == HttpStatus.unauthorized) {
              nav.showSnackBar(
                'Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại',
              );
              nav.offAllNamed(AppRoutesCl.login.path);
              return;
            }

            if (appExceptionWrapper.overrideMessage != null) {
              nav.showSnackBar(
                appExceptionWrapper.overrideMessage!,
              );
              return;
            }

            nav.showSnackBar(
              exception.serverError?.errorMessage ??
                  LocaleKeys.app_somethingWentWrong.tr,
            );
            break;
          case RemoteExceptionKind.network:
            nav.showSnackBar(LocaleKeys.app_cannotConnectToServer.tr);
            break;
          default:
            // Ko xử lý những exception ko cần thiết như cancellation,...
            logger.e("Unknown error: $exception");
            break;
        }
        break;
      case AppExceptionType.remoteConfig:
        break;
      case AppExceptionType.custom:
      case AppExceptionType.uncaught:
        nav.showSnackBar(LocaleKeys.app_somethingWentWrong.tr);
        break;
    }
  }
}
