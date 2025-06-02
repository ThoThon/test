import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryDetailController extends BaseGetxController {
  late final HistoryItemModel historyItemModel;

  late final historyDetaiRepository = HistoryDetaiRepository(this);

  ResultLookupHistoryModel? resultLookupHistoryModel;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    final arg = Get.arguments;
    if (arg is HistoryItemModel) {
      historyItemModel = arg;
    }
  }

  Future<void> getFileNumber(String key) async {
    // Nếu chi tiết lịch sử trống thì sẽ gọi api này để lấy số hồ sơ
    try {
      showLoadingOverlay();
      final res = await historyDetaiRepository.getFileNumber(key);
      if (res.result != null && res.isSuccess) {
        lookupProgressHistory(res.result?.rHRecordNumber ?? '');
      } else {
        showSnackBar("Tra cứu số hồ sơ bị lỗi");
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> lookupProgressHistory(String soHoSo) async {
    try {
      showLoadingOverlay();
      final res = await historyDetaiRepository.lookupProcessHistory(soHoSo);
      if (res.isSuccess) {
        resultLookupHistoryModel = res.result;
        showSnackBar(
          "Tra cứu thành công",
          typeAction: AppConst.actionSuccess,
        );
        if (res.result!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
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
