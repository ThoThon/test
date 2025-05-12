import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../models/model_src.dart';

class HistoryController extends BaseRefreshGetxController {
  final listHistory = <HistoryItemModel>[].obs;

  late final historyRepository = HistoryRepository(this);

  @override
  void onInit() {
    super.onInit();
    getListHistory();
  }

  Future<void> getListHistory() async {
    callAPIBE(
      isShowLoading: true,
      functionAPI: historyRepository.getHistory(
        HistoryRequest(
          pageIndex: 1,
          pageSize: 40,
          nam: "2025",
          thang: "",
          maThuTuc: "",
          soHoSo: "",
        ),
      ),
      functionSuccess: (result) {
        listHistory.value = result!.historyResults;
      },
    );
  }

  @override
  Future<void> onLoadMore() async {}

  @override
  Future<void> onRefresh() async {
    await getListHistory();
    refreshController.refreshCompleted();
  }
}
