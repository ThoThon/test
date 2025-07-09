import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/select_staff/model/model_src.dart';
import 'package:v_bhxh/modules/select_staff/repository/select_staff_repository.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectStaffController
    extends BasePageSearchController<StaffListResponse> {
  late final _selectStaffRepository = SelectStaffRepository(this);

  final listStaffSelect = <SelectStaffResponse>[].obs;

  int page = AppConst.defaultPageNumber;

  final staffSelected = Rx<SelectStaffResponse?>(null);

  final selectedID = Rxn<String>(Get.safeArguments<String>());

  @override
  void onInit() {
    super.onInit();
    getStaffListSelect();
  }

  Future<void> getStaffListSelect({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequest(isLoadMore: isLoadMore);

    try {
      final response = await _selectStaffRepository.getStaffListSelect(request);
      if (response.result!.nhanSus.isNotEmpty && response.isSuccess) {
        listStaffSelect.addAll(response.result!.nhanSus);
        page = request.pageIndex;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  StaffListRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return StaffListRequest(
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: 20,
      hoTen: searchController.text.trim(),
      maSoBHXH: "",
    );
  }

  @override
  Future<void> onLoadMore() async {
    await getStaffListSelect(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    listStaffSelect.clear();
    await getStaffListSelect();
    refreshController.refreshCompleted();
  }

  @override
  Future<void> functionSearch() async {
    debouncer(
      () {
        onRefresh();
      },
    );
  }
}
