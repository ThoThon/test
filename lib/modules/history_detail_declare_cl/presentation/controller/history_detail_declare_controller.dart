import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';

import '../../../../clean/core/presentation/navigation/navigation_src.dart';
import '../../../src.dart';
import '../../domain/use_case/declare_history_lookup_result_use_case.dart';
import '../../domain/use_case/get_file_number_use_case.dart';

class HistoryDetailDeclareController extends BaseGetClController {
  final historyDeclareItem = Rxn<DeclarationHistoryItem>();

  final DeclareHistoryLookupResultUseCase _declareHistoryLookupResultUseCase;
  final GetFileNumberUseCase _getFileNumberUseCase;
  // final DeclarationHistoryItem argument;

  HistoryDetailDeclareController(
    this._declareHistoryLookupResultUseCase,
    this._getFileNumberUseCase,
    //   {
    //   required this.argument,
    // }
  );

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    final args = Get.arguments;
    if (args == null) return;
    if (args is DeclarationHistoryItem) {
      historyDeclareItem.value = args;
    }
    return;
  }

  // Nếu không có số hồ sơ thì sẽ gọi api này để lấy số hồ sơ
  Future<void> getFileNumber(String key) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await _getFileNumberUseCase.execute(key);
        historyDeclareItem.value = historyDeclareItem.value?.copyWith(
          dossierNumber: response.code,
        );
      },
    );
  }

  Future<void> lookupProgressHistory(String soHoSo) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final res = await _declareHistoryLookupResultUseCase.execute(soHoSo);
        historyDeclareItem.value = historyDeclareItem.value?.copyWith(
          status: res.status,
          step1ErrorCode: res.step1?.resultCode,
          step2ErrorCode: res.step2?.resultCode,
          step3ErrorCode: res.step3?.resultCode,
          step4ErrorCode: res.step4?.resultCode,
          step1Result: res.step1?.resultDescription,
          step2Result: res.step2?.resultDescription,
          step3Result: res.step3?.resultDescription,
          step4Result: res.step4?.resultDescription,
        );
        nav.showSnackBar(
          type: SnackBarType.info,
          LocaleKeys.history_lookupSuccess.tr,
          align: const Alignment(0.0, 0.8),
        );
      },
    );
  }
}
