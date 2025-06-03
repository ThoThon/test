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
        if (res.result!.rHRecordNumber.isNotEmpty) {
          await lookupProgressHistory(res.result?.rHRecordNumber ?? '');
        } else {
          showSnackBar(LocaleKeys.history_cannotLookupFileNumber.tr);
        }
      } else {
        showSnackBar(LocaleKeys.history_error.tr);
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
        if (resultLookupHistoryModel!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
        } else {
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
