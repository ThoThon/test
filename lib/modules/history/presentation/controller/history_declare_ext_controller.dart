part of 'history_controller.dart';

extension HistoryDeclareExtController on HistoryController {
  Future<void> getProcedureFilter() async {
    return buildState(
      action: () async {
        final res = await _getProcedureListFilterUseCase.execute();
        listProcedureFilter.addAll(res);
      },
    );
  }

  Future<void> getHistoryDeclare({bool isLoadMore = false}) async {
    final request = _buildRequestHistoryDeclare(isLoadMore: isLoadMore);
    return buildState(
      showLoading: !isLoadMore,
      action: () async {
        final response =
            await _getDeclarationHistoryListUseCase.execute(request);
        listHistoryDeclare.addAll(response.historyResults);
        pageHistoryDeclare = request.pageIndex;
      },
    );
  }

  DeclarationHistoryListRequest _buildRequestHistoryDeclare({
    bool isLoadMore = false,
  }) {
    return DeclarationHistoryListRequest(
      companyId: AppData.instance.accountInfo.value?.toChucId ?? '',
      pageIndex:
          isLoadMore ? pageHistoryDeclare + 1 : AppConst.defaultPageNumber,
      pageSize: Get.context?.isTablet ?? false
          ? AppConst.largePageSize
          : AppConst.defaultPageSize,
      year: selectedPeriodDate.value.year.toString(),
      month: selectedPeriodDate.value.month.toString(),
      procedureCode: selectProcedure.value?.type.toString() ?? '',
      dossierNumber: searchController.text.trim(),
    );
  }

  Future<void> getDeclarationHistoryRecordList({
    required String keyMap,
  }) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response =
            await _getDeclarationHistoryRecordListUseCase.execute(keyMap);
        nav.toNamed(
          AppRoutesCl.declarationList.path,
          arguments: DeclarationListArgument(
            declarationHistoryRecordList: response,
            isFromHistoryPage: true,
          ),
        );
      },
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
