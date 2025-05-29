import 'package:v_bhxh/modules/src.dart';

import '../../../base_app/base_app.src.dart';
import '../models/model_src.dart';

class HistoryController extends BaseRefreshGetxController {
  final listHistory = <HistoryItemModel>[].obs;

  late final historyRepository = HistoryRepository(this);

  int page = AppConst.defaultPageNumber;

  final selectedPeriodDate = DateTime.now().obs;

  final selectProcedure = Rx<ListProcedureFilterModel?>(null);

  final listProcedureFilter = <ListProcedureFilterModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Thêm option "Tất cả" cho bộ lọc thủ tục
    listProcedureFilter.add(
      ListProcedureFilterModel(
        ten: LocaleKeys.history_all.tr,
        tenCha: '',
        loai: '',
        ma: '',
        ghiChu: '',
      ),
    );
    getProcedureFilter();
    getListHistory();
  }

  Future<void> getListHistory({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequest(isLoadMore: isLoadMore);
    try {
      final response = await historyRepository.getHistory(request);
      if (response.result != null && response.isSuccess) {
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
      companyId: AppData.instance.accountInfoModel.value?.toChucId ?? '',
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: AppConst.defaultPageSize,
      nam: selectedPeriodDate.value.year.toString(),
      thang: selectedPeriodDate.value.month.toString(),
      maThuTuc: selectProcedure.value?.loai.toString() ?? '',
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

  Future<void> getProcedureFilter() async {
    try {
      showLoading();
      final res = await historyRepository.getListProcedureFilter();
      if (res.result.isNotEmpty && res.isSuccess) {
        listProcedureFilter.addAll(res.result);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  void backToHome() {
    Get.until(ModalRoute.withName(AppRoutes.pageBuilder.path));
  }
}
