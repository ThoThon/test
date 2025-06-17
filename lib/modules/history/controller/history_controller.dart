import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/history_argument.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../base_app/base_app.src.dart';
import '../repository/history_repository.dart';

part 'history_declare_ext_controller.dart';
part 'history_register_ext_controller.dart';

class HistoryController extends BasePageSearchController<HistoryResponse> {
  final listHistoryDeclare = <HistoryDeclareItemModel>[].obs;

  final listHistoryRegister = <HistoryRegisterItemModel>[].obs;

  late final _historyRepository = HistoryRepository(this);

  final currentTab = HistoryTabEnum.register_transaction.obs;

  int pageHistoryRegister = AppConst.defaultPageNumber;

  int pageHistoryDeclare = AppConst.defaultPageNumber;

  final selectedPeriodDate = DateTime.now().obs;

  final selectProcedure = Rx<ListProcedureFilterModel?>(null);

  final listProcedureFilter = <ListProcedureFilterModel>[].obs;

  final declareRefreshCtrl = RefreshController();

  final registerRefreshCtrl = RefreshController();

  final selectFilterHistoryRegister = HistoryRegisterTypeFilterEnum.all.obs;

  // final argument = Get.arguments as HistoryArgument?;

  final argument = Get.safeArguments<HistoryArgument>();

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
    if (argument != null) {
      if (argument?.selectedTab == HistoryTabEnum.file_declare) {
        currentTab.value =
            argument?.selectedTab ?? HistoryTabEnum.register_transaction;
      }
    }
    getProcedureFilter();
    getHistoryDeclare();
    getHistoryRegister();
  }

  @override
  Future<void> onLoadMore() async {}

  @override
  Future<void> onRefresh() async {}

  void pickPeriodDate() async {
    final date = await UtilWidget.showPeriodDatePicker(
      dateTime: selectedPeriodDate.value,
    );
    if (date != null) {
      selectedPeriodDate.value = date;
      listHistoryDeclare.clear();
      listHistoryRegister.clear();
      getHistoryDeclare();
      getHistoryRegister();
    }
  }

  void backToHome() {
    Get.until(ModalRoute.withName(AppRoutes.home.path));
  }

  @override
  Future<void> functionSearch() async {
    debouncer(
      () {
        onRefreshRegister();
        onRefreshDeclare();
      },
    );
  }

  void onTabChanged(HistoryTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }
}
