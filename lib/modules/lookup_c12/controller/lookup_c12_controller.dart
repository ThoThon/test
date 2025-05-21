import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/src.dart';

class LookupC12Controller extends BaseGetxController {
  final selectedYear = DateTime.now().obs;

  void pickPeriodDate() async {
    final date = await UtilWidget.showYearLookUp(
      dateTime: selectedYear.value,
    );
    if (date != null) {
      selectedYear.value = DateTime(date);
    }
  }
}
