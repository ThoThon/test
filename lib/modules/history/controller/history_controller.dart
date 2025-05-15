import 'package:v_bhxh/modules/src.dart';

import '../../../base_app/base_app.src.dart';
import '../models/model_src.dart';

class HistoryController extends BaseRefreshGetxController {
  final listHistory = <HistoryItemModel>[].obs;

  late final historyRepository = HistoryRepository(this);

  final appController = Get.find<AppController>();

  int page = AppConst.defaultPageNumber;

  final selectedPeriodDate = DateTime.now().obs;

  Rx<ProcedureFilterEnum?> selectProcedure = Rx<ProcedureFilterEnum?>(null);
  @override
  void onInit() {
    super.onInit();
    selectProcedure.value = ProcedureFilterEnum.all;
    getListHistory();
  }

  Future<void> getListHistory({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequest(isLoadMore: isLoadMore);
    try {
      final response = await historyRepository.getHistory(request);
      if (response.result!.historyResults.isNotEmpty) {
        listHistory.addAll(response.result!.historyResults);
        page = request.pageIndex;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  HistoryRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return HistoryRequest(
      companyId: appController.accountInfoModel!.toChucId,
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: AppConst.defaultPageSize,
      nam: selectedPeriodDate.value.year.toString(),
      thang: selectedPeriodDate.value.month.toString(),
      maThuTuc: selectProcedure.value?.procedureCode,
      soHoSo: "",
    );
  }

  @override
  Future<void> onLoadMore() async {
    await getListHistory(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    listHistory.clear();
    await getListHistory();
    refreshController.refreshCompleted();
  }

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker(
      dateTime: selectedPeriodDate.value,
    );
    if (date != null) {
      selectedPeriodDate.value = date;
      listHistory.clear();
      getListHistory();
    }
  }

  void backToHome() {
    Get.until(ModalRoute.withName(AppRoutes.pageBuilder.path));
  }
}
