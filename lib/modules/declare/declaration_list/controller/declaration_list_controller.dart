import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/history_argument.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/repository/declaration_list_repository.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

import '../../../../shares/package/export_package.dart';
import '../../../src.dart';

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

        _showDialogVerifySuccess();
      } else {
        // Đóng dialog kiểm tra ký số
        ShowDialog.dismissDialog();

        _showDialogVerifyFailed(
          errorMessage: response.errorMessage,
        );
      }
    } catch (e) {
      if (e is DioException && e.type != DioExceptionType.cancel) {
        ShowDialog.dismissDialog();
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
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
        cancelAllRequest();
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_signatureTimeOut.tr,
        );
      },
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.declarationPeriod.path));
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
  }) {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_sendFileFail.tr,
      content: errorMessage,
      showConfirmButton: false,
      backgroundColorBack: AppColors.basicWhite,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
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
        ProcedureType.procedure607 ||
        ProcedureType.procedure608 ||
        ProcedureType.procedure610 ||
        ProcedureType.procedure612 ||
        ProcedureType.procedure613 =>
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
