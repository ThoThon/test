import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/modules/certificate_list/models/register_request.dart';
import 'package:v_bhxh/modules/src.dart';

class HistoryController extends BaseRefreshGetxController {
  // final selectTab = HistoryTransactionEnum.registerTab.obs;

  final listHistory = <HistoryResults>[].obs;

  late final historyRepository = HistoryRepository(this);

  // void changeFilterTab(HistoryTransactionEnum filter) {
  //   selectTab.value = filter;
  // }

  InfoCompanyResponse? itemCompany;

  RegisterRequest? registerItem;

  // late String companyID;

  // late String taxCode;

  final isFromHome = false.obs;

  @override
  void onInit() {
    super.onInit();
    getListHistory();
  }

  Future<void> getListHistory() async {
    try {
      final res = await historyRepository.getHistory();
      if (res.result != null) {
        listHistory.value = res.result!.historyResults;
      }
    } catch (e) {
      // logger.d(e);
    }
  }

  // String getResult(HistoryRegisterModel item) {
  //   final steps = [
  //     item.kqBuoc4,
  //     item.kqBuoc3,
  //     item.kqBuoc2,
  //     item.kqBuoc1,
  //     item.tiepNhan,
  //   ];
  //   return steps.firstWhere(
  //     (step) => step.isNotEmpty,
  //     orElse: () => LocaleKeys.historyRegister_noResult.tr,
  //   );
  // }

  // Future<void> fetchListHistoryRegister() async {
  //   await callAPIList<HistoryRegisterModel>(
  //     functionAPI: historyTransactionRepository.getHistoryRegister(companyID),
  //     listResponse: listHistoryRegister,
  //   );
  // }

  @override
  Future<void> onLoadMore() async {}

  @override
  Future<void> onRefresh() async {
    // await fetchListHistoryRegister();
    refreshController.refreshCompleted();
  }
}
