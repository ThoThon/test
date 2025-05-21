import 'package:v_bhxh/modules/declare/declaration_period/repository/declaration_period_repository.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../base_app/base_app.src.dart';

class DeclarationPeriodController extends BaseGetxController {
  final argument = Get.arguments as Procedure;

  late final _repository = DeclarationPeriodRepository(this);

  final selectedPeriodDate = DateTime.now().obs;

  final declarationPeriods = <DeclarationPeriod>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getDeclarationPeriods();
  }

  Future<void> _getDeclarationPeriods() async {
    try {
      showLoading();
      declarationPeriods.clear();
      final response = await _repository.getDeclarationPeriods(
        request: ListDeclarationPeriodRequest(
          periodId: argument.type,
          month: selectedPeriodDate.value.month,
          year: selectedPeriodDate.value.year,
        ),
      );

      if (response.isSuccess) {
        declarationPeriods.value = response.result?.periods ?? [];
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker(
      dateTime: selectedPeriodDate.value,
    );
    if (date != null) {
      selectedPeriodDate.value = date;
      _getDeclarationPeriods();
    }
  }

  void showDialogDeletePeriod(DeclarationPeriod period) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa "${period.period}"',
      content: 'Xóa đợt kê khai cũng sẽ xóa toàn bộ dữ liệu của đợt kê khai',
      confirmTitle: 'Xóa',
      onConfirm: () {},
    );
  }
}
