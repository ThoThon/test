import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../domain/entity/lookup_c12.dart';
import '../../domain/usecase/get_c12_file_use_case.dart';

class LookupC12Controller extends BaseGetClController {
  final GetC12FileUseCase _getC12FileUseCase;

  final selectedYear = DateTime.now().obs;

  final listFileC12 = <LookupC12>[].obs;

  LookupC12Controller(this._getC12FileUseCase);

  @override
  void onInit() {
    super.onInit();
    getC12File();
  }

  void pickPeriodDate() async {
    final date = await DatePickerUtils.showCalendarPicker(
      title: LocaleKeys.dialog_selectYear.tr,
      dateFormat: PATTERN_13,
      dateTimeInit: selectedYear.value,
    );
    if (date != null) {
      selectedYear.value = date;
      listFileC12.clear();
      getC12File();
    }
  }

  Future<void> getC12File() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        listFileC12.value =
            await _getC12FileUseCase.execute(selectedYear.value.year);
        nav.showSnackBar(
          LocaleKeys.history_lookupSuccess.tr,
          type: SnackBarType.info,
          align: const Alignment(0.0, 0.8),
        );
      },
    );
  }
}
