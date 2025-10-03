import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/constants/const.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';
import 'package:v_bhxh/modules/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

class ForgotPasswordController extends BaseGetClController {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  final formKey = GlobalKey<FormState>();
  final taxCodeController = TextEditingController();
  final unitCodeController = TextEditingController();

  ForgotPasswordController(
    this._forgotPasswordUseCase,
  );

  Future<void> forgotPassword() {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final result = await _forgotPasswordUseCase.execute(
          ForgotPasswordRequest(
            unitCode: unitCodeController.text.trim(),
            taxCode: taxCodeController.text.trim(),
          ),
        );

        _showDialogConfirmSuccess(
          result ?? LocaleKeys.login_forgetPasswordSuccess.tr,
        );
      },
      onError: (error) {
        if (error is RemoteException) {
          if (error.kind == RemoteExceptionKind.serverDefined) {
            final serverMsg = error.serverError?.errorMessage;
            final serverCode = error.serverError?.code;
            if (serverCode == responseCodeShowDialog) {
              _showDialogFail(errorMessage: serverMsg ?? '');
              return null;
            }
          }
        }
        return error;
      },
    );
  }

  void _showDialogConfirmSuccess(String content) {
    nav.showInfoDialog(
      title: LocaleKeys.dialog_success.tr,
      subtitle: content,
      iconType: DialogIconType.success,
      swapTitleAndIcon: true,
      confirmTitle: LocaleKeys.dialog_close.tr,
      showCancelButton: false,
    );
  }

  void _showDialogFail({
    required String errorMessage,
  }) {
    nav.showInfoDialog(
      title: LocaleKeys.dialog_fail.tr,
      confirmTitle: LocaleKeys.dialog_close.tr,
      subtitle: errorMessage,
      showCancelButton: false,
      iconType: DialogIconType.failure,
    );
  }

  void goToLoginPage() {
    nav.offAllNamed(AppRoutesCl.login.path);
  }

  @override
  void onClose() {
    taxCodeController.dispose();
    unitCodeController.dispose();
    super.onClose();
  }
}
