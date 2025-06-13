import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../base_app/base_app.src.dart';
import '../repository/history_repository.dart';

class HistoryController extends BasePageSearchController<HistoryResponse> {
  final listHistoryDeclare = <HistoryDeclareItemModel>[].obs;

  final listHistoryRegister = <HistoryRegisterItemModel>[].obs;

  late final _historyRepository = HistoryRepository(this);

  final currentTab = HistoryTabEnum.file_declare.obs;

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
    getListHistoryDeclare();
    getHistoryRegister();
  }

  Future<void> getListHistoryDeclare({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequest(isLoadMore: isLoadMore);
    try {
      final response = await _historyRepository.getHistoryDeclare(request);
      if (response.result != null && response.isSuccess) {
        listHistoryDeclare.addAll(response.result!.historyResults);
        page = request.pageIndex;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  HistoryDeclareRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return HistoryDeclareRequest(
      companyId: AppData.instance.accountInfoModel.value?.toChucId ?? '',
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: Get.context?.isTablet ?? false
          ? AppConst.largePageSize
          : AppConst.defaultPageSize,
      nam: selectedPeriodDate.value.year.toString(),
      thang: selectedPeriodDate.value.month.toString(),
      maThuTuc: selectProcedure.value?.loai.toString() ?? '',
      soHoSo: searchController.text,
    );
  }

  @override
  Future<void> onLoadMore() async {
    await getListHistoryDeclare(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    listHistoryDeclare.clear();
    await getListHistoryDeclare();
    refreshController.refreshCompleted();
  }

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker(
      dateTime: selectedPeriodDate.value,
    );
    if (date != null) {
      selectedPeriodDate.value = date;
      listHistoryDeclare.clear();
      getListHistoryDeclare();
    }
  }

  Future<void> getProcedureFilter() async {
    try {
      showLoading();
      final res = await _historyRepository.getListProcedureFilter();
      if (res.result.isNotEmpty && res.isSuccess) {
        listProcedureFilter.addAll(res.result);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  void backToHome() {
    Get.until(ModalRoute.withName(AppRoutes.home.path));
  }

  @override
  Future<void> functionSearch() async {
    debouncer(
      () {
        onRefresh();
      },
    );
  }

  void onTabChanged(HistoryTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }

  Future<void> getHistoryRegister() async {
    try {
      showLoading();
      final response = await _historyRepository.getHistoryRegister(
        HistoryRegisterRequest(
          pageIndex: 1,
          pageSize: 100,
          thang: 6,
          nam: 2025,
        ),
      );
      if (response.isSuccess && response.result != null) {
        listHistoryRegister.value = response.result!.historyResults;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }
}
