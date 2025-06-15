import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryDetailDeclareController extends BaseGetxController {
  late final HistoryDeclareItemModel historyDeclareItem;

  final argument = Get.arguments as HistoryDeclareItemModel;

  late final _historyDetaiDeclareRepository =
      HistoryDetailDeclareRepository(this);

  ResultLookupHistoryDeclareModel? resultLookupHistoryModel;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    historyDeclareItem = argument;
  }

  Future<void> getFileNumber(String key) async {
    // Nếu không có số hồ sơ thì sẽ gọi api này để lấy số hồ sơ
    try {
      showLoadingOverlay();
      final res = await _historyDetaiDeclareRepository.getFileNumber(key);
      if (res.result != null && res.isSuccess) {
        if (res.result!.rHRecordNumber.isNotEmpty) {
          // Tra cứu số hồ sơ thành công thì gọi đến tra cứu lịch sử
          await lookupProgressHistory(res.result?.rHRecordNumber ?? '');

          // Cập nhật số hồ sơ
          historyDeclareItem.soHoSo = res.result?.rHRecordNumber ?? '';
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
      final res =
          await _historyDetaiDeclareRepository.lookupProcessHistory(soHoSo);
      if (res.isSuccess) {
        resultLookupHistoryModel = res.result;

        // Kiểm tra Bước 1 xem có null hay không
        if (resultLookupHistoryModel!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
        } else {
          // Cập nhật trạng thái
          historyDeclareItem.trangThai = res.result?.trangThai ?? '';
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
