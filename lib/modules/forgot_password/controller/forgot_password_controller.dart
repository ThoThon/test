import '../../../base_app/controllers_base/base_controller/base_controller.dart';
import '../../../shares/widgets/dialog/dialog.src.dart';
import '../../src.dart';

class ForgotPasswordController extends BaseGetxController {
  final taxCodeController = TextEditingController();
  final unitCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final _repository = ForgotPasswordRepository(this);

  Future<void> forgotPassword() async {
    try {
      if (formKey.currentState?.validate() == true) {
        showLoadingOverlay();
        final response = await _repository.forgotPassword(
          unitCode: unitCodeController.text,
          taxCode: taxCodeController.text,
        );
        if (response.result != null && response.isSuccess) {
          _showDialogConfirmSuccess(response.result);
        } else {
          _showDialogFail(response.errorMessage);
        }
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
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

  void _showDialogFail(String errorMessage) {
    ShowDialog.showDialogConfirmNew(
      title: LocaleKeys.dialog_fail.tr,
      content: errorMessage,
      iconType: DialogIconType.failure,
      confirmTitle: LocaleKeys.dialog_history.tr,
      showConfirmButton: false,
    );
  }
}
