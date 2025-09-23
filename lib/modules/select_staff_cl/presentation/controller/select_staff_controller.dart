import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/select_staff_request.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/staff_info.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/use_case/get_staff_list_select_use_case.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../domain/entity/select_staff_response.dart';

class SelectStaffController extends BaseGetClController {
  final GetStaffListSelectUseCase _getStaffListSelectUseCase;
  SelectStaffController(this._getStaffListSelectUseCase);

  final listStaffSelect = <StaffInfo>[].obs;

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
        listStaffSelect.addAll(res.nhanSus);
      },
    );
  }

  SelectStaffRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return SelectStaffRequest(
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: 20,
      hoTen: searchTextCtrl.text.trim(),
      maSoBHXH: "",
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

  // @override
  // Future<void> functionSearch() async {
  //   debouncer(
  //     () {
  //       onRefresh();
  //     },
  //   );
  // }
}
