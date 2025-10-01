import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/snack_bar_type.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/use_case/declare_history_lookup_result_use_case.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/use_case/get_file_number_use_case.dart';

import '../../../history/history_src.dart';
import '../../../src.dart';

class HistoryDetailDeclareController extends BaseGetClController {
  final DeclareHistoryLookupResultUseCase _declareHistoryLookupResultUseCase;
  final GetFileNumberUseCase _getFileNumberUseCase;
  final DeclarationHistoryItem argument;
  HistoryDetailDeclareController(
    this._declareHistoryLookupResultUseCase,
    this._getFileNumberUseCase, {
    required this.argument,
  });

  // Nếu không có số hồ sơ thì sẽ gọi api này để lấy số hồ sơ
  Future<void> getFileNumber(String key) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final res = await _getFileNumberUseCase.execute(key);
        await _look
      },
    );
  }

  // Future<void> getFileNumber(String key) async {
  //   // Nếu không có số hồ sơ thì sẽ gọi api này để lấy số hồ sơ
  //   try {
  //     showLoadingOverlay();
  //     final res = await _historyDetaiDeclareRepository.getFileNumber(key);
  //     if (res.result != null && res.isSuccess) {
  //       if (res.result!.rHRecordNumber.isNotEmpty) {
  //         // Tra cứu số hồ sơ thành công thì gọi đến tra cứu lịch sử
  //         await lookupProgressHistory(res.result?.rHRecordNumber ?? '');
  //         // Cập nhật số hồ sơ
  //         argument.value?.copyWith(
  //           dossierNumber: res.result?.rHRecordNumber ?? '',
  //         );
  //       } else {
  //         showSnackBar(res.errorMessage);
  //       }
  //     } else {
  //       showSnackBar(res.errorMessage);
  //     }
  //   } catch (e) {
  //     logger.d(e);
  //   } finally {
  //     hideLoadingOverlay();
  //   }
  // }

  Future<void> lookupProgressHistory(String soHoSo) async {
    return buildState(action: () async{
      final res =
          await _historyDetaiDeclareRepository.lookupProcessHistory(soHoSo);
      if (res.isSuccess) {
        resultLookupHistoryDeclare = res.result;

        // Kiểm tra Bước 1 xem có null hay không
        if (resultLookupHistoryDeclare!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(res.errorMessage);
        } else {
          // Cập nhật trạng thái
          argument.value?.copyWith(
            status: res.result?.trangThai ?? '',
          );
          nav.showSnackBar(
            LocaleKeys.history_lookupSuccess.tr,
            type: SnackBarType.info,
            align: const Alignment(0.0, 0.8),
          );
        }
      }
    },);
  }
}
