import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/modules/certificate_list/models/register_request.dart';
import 'package:v_bhxh/modules/src.dart';

class HistoryTransactionControllerICare extends BaseRefreshGetxController {
  final selectTab = HistoryTransactionEnum.registerTab.obs;

  final listHistoryRegister = <HistoryRegisterModel>[].obs;

  late final historyTransactionRepository = HistoryTransactionRepository(this);

  void changeFilterTab(HistoryTransactionEnum filter) {
    selectTab.value = filter;
  }

  InfoCompanyResponse? itemCompany;

  RegisterRequest? registerItem;

  late String companyID;

  late String taxCode;

  final isFromHome = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getArg();
    await fetchListHistoryRegister();
  }

  void getArg() {
    final args = Get.arguments;

    ///Trường hợp vào từ màn chọn mã đơn vị hoặc màn home
    if (args is InfoCompanyResponse) {
      taxCode = args.taxCode;
      companyID = args.orgId;
    }

    ///Trường hợp vào từ dialog thông báo đăng ký thành công
    else if (args['item'] is RegisterRequest) {
      registerItem = args['item'];
      companyID = registerItem?.idCompany ?? "";
      taxCode = registerItem?.taxCode ?? "";
      isFromHome.value = args['isHaveBtn'];
    }
  }

  String getResult(HistoryRegisterModel item) {
    final steps = [
      item.kqBuoc4,
      item.kqBuoc3,
      item.kqBuoc2,
      item.kqBuoc1,
      item.tiepNhan,
    ];
    return steps.firstWhere(
      (step) => step.isNotEmpty,
      orElse: () => LocaleKeys.historyRegister_noResult.tr,
    );
  }

  Future<void> fetchListHistoryRegister() async {
    await callAPIList<HistoryRegisterModel>(
      functionAPI: historyTransactionRepository.getHistoryRegister(companyID),
      listResponse: listHistoryRegister,
    );
  }

  @override
  Future<void> onLoadMore() async {}

  @override
  Future<void> onRefresh() async {
    await fetchListHistoryRegister();
    refreshController.refreshCompleted();
  }
}
