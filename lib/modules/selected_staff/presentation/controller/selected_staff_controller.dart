import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_request.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/staff_detail.dart';
import 'package:v_bhxh/modules/selected_staff/domain/use_case/get_staff_list_selected_use_case.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../domain/entity/selected_staff_response.dart';

class SelectStaffController extends BaseGetClController {
  final GetStaffListSelectUseCase _getStaffListSelectUseCase;

  SelectStaffController(
    this._getStaffListSelectUseCase,
  );

  final listStaffSelect = <StaffDetail>[].obs;

  final debouncer = Debouncer(delay: const Duration(seconds: 1));

  int page = AppConst.defaultPageNumber;

  final staffSelected = Rxn<SelectStaffResponse>();

  final selectedID = Rxn<String>(Get.safeArguments<String>());

  final refreshController = RefreshController();

  final isShowButtonClear = false.obs;
  final searchTextCtrl = TextEditingController();
  final keyword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getStaffListSelect();
  }

  Future<void> _getStaffListSelect({
    bool isLoadMore = false,
  }) async {
    final request = _buildRequest(isLoadMore: isLoadMore);
    return buildState(
      showLoading: !isLoadMore,
      action: () async {
        final res = await _getStaffListSelectUseCase.execute(request);
        listStaffSelect.addAll(res.staff);
        page = request.pageIndex;
      },
    );
  }

  SelectStaffRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return SelectStaffRequest(
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: 20,
      fullName: searchTextCtrl.text.trim(),
      bhxhNumber: "",
    );
  }

  Future<void> onLoadMore() async {
    await _getStaffListSelect(isLoadMore: true);
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    listStaffSelect.clear();
    await _getStaffListSelect();
    refreshController.refreshCompleted();
  }

  Future<void> functionSearch() async {
    debouncer(
      () {
        onRefresh();
      },
    );
  }
}
