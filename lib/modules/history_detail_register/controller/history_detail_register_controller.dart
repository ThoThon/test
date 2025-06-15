import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/history_detail_register/model/result_lookup_history_register_model.dart';
import 'package:v_bhxh/modules/src.dart';

import '../repository/history_detail_register_repository_model.dart';

class HistoryDetailRegisterController extends BaseGetxController {
  late final _historyDetaiRepository = HistoryDetailRegisterRepository(this);

  ResultLookupHistoryRegisterModel? resultLookupHistoryModel;

  final argument = Get.arguments as HistoryRegisterItemModel;

  late final HistoryRegisterItemModel historyRegisterItem;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    historyRegisterItem = argument;
  }

  Future<void> lookupHistoryRegister() async {
    try {
      showLoadingOverlay();
      final res = await _historyDetaiRepository
          .lookupHistoryRegister(historyRegisterItem.messId);
      if (res.isSuccess && res.result != null) {
        resultLookupHistoryModel = res.result;

        // Kiểm tra Bước 1 xem có null hay không
        if (resultLookupHistoryModel!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
        } else {
          // Cập nhật trạng thái
          historyRegisterItem
            ..trangThaiTK = res.result?.trangThai ?? ''
            ..soHoSo = res.result?.soHoSo ?? ''
            ..thoiGianGui = res.result?.thoiGianGui ?? '';
          showSnackBar(
            LocaleKeys.history_lookupSuccess.tr,
            typeAction: AppConst.actionSuccess,
          );
        }
      } else {
        showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
