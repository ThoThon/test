import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';
import 'package:v_bhxh/modules/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

class ForgotPasswordControllerCl extends BaseGetClController {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  final formKey = GlobalKey<FormState>();
  final taxCodeController = TextEditingController();
  final unitCodeController = TextEditingController();

  ForgotPasswordControllerCl(
    this._forgotPasswordUseCase,
  );

  Future<void> forgotPassword() {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await _forgotPasswordUseCase.execute(
          ForgotPasswordRequest(
            unitCode: unitCodeController.text.trim(),
            taxCode: taxCodeController.text.trim(),
          ),
        );

        _showDialogConfirmSuccess(
          LocaleKeys.certificate_verifySuccessfully.tr,
        );
      },
    );
  }

  void _showDialogConfirmSuccess(String content) {
    ShowDialog.showDialogConfirmNew(
      title: LocaleKeys.dialog_success.tr,
      content: content,
      iconType: DialogIconType.success,
      confirmTitle: LocaleKeys.dialog_history.tr,
      showConfirmButton: false,
    );
  }

  // void _showDialogFail(String errorMessage) {
  //   ShowDialog.showDialogConfirmNew(
  //     title: LocaleKeys.dialog_fail.tr,
  //     content: errorMessage,
  //     iconType: DialogIconType.failure,
  //     confirmTitle: LocaleKeys.dialog_history.tr,
  //     showConfirmButton: false,
  //   );
  // }

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
