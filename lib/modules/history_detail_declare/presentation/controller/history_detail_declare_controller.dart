import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';

import '../../../../clean/core/presentation/navigation/navigation_src.dart';
import '../../../history/domain/entity/declaration_history_step.dart';
import '../../../src.dart';

class HistoryDetailDeclareController extends BaseGetClController {
  final historyDeclareItem = Rxn<DeclarationHistoryItem>();

  final DeclareHistoryLookupResultUseCase _declareHistoryLookupResultUseCase;
  final GetFileNumberUseCase _getFileNumberUseCase;
  final DeclarationHistoryItem argument;

  HistoryDetailDeclareController(
    this._declareHistoryLookupResultUseCase,
    this._getFileNumberUseCase, {
    required this.argument,
  });

  bool hasLookup = false;

  @override
  void onInit() async {
    super.onInit();
    historyDeclareItem.value = argument;
  }

  Future<void> lookupProgressHistory() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        if (historyDeclareItem.value?.dossierNumber == null) {
          // Nếu không có số hồ sơ thì sẽ gọi api này để lấy số hồ sơ
          final fileNumber = await _getFileNumberUseCase.execute(
            historyDeclareItem.value?.id ?? '',
          );
          historyDeclareItem.value = historyDeclareItem.value?.copyWith(
            dossierNumber: fileNumber.recordNumber,
          );
        }

        final res = await _declareHistoryLookupResultUseCase.execute(
          historyDeclareItem.value?.dossierNumber ?? '',
        );

        final resultFirstStep = historyDeclareItem.value?.steps[0].result ?? '';

        historyDeclareItem.value = historyDeclareItem.value?.copyWith(
          status: res.status,
          steps: [
            DeclarationHistoryStep(
              status: res.step1?.isSuccessStep ?? false,
              // REF: VBHXHMOB-142
              // Nếu có bước 1 rồi thì không cần cập nhật nữa

              result: resultFirstStep.isEmpty
                  ? res.step1?.resultDescription ?? ''
                  : resultFirstStep,
            ),
            DeclarationHistoryStep(
              status: res.step2?.isSuccessStep ?? false,
              result: res.step2?.resultDescription ?? '',
            ),
            DeclarationHistoryStep(
              status: res.step3?.isSuccessStep ?? false,
              result: res.step3?.resultDescription ?? '',
            ),
            DeclarationHistoryStep(
              status: res.step4?.isSuccessStep ?? false,
              result: res.step4?.resultDescription ?? '',
            ),
          ],
        );
        hasLookup = true;
        nav.showSnackBar(
          type: SnackBarType.info,
          LocaleKeys.history_lookupSuccess.tr,
          align: const Alignment(0.0, 0.8),
        );
      },
    );
  }
}
