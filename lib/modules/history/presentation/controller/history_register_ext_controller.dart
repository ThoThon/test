part of 'history_controller.dart';

extension HistoryRegisterExtController on HistoryController {
  RegisterHistoryListRequest _buildRequestHistoryRegister({
    bool isLoadMore = false,
  }) {
    return RegisterHistoryListRequest(
      pageIndex:
          isLoadMore ? pageHistoryRegister + 1 : AppConst.defaultPageNumber,
      pageSize: Get.context?.isTablet ?? false
          ? AppConst.largePageSize
          : AppConst.defaultPageSize,
      nam: selectedPeriodDate.value.year,
      thang: selectedPeriodDate.value.month,
      soHoSo: searchController.text.trim(),
      loaiGiaoDich: selectFilterHistoryRegister.value.type,
    );
  }

  Future<void> getHistoryRegister({
    bool isLoadMore = false,
  }) async {
    final request = _buildRequestHistoryRegister(isLoadMore: isLoadMore);
    return buildState(
      showLoading: !isLoadMore,
      action: () async {
        final response = await _getRegisterHistoryListUseCase.execute(request);
        listHistoryRegister.addAll(response.historyResults);
        pageHistoryRegister = request.pageIndex;
      },
    );
  }

  Future<void> onLoadMoreRegister() async {
    await getHistoryRegister(isLoadMore: true);
    registerRefreshCtrl.loadComplete();
  }

  Future<void> onRefreshRegister() async {
    listHistoryRegister.clear();
    await getHistoryRegister();
    registerRefreshCtrl.refreshCompleted();
  }
}
