import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectHospitalController extends BaseGetxController {
  final String provinceCode;

  SelectHospitalController({
    required this.provinceCode,
    Hospital? hospital,
  }) {
    selectedHospital.value = hospital;
  }

  late final _repository = DeclareInfoRepository(this);

  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;
  final selectedHospital = Rxn<Hospital>();
  final hospitals = <Hospital>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getHospitals();
  }

  Future<void> _getHospitals() async {
    try {
      showLoading();
      final response = await _repository.getHospitals(
        provinceCode: provinceCode,
      );
      if (response.isSuccess) {
        hospitals.value = response.result;
      } else {
        showSnackBar(
          response.errorMessage ?? LocaleKeys.app_someThingWentWrong.tr,
        );
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  @override
  void onClose() {
    searchTextCtrl.dispose();
    super.onClose();
  }
}
