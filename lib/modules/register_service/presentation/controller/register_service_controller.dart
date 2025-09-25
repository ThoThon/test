import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/certificate.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../shares/utils/utils_src.dart';
import '../../../declare/declaration_list/declaration_list_src.dart';
import '../../../home_clean/presentation/events/home_event.dart';

class RegisterServiceController extends BaseGetClController {
  final GetTransactionInfoUseCase _getTransactionInfoUseCase;
  final GetListCertificateUseCase _getListCertificateUseCase;
  final RegisterServiceUseCase _registerServiceUseCase;
  final UpdateTransactionInfoUseCase _updateTransactionInfoUseCase;
  final CancelRegisterUseCase _cancelRegisterUseCase;

  RegisterServiceController(
    this._getTransactionInfoUseCase,
    this._getListCertificateUseCase,
    this._registerServiceUseCase,
    this._updateTransactionInfoUseCase,
    this._cancelRegisterUseCase,
  );

  final usernameMySignCtrl = TextEditingController();

  final listCert = <Certificate>[].obs;

  final certificate = Rxn<Certificate>();

  final transactionInfo = Rxn<TransactionInfo>();

  final listRegisterInfo = <TransactionInfo>[].obs;

  final isUsernameMySignEmpty = true.obs;

  // userID dùng để test
  // 0105987432_tk3

  @override
  void onInit() {
    super.onInit();
    getTransactionInfo();
  }

  Future<void> fetchListCert() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response =
            await _getListCertificateUseCase.execute(usernameMySignCtrl.text);
        listCert.value = response;
        certificate.value = listCert.firstOrNull;
      },
    );
  }

  Future<void> getTransactionInfo() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        transactionInfo.value = await _getTransactionInfoUseCase.execute();
        // Thêm vào list để có thể view được trong dropdown
        if (transactionInfo.value != null) {
          listRegisterInfo.add(transactionInfo.value!);
        }
        // Nếu đã đăng ký thì set giá trị cho usernameMySignCtrl
        final userId = transactionInfo.value!.userId;
        if (userId.isNotEmpty) {
          usernameMySignCtrl.text = userId;
          isUsernameMySignEmpty.value = false;
          await fetchListCert();
        }
      },
    );
  }

  RegisterServiceRequest _buildRequest() {
    return RegisterServiceRequest(
      userId: usernameMySignCtrl.text,
      credentialID: certificate.value?.cerdentialID ?? '',
    );
  }

  Future<void> registerNewService() async {
    return buildState(
      action: () async {
        _showDialogCheckedSuccess();
        await _registerServiceUseCase.execute(_buildRequest());
        nav.dismissDialog();
        eventBus.fire(const GetUnreadNotificationCountEvent());
        _showDialogVerifySuccess();
      },
      onError: (error) {
        nav.dismissDialog();
        return error;
      },
      onFinally: hidePageLoadingOverlay,
    );
  }

  @override
  void onClose() {
    usernameMySignCtrl.dispose();
    super.onClose();
  }

  void _showDialogCheckedSuccess() {
    nav.showTimerDialog(
      title: LocaleKeys.dialog_sendRequestSignature.tr,
      onFinish: () {
        showPageLoadingOverlay();
      },
      onCancel: nav.back,
      subtitle: LocaleKeys.dialog_confirmSignatureMySign.tr,
    );
  }

  void _showDialogVerifySuccess() {
    nav.showInfoDialog(
      title: LocaleKeys.dialog_success.tr,
      subtitle: LocaleKeys.dialog_submitRegisterToSuccess.tr,
      iconType: DialogIconType.success,
      cancelTitle: LocaleKeys.dialog_exit.tr,
      confirmTitle: LocaleKeys.dialog_history.tr,
      onCancel: () async{
        eventBus.fire(const GetUnreadNotificationCountEvent());

        nav.until(ModalRoute.withName(AppRoutesCl.home.path));
      },
      onConfirm: () {
        nav.toNamed(
          AppRoutesCl.history.path,
          arguments: HistoryArgument(
            selectedTab: HistoryTabEnum.register_transaction,
          ),
        );
      },
    );
  }

  Future<void> cancelRegister() async {
    return buildState(
      action: () async {
        _showDialogCheckedSuccess();
        await _cancelRegisterUseCase.execute();
        nav.dismissDialog();
        _showDialogVerifySuccess();
      },
      onError: (error) {
        nav.dismissDialog();
        return error;
      },
      onFinally: hidePageLoadingOverlay,
    );
  }

  Future<void> updateInfo() async {
    return buildState(
      action: () async {
        _showDialogCheckedSuccess();
        await _updateTransactionInfoUseCase.execute(_buildRequest());
        nav.dismissDialog();
        eventBus.fire(const GetUnreadNotificationCountEvent());
        _showDialogVerifySuccess();
      },
      onError: (error) {
        nav.dismissDialog();
        return error;
      },
      onFinally: hidePageLoadingOverlay,
    );
  }

  bool get hasBeenRegister {
    final hasInfo = transactionInfo.value;
    if (hasInfo == null) return false;
    return hasInfo.certificateOwner.isNotEmpty ||
        hasInfo.certificateOrgName.isNotEmpty ||
        hasInfo.certificateSerial.isNotEmpty;
  }

  bool get isDisableRegisterButton {
    final cert = certificate.value;

    // Đã đăng ký rồi thì disable luôn
    if (hasBeenRegister) return true;

    if (isUsernameMySignEmpty.value) return true;
    // Nếu không có username hoặc không có chứng thư số thì disable
    return cert == null;
  }

  bool get isDiableChangeInfoButton {
    // Nếu không có username MySign thì disable
    if (isUsernameMySignEmpty.value) {
      return true;
    }
    return certificate.value == null;
  }
}
