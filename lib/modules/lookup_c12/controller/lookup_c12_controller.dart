import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/lookup_c12/model/file_c12_model.dart';
import 'package:v_bhxh/modules/lookup_c12/repository/lookup_c12_repository.dart';
import 'package:v_bhxh/modules/src.dart';

class LookupC12Controller extends BaseGetxController {
  final selectedYear = DateTime.now().obs;

  final listFileC12 = <FileC12Model>[].obs;

  late final _lookupC12Repository = LookupC12Repository(this);

  @override
  void onInit() {
    super.onInit();
    getC12File();
  }

  void pickPeriodDate() async {
    final date = await UtilWidget.showYearLookUp(
      dateTime: selectedYear.value,
    );
    if (date != null) {
      selectedYear.value = DateTime(date);
      listFileC12.clear();
      getC12File();
    }
  }

  Future<void> getC12File() async {
    showLoadingOverlay();
    try {
      final response =
          await _lookupC12Repository.getC12File(selectedYear.value.year);
      if (response.result.isNotEmpty && response.isSuccess) {
        listFileC12.addAll(response.result);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
