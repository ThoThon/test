import 'package:v_bhxh/modules/declare/declaration_period/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

class DeclarationPeriodController extends BaseGetxController {
  final selectedPeriodDate = DateTime.now().obs;

  final declarationPeriods = <DeclarationPeriodModel>[
    DeclarationPeriodModel(
      id: 1,
      title: 'Đợt 1',
      updateDate: DateTime.now(),
      status: DeclarationStatus.draft,
    ),
    DeclarationPeriodModel(
      id: 2,
      title: 'Đợt 2',
      updateDate: DateTime.now(),
      fileNumber: '01234/2025/00101',
      status: DeclarationStatus.sent,
    ),
    DeclarationPeriodModel(
      id: 3,
      title: 'Đợt 3',
      updateDate: DateTime.now(),
      status: DeclarationStatus.draft,
    ),
    DeclarationPeriodModel(
      id: 4,
      title: 'Đợt 4',
      updateDate: DateTime.now(),
      fileNumber: '01234/2025/00101',
      status: DeclarationStatus.sent,
    ),
  ].obs;

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker();
    if (date != null) {
      selectedPeriodDate.value = date;
    }
  }
}
