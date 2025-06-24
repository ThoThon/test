import 'package:flutter/cupertino.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/package/export_package.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

// Nếu mã lỗi là 58061 thì có thể retry ký số (from a Chương)
const _allowRetryCode = "58061";

class RegisterServiceController extends BaseGetxController {
  final usernameMySignCtrl = TextEditingController();
  final listCert = <CertificateModel>[].obs;

  final certificate = Rxn<CertificateModel>();

  late final _registerServiceRepository = RegisterServiceRepository(this);

  final registerServiceInfo = Rxn<RegisterServiceInfoModel>();

  // userID dùng để test
  // 0105987432_tk3

  @override
  void onInit() {
    super.onInit();
    fetchRegisterServiceInfo();
  }

  Future<void> fetchListCert() async {
    try {
      showLoadingOverlay();
      listCert.clear();
      final response =
          await _registerServiceRepository.getListCert(usernameMySignCtrl.text);
      if (response.isSuccess) {
        listCert.value = response.result;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> getListCertificate() async {
    await fetchListCert();
    if (listCert.isNotEmpty) {
      final result = await Get.bottomSheet(
        SelectCertificateBts(
          listCert: listCert,
        ),
      );
      if (result != null) {
        certificate.value = result;
      }
    } else {
      showSnackBar(LocaleKeys.registerService_usernameMySignNotFound.tr);
    }
  }

  Future<void> fetchRegisterServiceInfo() async {
    try {
      showLoadingOverlay();
      final response =
          await _registerServiceRepository.fetchRegisterServiceInfo();
      if (response.isSuccess && response.result != null) {
        registerServiceInfo.value = response.result;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> registerNewService() async {
    try {
      _showDialogCheckedSuccess();
      final response = await _registerServiceRepository.registerNewService(
        userId: usernameMySignCtrl.text.trim(),
        credentialID: certificate.value?.cerdentialID ?? '',
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
          onRetry: canRetry ? registerNewService : null,
        );
      }
    } catch (e) {
      ShowDialog.dismissDialog();
      if (e is DioException) {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
          onRetry: registerNewService,
        );
      }
    }
  }

  @override
  void onClose() {
    usernameMySignCtrl.dispose();
    super.onClose();
  }

  void _showDialogCheckedSuccess() {
    ShowDialog.showDialogWithWidget(
      // isActiveBack: false,
      title: LocaleKeys.dialog_successTransfer.tr,
      content: LocaleKeys.dialog_fileSendToSignature.tr,
      child: const CupertinoActivityIndicator(
        radius: 20,
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  void _showDialogVerifySuccess() {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_success.tr,
      content: LocaleKeys.dialog_submitRegisterToSuccess.tr,
      iconType: DialogIconType.success,
      exitTitle: LocaleKeys.dialog_exit.tr,
      confirmTitle: LocaleKeys.dialog_history.tr,
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.home.path));
      },
      onConfirm: () {
        Get.toNamed(AppRoutes.history.path);
      },
    );
  }

  void _showDialogVerifyFailed({
    required String errorMessage,
    VoidCallback? onRetry,
  }) {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_fail.tr,
      content: errorMessage,
      iconType: DialogIconType.failure,
      exitTitle: LocaleKeys.dialog_close.tr,
      showConfirmButton: onRetry != null,
      confirmTitle: onRetry != null ? LocaleKeys.dialog_resend.tr : null,
      onConfirm: onRetry,
    );
  }

  Future<void> cancelRegister() async {
    try {
      _showDialogCheckedSuccess();
      final response = await _registerServiceRepository.cancelRegister();
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
          onRetry: canRetry ? cancelRegister : null,
        );
      }
    } catch (e) {
      ShowDialog.dismissDialog();
      if (e is DioException) {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
          onRetry: cancelRegister,
        );
      }
    }
  }

  Future<void> changeInfo() async {
    try {
      _showDialogCheckedSuccess();
      final response = await _registerServiceRepository.changeInfo(
        userId: usernameMySignCtrl.text.trim(),
        credentialID: certificate.value?.cerdentialID ?? '',
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
          onRetry: canRetry ? changeInfo : null,
        );
      }
    } catch (e) {
      ShowDialog.dismissDialog();
      if (e is DioException) {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
          onRetry: changeInfo,
        );
      }
    }
  }

  bool get hasBeenRegister {
    final hasInfo = registerServiceInfo.value;
    if (hasInfo == null) return false;
    return hasInfo.tenChuTheCTS.isNotEmpty ||
        hasInfo.tenToChucCKS.isNotEmpty ||
        hasInfo.thoiHanTuNgay != null ||
        hasInfo.thoiHanDenNgay != null ||
        hasInfo.soSerialCTS.isNotEmpty;
  }

  bool get isDisableRegisterButton {
    final cert = certificate.value;

    // Nếu đã đăng ký rồi thì disable luôn
    if (hasBeenRegister) return true;

    // Nếu chưa có chứng thư số thì cũng disable
    return cert == null;
  }
}
