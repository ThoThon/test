import 'package:flutter/cupertino.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/repository/declaration_list_repository.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';
import 'package:v_bhxh/shares/package/export_package.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

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
          errorMessage: 'Không thể kết nối tới hệ thống ký số.',
          onRetry: signDocument,
        );
      }
    }
  }

  void _showDialogCheckedSuccess() {
    ShowDialog.showDialogWithWidget(
      // isActiveBack: false,
      title: 'Chuyển ký thành công !',
      content:
          'Đã gửi hồ sơ tới hệ thống ký số, vui lòng đăng nhập mysign để tiến hành phê duyệt.',
      child: const CupertinoActivityIndicator(
        radius: 20,
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  void _showDialogVerifySuccess() {
    ShowDialog.showDialogConfirm2(
      title: 'Thành Công!',
      content: 'Gửi tờ khai lên cổng tiếp nhận của BHXH thành công.',
      iconType: DialogIconType.success,
      exitTitle: 'Thoát',
      confirmTitle: 'Lịch sử',
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.home.path));
      },
      onConfirm: () {
        Get.toNamed(
          AppRoutes.history.path,
          arguments: HistoryTabEnum.file_declare,
        );
      },
    );
  }

  void _showDialogVerifyFailed({
    required String errorMessage,
    VoidCallback? onRetry,
  }) {
    ShowDialog.showDialogConfirm2(
      title: 'Thất bại!',
      content: errorMessage,
      iconType: DialogIconType.failure,
      exitTitle: 'Thoát',
      showConfirmButton: onRetry != null,
      confirmTitle: onRetry != null ? 'Gửi lại' : null,
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.home.path));
      },
      onConfirm: onRetry,
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

      final response = await _repository.getPreviewPdf(
        request: GetPreviewPdfRequest(
          declarationPeriodId: argument.declarationPeriodId,
          documentRecordId: documentRecordId,
          previewDocumentType: previewDocumentType,
        ),
      );

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
