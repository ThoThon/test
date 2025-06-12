import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/register_service/model/certificate_model.dart';
import 'package:v_bhxh/modules/register_service/repository/repository_src.dart';
import 'package:v_bhxh/modules/register_service/ui/select_certificate_bts.dart';
import 'package:v_bhxh/modules/src.dart';

class RegisterServiceController extends BaseGetxController {
  final usernameMySignCtrl = TextEditingController();
  final listCert = <CertificateModel>[].obs;

  final certificate = Rxn<CertificateModel>();

  late final _registerServiceRepository = RegisterServiceRepository(this);

  // userID dùng để test
  // 0105987432_tk3

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

  Future<void> selectCertificate() async {
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
}
