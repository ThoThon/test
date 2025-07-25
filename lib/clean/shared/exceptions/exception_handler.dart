import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/app_navigator.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class ExceptionHandler {
  final AppNavigator appNavigator;

  const ExceptionHandler({
    required this.appNavigator,
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
            appNavigator.showSnackBar(
              LocaleKeys.app_cannotConnectToServer.tr,
            );
            break;
          case RemoteExceptionKind.serverDefined:
            if (appExceptionWrapper.overrideMessage != null) {
              appNavigator.showSnackBar(
                appExceptionWrapper.overrideMessage!,
              );
              return;
            }
            appNavigator.showSnackBar(
              exception.serverError?.errorMessage ??
                  LocaleKeys.app_somethingWentWrong.tr,
            );
            break;
          case RemoteExceptionKind.network:
            appNavigator.showSnackBar(LocaleKeys.app_cannotConnectToServer.tr);
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
        appNavigator.showSnackBar(LocaleKeys.app_somethingWentWrong.tr);
        break;
    }
  }
}
