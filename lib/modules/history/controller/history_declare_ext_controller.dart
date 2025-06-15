part of 'history_controller.dart';

extension HistoryDeclareExtController on HistoryController {
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

  Future<void> getHistoryDeclare({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequestHistoryDeclare(isLoadMore: isLoadMore);
    try {
      final response = await _historyRepository.getHistoryDeclare(request);
      if (response.result != null && response.isSuccess) {
        listHistoryDeclare.addAll(response.result!.historyResults);
        pageHistoryDeclare = request.pageIndex;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  HistoryDeclareRequest _buildRequestHistoryDeclare({
    bool isLoadMore = false,
  }) {
    return HistoryDeclareRequest(
      companyId: AppData.instance.accountInfoModel.value?.toChucId ?? '',
      pageIndex: isLoadMore ? pageHistoryDeclare + 1 : AppConst.defaultPageNumber,
      pageSize: Get.context?.isTablet ?? false
          ? AppConst.largePageSize
          : AppConst.defaultPageSize,
      nam: selectedPeriodDate.value.year.toString(),
      thang: selectedPeriodDate.value.month.toString(),
      maThuTuc: selectProcedure.value?.loai.toString() ?? '',
      soHoSo: searchController.text.trim(),
    );
  }

  Future<void> onLoadMoreDeclare() async {
    await getHistoryDeclare(isLoadMore: true);
    declareRefreshCtrl.loadComplete();
  }

  Future<void> onRefreshDeclare() async {
    listHistoryDeclare.clear();
    await getHistoryDeclare();
    declareRefreshCtrl.refreshCompleted();
  }
}
