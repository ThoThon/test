import 'dart:io';

import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception.dart';
import 'package:v_bhxh/clean/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/function/logger.dart';

import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../constants/const.dart';

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
            nav.showErrorDialog(
              errorMessage: LocaleKeys.app_cannotConnectToServer.tr,
            );
            break;
          case RemoteExceptionKind.serverDefined:
            // Xử lý các status code từ phổ biến
            switch (exception.httpErrorCode) {
              case HttpStatus.unauthorized:
                nav.showNotificationDialog(
                  message: LocaleKeys.dialog_error401.tr,
                  onClose: () {
                    nav.offAllNamed(AppRoutesCl.login.path);
                  },
                );
                return;
              case HttpStatus.badRequest:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_error400.tr,
                );
                return;
              case HttpStatus.notFound:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_error404.tr,
                );
                return;
              case HttpStatus.tooManyRequests:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_error429.tr,
                );
                return;
              case HttpStatus.internalServerError:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_errorInternalServer.tr,
                );
                return;
              case HttpStatus.badGateway:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_error502.tr,
                );
                return;
              case HttpStatus.serviceUnavailable:
                nav.showErrorDialog(
                  errorMessage: LocaleKeys.dialog_error503.tr,
                );
                return;
              default:
                break;
            }

            if (appExceptionWrapper.overrideMessage != null) {
              nav.showSnackBar(
                appExceptionWrapper.overrideMessage!,
              );
              return;
            }
            if (exception.serverError?.code == responseCodeShowDialog) {
              nav.showInfoDialog(
                title: LocaleKeys.dialog_fail.tr,
                confirmTitle: LocaleKeys.dialog_close.tr,
                subtitle: exception.serverError?.errorMessage ?? '',
                showCancelButton: false,
                iconType: DialogIconType.failure,
              );
              return;
            }

            nav.showSnackBar(
              exception.serverError?.errorMessage ??
                  LocaleKeys.app_somethingWentWrong.tr,
            );
            break;
          case RemoteExceptionKind.network:
            nav.showErrorDialog(
              errorMessage: LocaleKeys.app_cannotConnectToServer.tr,
            );
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
        nav.showSnackBar(appExceptionWrapper.appException.errorMessage ??
            LocaleKeys.app_somethingWentWrong.tr);
        break;
    }
  }
}
