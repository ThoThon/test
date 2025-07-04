import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/history_detail_register/model/result_lookup_history_register_model.dart';
import 'package:v_bhxh/modules/src.dart';

import '../repository/history_detail_register_repository_model.dart';

class HistoryDetailRegisterController extends BaseGetxController {
  late final _historyDetaiRepository = HistoryDetailRegisterRepository(this);

  ResultLookupHistoryRegisterModel? resultLookupHistoryRegister;

  late final HistoryRegisterItemModel historyRegisterItem;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    final args = Get.arguments;
    if (args == null) return;
    if (args is HistoryRegisterItemModel) {
      historyRegisterItem = args;
    }
    return;
  }

  Future<void> lookupHistoryRegister() async {
    try {
      showLoadingOverlay();
      final res = await _historyDetaiRepository
          .lookupHistoryRegister(historyRegisterItem.messId);
      if (res.isSuccess && res.result != null) {
        resultLookupHistoryRegister = res.result;

        // Kiểm tra Bước 1 xem có null hay không
        if (resultLookupHistoryRegister!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(res.errorMessage);
        } else {
          // Cập nhật trạng thái và số hồ sơ
          historyRegisterItem
            ..trangThaiTK = res.result?.trangThai ?? ''
            ..soHoSo = res.result?.soHoSo ?? '';
          showSnackBarCustom(
            LocaleKeys.history_lookupSuccess.tr,
            duration: const Duration(seconds: 3),
            align: const Alignment(2.0, 0.8),
          );
        }
      } else {
        showSnackBar(res.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
