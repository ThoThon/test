import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../base_app/model/app_data.dart';
import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../declare/declaration_list/declaration_list_src.dart';

part 'history_declare_ext_controller.dart';
part 'history_register_ext_controller.dart';

class HistoryController extends BaseGetClController {
  final GetDeclarationHistoryListUseCase _getDeclarationHistoryListUseCase;
  final GetProcedureListFilterUseCase _getProcedureListFilterUseCase;
  final GetRegisterHistoryListUseCase _getRegisterHistoryListUseCase;
  final HistoryArgument? argument;

  HistoryController(
    this._getDeclarationHistoryListUseCase,
    this._getProcedureListFilterUseCase,
    this._getRegisterHistoryListUseCase, {
    this.argument,
  });

  final listHistoryDeclare = <DeclarationHistoryItem>[].obs;

  final listHistoryRegister = <RegisterHistoryItem>[].obs;

  final currentTab = HistoryTabEnum.file_declare.obs;

  int pageHistoryRegister = AppConst.defaultPageNumber;

  int pageHistoryDeclare = AppConst.defaultPageNumber;

  final selectedPeriodDate = DateTime.now().obs;

  final selectProcedure = Rx<ProcedureTypeFilter?>(null);

  final listProcedureFilter = <ProcedureTypeFilter>[].obs;

  final declareRefreshCtrl = RefreshController();

  final registerRefreshCtrl = RefreshController();

  final searchController = TextEditingController();

  final selectFilterHistoryRegister = HistoryRegisterTypeFilterEnum.all.obs;

  final debouncer = Debouncer(delay: const Duration(seconds: 1));

  @override
  void onInit() {
    super.onInit();
    // Thêm option "Tất cả" cho bộ lọc thủ tục
    listProcedureFilter.add(
      ProcedureTypeFilter(
        ten: LocaleKeys.history_all.tr,
        tenCha: '',
        loai: '',
        ma: '',
        ghiChu: '',
      ),
    );

    if (argument != null) {
      currentTab.value = argument?.selectedTab ?? HistoryTabEnum.file_declare;
    }
    getProcedureFilter();
    getHistoryDeclare();
    getHistoryRegister();
  }

  void pickPeriodDate() async {
    final date = await DatePickerUtils.showCalendarPicker(
      title: LocaleKeys.dialog_selectMonthYear.tr,
      dateFormat: PATTERN_12,
      dateTimeInit: selectedPeriodDate.value,
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
    Get.until(ModalRoute.withName(AppRoutesCl.home.path));
  }

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
