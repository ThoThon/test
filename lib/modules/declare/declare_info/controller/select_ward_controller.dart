import 'package:v_bhxh/base_app/controllers_base/base_controller.src.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectWardController extends BaseGetxController {
  final String provinceCode;

  SelectWardController({
    required this.provinceCode,
    Ward? ward,
  }) {
    selectedWard.value = ward;
  }

  late final _repository = DeclareInfoRepository(this);

  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;
  final selectedWard = Rxn<Ward>();
  final wards = <Ward>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getWards();
  }

  Future<void> _getWards() async {
    try {
      showLoading();
      final response = await _repository.getWards(
        provinceCode: provinceCode,
      );
      if (response.isSuccess) {
        wards.value = response.result;
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
