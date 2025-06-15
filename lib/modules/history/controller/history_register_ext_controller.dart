part of 'history_controller.dart';

extension HistoryRegisterExtController on HistoryController {
  HistoryRegisterRequest _buildRequestHistoryRegister({
    bool isLoadMore = false,
  }) {
    return HistoryRegisterRequest(
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

  Future<void> getHistoryRegister({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequestHistoryRegister(isLoadMore: isLoadMore);
    try {
      final response = await _historyRepository.getHistoryRegister(request);
      if (response.isSuccess && response.result != null) {
        listHistoryRegister.addAll(response.result!.historyResults);
        pageHistoryRegister = request.pageIndex;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
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
