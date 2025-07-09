import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/history_argument.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/repository/declaration_list_repository.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

import '../../../../shares/package/export_package.dart';
import '../../../src.dart';

// Nếu mã lỗi là 58061 thì có thể retry ký số (from a Chương)
const _allowRetryCode = "58061";

class DeclarationListController extends BaseGetxController {
  final argument = Get.arguments as DeclarationListArgument;

  late final _repository = DeclarationListRepository(this);

  Future<void> signDocument() async {
    try {
      _showDialogCheckedSuccess();

      final response = await _repository.signDocument(
        declarationPeriodId: argument.declarationPeriodId,
      );

      if (response.isSuccess) {
        // Đóng dialog kiểm tra ký số
        ShowDialog.dismissDialog();

        // Hiện dialog thông báo đã gửi hồ sơ lên hệ thống ký số
        _showDialogVerifySuccess();
      } else {
        // Đóng dialog kiểm tra ký số
        ShowDialog.dismissDialog();

        final canRetry = response.code == _allowRetryCode;
        _showDialogVerifyFailed(
          errorMessage: response.errorMessage,
          onRetry: canRetry ? signDocument : null,
        );
      }
    } catch (e) {
      ShowDialog.dismissDialog();
      if (e is DioException) {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
          onRetry: signDocument,
        );
      }
    }
  }

  void _showDialogCheckedSuccess() {
    ShowDialog.showDialogTimerCount(
      timerCount: 125,
      showCloseButton: true,
      content: LocaleKeys.dialog_confirmSignatureMySign.tr,
      title: LocaleKeys.dialog_sendRequestSignature.tr,
      onFinish: () {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_signatureTimeOut.tr,
        );
      },
    );
  }

  void _showDialogVerifySuccess() {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_sendFileSuccess.tr,
      content: LocaleKeys.dialog_sendFileToBHXH.tr,
      iconType: DialogIconType.success,
      exitTitle: LocaleKeys.dialog_exit.tr,
      confirmTitle: LocaleKeys.dialog_history.tr,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      backgroundColorBack: AppColors.basicWhite,
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.home.path));
      },
      onConfirm: () {
        Get.toNamed(
          AppRoutes.history.path,
          arguments: HistoryArgument(
            selectedTab: HistoryTabEnum.file_declare,
          ),
        );
      },
    );
  }

  void _showDialogVerifyFailed({
    required String errorMessage,
    VoidCallback? onRetry,
  }) {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_sendFileFail.tr,
      content: errorMessage,
      showConfirmButton: false,
      iconType: DialogIconType.failure,
      exitTitle: LocaleKeys.dialog_close.tr,
    );
  }

  Future<void> getPreviewPdf({
    required PreviewDocumentTypeEnum previewDocumentType,
    String? documentRecordId,
    required String title,
    bool isRotateHorizontal = false,
  }) async {
    try {
      showLoadingOverlay();

      final request = GetPreviewPdfRequest(
        declarationPeriodId: argument.declarationPeriodId,
        previewDocumentType: previewDocumentType,
        documentRecordId: documentRecordId,
      );

      final response = await switch (argument.procedureType) {
        ProcedureType.procedure600 =>
          _repository.getPreviewPdf(request: request),
        ProcedureType.procedure607 =>
          _repository.getPreviewPdf607(request: request),
      };

      final url = response.result;

      if (response.isSuccess && url != null) {
        Get.toNamed(
          AppRoutes.viewPdf.path,
          arguments: ViewPdfArgument(
            url: url,
            title: title,
            isRotateHorizontal: isRotateHorizontal,
          ),
        );
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
