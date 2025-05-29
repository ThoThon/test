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
    getDeclarationPeriods();
  }

  Future<void> getDeclarationPeriods() async {
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
      getDeclarationPeriods();
    }
  }

  void showDialogDeletePeriod(DeclarationPeriod period) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa "${period.period}"',
      content: 'Xóa đợt kê khai cũng sẽ xóa toàn bộ dữ liệu của đợt kê khai',
      confirmTitle: 'Xóa',
      onConfirm: () {
        deleteDeclarationPeriod(period);
      },
    );
  }

  Future<void> deleteDeclarationPeriod(DeclarationPeriod period) async {
    try {
      showLoadingOverlay();
      final response = await _repository.deleteDeclarationPeriod(
        id: period.id,
      );

      if (response.isSuccess) {
        showSnackBar('Xóa đợt kê khai thành công');
        getDeclarationPeriods();
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> createDeclarationPeriod() async {
    try {
      showLoadingOverlay();
      final response = await _repository.createDeclarationPeriod(
        request: CreateDeclarationPeriodRequest(
          maThuTuc: argument.type,
          nam: selectedPeriodDate.value.year,
          thang: selectedPeriodDate.value.month,
        ),
      );

      if (response.isSuccess && response.result != null) {
        Get.toNamed(
          AppRoutes.declareInfo.path,
          arguments: DeclareInfoArgument(
            declarationPeriodId: response.result!.id,
          ),
        );
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
