import 'package:path/path.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';

import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';

class RegisterCodeController extends BaseGetxController {
  final currentTab = RegisterCodeTabEnum.commmon_info.obs;

  // Mã số thuế
  final taxCodeCtrl = TextEditingController();

  // Tên đơn vị
  final unitNameCtrl = TextEditingController();

  // Loại đối tượng
  final selectedObject = Rx<ObjectTypeEnum?>(null);

  // Loại hình đơn vị
  final unitTypeCtrl = TextEditingController();

  // Ngành nghề sản xuất
  final productIndustryCtrl = TextEditingController();

  // Số quyết định
  final decisionNumberCtrl = TextEditingController();

  // Ngày lập
  final setupDateCtrl = TextEditingController();

  // Ngày đăng ký
  final registerDateCtrl = TextEditingController();

  // Nơi cấp quyết định
  final addressDecisionCtrl = TextEditingController();

  // Địa chỉ đăng ký kinh doanh
  final addressRegisterBusinessCtrl = TextEditingController();

  // Địa chỉ đơn vị
  final addressUnitCtrl = TextEditingController();

  // Điện thoại đơn vị
  final phoneUnitCtrl = TextEditingController();

  // Email đơn vị
  final emailUnitCtrl = TextEditingController();

  // Người giao dịch BHXH
  final personTransactionBhxhCtrl = TextEditingController();

  // Điện thoại liên hệ
  final phoneContactCtrl = TextEditingController();

  // Cơ quan BHXH
  final socialAgency = Rxn<SocialAgencyModel>();

  // Nơi nhận tỉnh
  final provinceReceive = Rxn<ProvinceModel>();

  // Nơi nhận huyện
  final districtReceive = Rxn<DistrictModel>();

  final listDistrictReceive = <DistrictModel>[].obs;

  // Nơi nhận xã
  final wardReceive = Rxn<WardModel>();

  final listWardReceive = <WardModel>[].obs;
  // Đăng ký nhận kết quả
  final registerResult = Rxn<RegisterReceiveResultModel>();

  // Phương thức nhận kết quả
  final resultReceiveMethod = Rxn<ReceiveMethodModel>();

  // Phương thức đóng
  final paymentMethod = Rxn<PaymentMethodModel>();

  // Tên đăng nhập MySign
  final usernameMySignCtrl = TextEditingController();

  // Hồ sơ kèm theo
  final fileIncludeCtrl = TextEditingController();

  // Nội dung
  final contentCtrl = TextEditingController();

  late final _registerCodeRepository = RegisterCodeRepository(this);

  final certificate = Rxn<CertificateModel>();

  final listCert = <CertificateModel>[].obs;

  final imagePath = Rxn<String>();

  final listImage = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getRegisterFirstCategories();
  }

  void onTabChanged(RegisterCodeTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }

  Future<void> getRegisterFirstCategories() async {
    try {
      showLoadingOverlay();
      final response =
          await _registerCodeRepository.getRegisterFirstCategories();
      final registerCategories = response.result;
      if (registerCategories != null && response.isSuccess) {
        AppData.instance
          ..provinces = registerCategories.provinces
          ..socialAgency = registerCategories.agencies
          ..receiveMethod = registerCategories.receiveMethods
          ..paymentMethods = registerCategories.paymentMethods
          ..resultReceivingOptions = registerCategories.resultReceivingOptions;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void changeProvinceReceive(ProvinceModel value) {
    if (provinceReceive.value != value) {
      districtReceive.value = null;
      wardReceive.value = null;
    }
    provinceReceive.value = value;
  }

  void changeDistrictReceive(DistrictModel value) {
    if (districtReceive.value != value) {
      wardReceive.value = null;
    }
    districtReceive.value = value;
  }

  void changeWardReceive(WardModel value) {
    wardReceive.value = value;
  }

  Future<void> fetchListCert() async {
    try {
      showLoadingOverlay();
      listCert.clear();
      final response =
          await _registerCodeRepository.getListCert(usernameMySignCtrl.text);
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

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      listImage.add(path);
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      listImage.add(path);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void deleteImage(int index) {
    listImage.removeAt(index);
  }
}
