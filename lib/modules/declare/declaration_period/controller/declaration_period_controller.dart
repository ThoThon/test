import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../base_app/base_app.src.dart';

class DeclarationPeriodController extends BaseGetxController {
  final selectedPeriodDate = DateTime.now().obs;

  final declarationPeriods = <DeclarationPeriodModel>[
    DeclarationPeriodModel(
      id: 1,
      title: 'Đợt 1',
      updateDate: DateTime.now(),
      status: DeclarationStatus.draft,
      type: DeclarationTypeEnum.increaseLabor,
    ),
    DeclarationPeriodModel(
      id: 2,
      title: 'Đợt 2',
      updateDate: DateTime.now(),
      fileNumber: '01234/2025/00101',
      status: DeclarationStatus.sent,
      type: DeclarationTypeEnum.decreaseLabor,
    ),
    DeclarationPeriodModel(
      id: 3,
      title: 'Đợt 3',
      updateDate: DateTime.now(),
      status: DeclarationStatus.draft,
      type: DeclarationTypeEnum.increaseSalary,
    ),
    DeclarationPeriodModel(
      id: 4,
      title: 'Đợt 4',
      updateDate: DateTime.now(),
      fileNumber: '01234/2025/00101',
      status: DeclarationStatus.sent,
      type: DeclarationTypeEnum.decreaseSalary,
    ),
  ].obs;

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker();
    if (date != null) {
      selectedPeriodDate.value = date;
    }
  }

  void showDialogDeletePeriod(DeclarationPeriodModel period) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa "${period.title}"',
      content: 'Xóa đợt kê khai cũng sẽ xóa toàn bộ dữ liệu của đợt kê khai',
      confirmTitle: 'Xóa',
      onConfirm: () {},
    );
  }
}
