import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryDetailDeclareController extends BaseGetxController {
  late final HistoryDeclareItemModel historyDeclareItem;

  late final _historyDetaiDeclareRepository =
      HistoryDetailDeclareRepository(this);

  ResultLookupHistoryDeclareModel? resultLookupHistoryDeclare;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    final args = Get.arguments;
    if (args == null) return;
    if (args is HistoryDeclareItemModel) {
      historyDeclareItem = args;
    }
    return;
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
          showSnackBar(res.errorMessage);
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

  Future<void> lookupProgressHistory(String soHoSo) async {
    try {
      showLoadingOverlay();
      final res =
          await _historyDetaiDeclareRepository.lookupProcessHistory(soHoSo);
      if (res.isSuccess) {
        resultLookupHistoryDeclare = res.result;

        // Kiểm tra Bước 1 xem có null hay không
        if (resultLookupHistoryDeclare!.buoc1!.maKetQua.isEmpty) {
          showSnackBar(res.errorMessage);
        } else {
          // Cập nhật trạng thái
          historyDeclareItem.trangThai = res.result?.trangThai ?? '';
          showSnackBarCustom(
            LocaleKeys.history_lookupSuccess.tr,
            duration: const Duration(seconds: 3),
            align: Alignment(2.0, 0.8),
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
