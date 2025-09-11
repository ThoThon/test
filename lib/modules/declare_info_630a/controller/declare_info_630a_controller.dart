import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/events/declaration_period_event.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../../clean/shared/entity/category.dart';
import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../declare/declare_info/repository/declare_info_repository.dart';
import '../../declare/staff_list/model/staff_list_argument.dart';
import '../../select_staff/model/model_src.dart';
import '../repository/declare_info_630a_repository.dart';

class DeclareInfo630aController extends BaseGetxController {
  /// id 630a dùng khi update
  String? id;

  String? selectedStaffId;

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH *
  final bhxhTextCtrl = TextEditingController();

  /// Số CCCD
  final cccdTextCtrl = TextEditingController();

  /// Mã nhân viên
  final staffCodeTextCtrl = TextEditingController();

  /// Hình thức kê khai *
  final declareForm = Rxn<Category>();

  /// Mã nhóm hưởng *
  final benefitGroup = Rxn<BenefitGroup630>();

  /// Ngày sinh con *
  final birthDayChildCtrl = TextEditingController();

  /// Số con
  final numberChildCtrl = TextEditingController();

  /// Mã thẻ BHYT của con
  final bhytCardCodeChildCtrl = TextEditingController();

  /// Từ ngày *
  final fromDateCtrl = TextEditingController();

  /// Đến ngày *
  final toDateCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Nghỉ hàng tuần
  final weeklyDayOffs = <WeeklyDayOffEnum>[].obs;

  /// Tuyến bệnh viện
  final selectHospitalLine = Rxn<Category>();

  /// Chọn/Nhập mã bệnh
  final selectDiseaseCode = Rxn<LongDiease>();

  /// Tên bệnh
  final diseaseNameTextCtrl = TextEditingController();

  /// Số serial
  final serialNumberCtrl = TextEditingController();

  /// Điều kiện làm việc
  final workCondition = Rxn<Category>();

  /// Nghỉ dưỡng thai
  final isMaternityRest = false.obs;

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  final receiveForm = Rxn<Category>();

  /// Số tài khoản ngân hàng
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng
  final selectedBank = Rxn<Bank>();

  /// Đợt đã giải quyết
  final resolvedPeriodCtrl = TextEditingController();

  /// Ngày đã giải quyết
  final resolvedDateCtrl = TextEditingController();

  /// Lý do điều chỉnh
  final adjustReasonCtrl = TextEditingController();

  late final _repository = DeclareInfo630aRepository(this);

  late final declareInfoRepository = DeclareInfoRepository(this);

  final autoValidateMode = Rxn<AutovalidateMode>();

  final formKey = GlobalKey<FormState>();

  final DeclareInfoArgument argument = Get.arguments;

  // final declarationPeriodController =
  //     Get.findOrNull<DeclarationPeriodController>();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  final scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    _get630aDetail();
  }

  void goToSelectStaffPage() async {
    KeyBoard.hide();
    final result = await Get.toNamed(
      AppRoutesCl.selectStaff.path,
      arguments: selectedStaffId,
    );
    if (result is SelectStaffResponse) {
      _getDetailStaff(staffId: result.id);
    }
  }

  Future<void> _getDetailStaff({
    required String staffId,
  }) async {
    try {
      showLoadingOverlay();
      final response = await declareInfoRepository.getDetailStaff(id: staffId);
      final staff = response.result;
      if (response.isSuccess && staff != null) {
        mapFromStaffDetail(staff);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> saveDraft() async {
    if (formKey.currentState?.validate() != true) {
      autoValidateMode.value = AutovalidateMode.always;
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
    } else {
      if (argument.isUpdateStaff) {
        await _update630a();
      } else {
        await _add630a();
      }
    }
  }

  Future<void> _add630a() async {
    try {
      showLoadingOverlay();
      final response = await _repository.addProcedure630a(_buildRequest());
      if (response.isSuccess) {
        // Refresh màn đợt kê khai sau khi thêm mới thành công
        eventBus.fire(const RefreshDeclarationPeriodEvent());

        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        if (argument.isAddPeriodFromDeclarePeriod) {
          // Đóng màn kê khai này và mở màn danh sách nhân viên
          // .then để bắt sự kiện đóng màn danh sách nhân viên này để refresh màn đợt kê khai
          Get.offNamed(
            AppRoutesCl.staffList.path,
            arguments: StaffListArgument(
              declarationPeriodId: argument.declarationPeriodId,
              procedureType: ProcedureType.procedure630a,
            ),
          );
        } else if (argument.isAddStaffFromStaffList) {
          Get.back(
            result: argument.declarationPeriodId,
          );
        }
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _update630a() async {
    try {
      // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
      // => Chặn việc cập nhật
      if (id == null) {
        showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
        return;
      }

      showLoadingOverlay();

      final response = await _repository.update630a(_buildRequest());

      if (response.isSuccess) {
        // Refresh màn đợt kê khai sau khi cập nhật thành công
        eventBus.fire(const RefreshDeclarationPeriodEvent());

        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        Get.back(
          result: argument.declarationPeriodId,
        );
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  String get weeklyDayOffString =>
      weeklyDayOffs.map((dayOff) => dayOff.value).join(';');

  DeclareInfo630aRequest _buildRequest() {
    return DeclareInfo630aRequest(
      id: id,
      kyKeKhaiId: argument.declarationPeriodId,
      hoTen: fullNameTextCtrl.text.trim(),
      maSoBhxh: bhxhTextCtrl.text.trim(),
      soCmnd: cccdTextCtrl.text.trim(),
      maNhanVien: staffCodeTextCtrl.text.trim(),
      phatSinhDieuChinh: declareForm.value?.value ?? '',
      maNhomHuong: benefitGroup.value?.value ?? '',
      ngaySinhCon: convertStringToDateSafe(birthDayChildCtrl.text, PATTERN_1),
      soCon: int.tryParse(numberChildCtrl.text), // bỏ trim
      theBhytCuaCon: bhytCardCodeChildCtrl.text.trim(),
      tuNgay: convertStringToDate(fromDateCtrl.text, PATTERN_1),
      denNgay: convertStringToDate(toDateCtrl.text, PATTERN_1),
      tongSoNgay: int.tryParse(countDayTextCtrl.text) ?? 0, // bỏ trim
      tuNgayDonVi: convertStringToDate(fromDateUnitTextCtrl.text, PATTERN_1),
      ngayNghiTuan: weeklyDayOffString,
      tuyenBenhVien: selectHospitalLine.value?.value,
      maBenhDaiNgay: selectDiseaseCode.value?.code,
      tenBenh: diseaseNameTextCtrl.text.trim(),
      soSeriCT: serialNumberCtrl.text.trim(),
      dangKyNghiDuongThai: isMaternityRest.value,
      dieuKienLamViec: workCondition.value?.value,
      dotBoSung: supplementalPeriodCtrl.text.trim(),
      maHoSo: fileCodeTextCtrl.text.trim(),
      ghiChu: noteTextCtrl.text.trim(),
      hinhThucNhan: receiveForm.value?.value,
      soTaiKhoan: bankNumberCtrl.text.trim(),
      tenChuTaiKhoan: accountHolderNameCtrl.text.trim(),
      maNganHang: selectedBank.value?.code,
      dotDaGiaiQuyet: resolvedPeriodCtrl.text.trim(),
      tuNgayDuyetTruoc:
          convertStringToDateSafe(resolvedDateCtrl.text, PATTERN_1),
      lyDoDieuChinh: adjustReasonCtrl.text.trim(),
    );
  }

  Future<void> _get630aDetail() async {
    final staffId = argument.staffId;
    if (staffId == null) {
      return;
    }
    try {
      showLoadingOverlay();

      final response = await _repository.getDetail630a(id: staffId);
      final infoDetail = response.result;
      if (response.isSuccess && infoDetail != null) {
        mapFrom630aDetail(infoDetail);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  /// Trả về "true" khi "Mã nhóm hưởng" là "Con ốm"
  bool get isSickChild {
    return benefitGroup.value?.value == "O2";
  }

  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }

  /// Trả về "true" khi "Hình thức nhận" là "Chi trả qua ATM"
  bool get isATMpayment {
    return receiveForm.value?.value == ATMPaymentValue;
  }

  void mapFrom630aDetail(DeclareInfo630aResponse detail) {
    id = detail.id;
    // Họ và tên
    fullNameTextCtrl.text = detail.hoTen.trim();

    // Mã số BHXH
    bhxhTextCtrl.text = detail.maSoBhxh.trim();

    // Số CCCD
    cccdTextCtrl.text = detail.soCmnd.trim();

    // Mã nhân viên
    staffCodeTextCtrl.text = detail.maNhanVien.trim();

    // Hìnhh thức kê khai
    declareForm.value = AppData.instance.declareForm[detail.phatSinhDieuChinh];

    // Mã nhóm hưởng
    benefitGroup.value = AppData.instance.benefitGroup630a.firstWhereOrNull(
      (item) => item.value == detail.maNhomHuong,
    );

    // Ngày sinh con
    birthDayChildCtrl.text =
        convertDateToStringSafe(detail.ngaySinhCon, PATTERN_1) ?? '';

    // Số con
    if (detail.soCon != null) {
      numberChildCtrl.text = detail.soCon.toString();
    }

    // Mã thẻ BHYT của con
    bhytCardCodeChildCtrl.text = detail.theBhytCuaCon;

    // Từ ngày
    fromDateCtrl.text = convertDateToStringSafe(detail.tuNgay, PATTERN_1) ?? '';

    // Đến ngày
    toDateCtrl.text = convertDateToStringSafe(detail.denNgay, PATTERN_1) ?? '';

    // Tổng số ngày
    countDayTextCtrl.text = detail.tongSoNgay.toString();

    // Từ ngày đơn vị
    fromDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.tuNgayDonVi, PATTERN_1) ?? '';

    // Nghỉ hàng tuần
    // Vì BE trả về kiểu "ngayNghiTuan": "t3;t4;t5" nên phải làm như này
    final dayOff = detail.ngayNghiTuan;
    if (dayOff != null && dayOff.isNotEmpty) {
      weeklyDayOffs.value = dayOff
          .split(';')
          .map((item) => WeeklyDayOffEnum.parse(item.trim()))
          .whereType<WeeklyDayOffEnum>()
          .toList();
    }

    // Tuyến bệnh viện
    selectHospitalLine.value =
        AppData.instance.hospitalLine[detail.tuyenBenhVien];

    // Mã bệnh
    selectDiseaseCode.value = AppData.instance.longDiease
        .firstWhereOrNull((item) => item.code == detail.maBenhDaiNgay);

    // Tên bệnh
    diseaseNameTextCtrl.text = detail.tenBenh.trim();

    // Số serial
    serialNumberCtrl.text = detail.soSeriCT.trim();

    // Điều kiện làm việc
    workCondition.value =
        AppData.instance.workCondition[detail.dieuKienLamViec];

    // Nghỉ dưỡng thai
    isMaternityRest.value = detail.dangKyNghiDuongThai;

    // Đợt bổ sung
    supplementalPeriodCtrl.text = detail.dotBoSung.trim();

    // Mã hồ sơ
    fileCodeTextCtrl.text = detail.maHoSo.trim();

    // Ghi chú
    noteTextCtrl.text = detail.ghiChu.trim();

    // Hình thức nhận
    receiveForm.value = AppData.instance.receiveForm[detail.hinhThucNhan];

    // Số tài khoản ngân hàng
    bankNumberCtrl.text = detail.soTaiKhoan.trim();

    // Tên chủ tài khoản
    accountHolderNameCtrl.text = detail.tenChuTaiKhoan.trim();

    // Ngân hàng
    selectedBank.value = AppData.instance.bank.firstWhereOrNull(
      (item) => item == detail.nganHang,
    );

    // Đợt đã giải quyết
    resolvedPeriodCtrl.text = detail.dotDaGiaiQuyet.trim();

    // Ngày đã giải quyết
    resolvedDateCtrl.text =
        convertDateToStringSafe(detail.tuNgayDuyetTruoc, PATTERN_1) ?? '';

    // Lý do điều chỉnh
    adjustReasonCtrl.text = detail.lyDoDieuChinh.trim();
  }

  void mapFromStaffDetail(StaffDetailResponse staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    selectedStaffId = staff.id;

    fullNameTextCtrl.text = staff.hoTen?.trim() ?? '';

    bhxhTextCtrl.text = staff.maSoBHXH?.trim() ?? '';

    cccdTextCtrl.text = staff.soCCCD?.trim() ?? '';
  }

  void onChangeReceiveMethod(Category? method) {
    if (method == null) {
      return;
    }

    // Nếu khác ATM thì reset các trường liên quan ATM
    // REF: BHW-2950
    if (method.value != ATMPaymentValue) {
      bankNumberCtrl.clear();
      accountHolderNameCtrl.clear();
      selectedBank.value = null;
    }

    // Scroll đến cuối màn hình khi chọn "Chi trả qua ATM"
    // REF: BHW-2948
    if (receiveForm.value != method && method.value == ATMPaymentValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      });
    }

    receiveForm.value = method;
  }

  void onChangeDeclareMethod(Category? method) {
    if (method == null) {
      return;
    }
    declareForm.value = method;

    // Nếu chọn hình thức kê khai khác "Phát sinh" (1) thì reset các trường liên quan
    // REF: BHW-2949
    if (method.value != declareMethodArisingValue) {
      selectHospitalLine.value = null;
      selectDiseaseCode.value = null;
      diseaseNameTextCtrl.clear();
      serialNumberCtrl.clear();
      workCondition.value = null;
      isMaternityRest.value = false;
      supplementalPeriodCtrl.clear();
    }

    // REF: BHW-2957
    if (method.value != declareMethodAdjustValue) {
      resolvedPeriodCtrl.clear();
      resolvedDateCtrl.clear();
      adjustReasonCtrl.clear();
    }
  }

  void onChangeBenefitGroup(BenefitGroup630? group) {
    if (group == null) {
      return;
    }

    benefitGroup.value = group;

    // Nếu chọn nhóm hưởng khác "Con ốm" thì reset các trường liên quan
    // REF: BHW-2958
    if (group.value != benefitGroupSickChildValue) {
      birthDayChildCtrl.clear();
      numberChildCtrl.clear();
      bhytCardCodeChildCtrl.clear();
    }
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    staffCodeTextCtrl.dispose();
    birthDayChildCtrl.dispose();
    numberChildCtrl.dispose();
    bhytCardCodeChildCtrl.dispose();
    fromDateCtrl.dispose();
    toDateCtrl.dispose();
    countDayTextCtrl.dispose();
    fromDateUnitTextCtrl.dispose();
    diseaseNameTextCtrl.dispose();
    serialNumberCtrl.dispose();
    supplementalPeriodCtrl.dispose();
    fileCodeTextCtrl.dispose();
    noteTextCtrl.dispose();
    bankNumberCtrl.dispose();
    accountHolderNameCtrl.dispose();
    resolvedPeriodCtrl.dispose();
    resolvedDateCtrl.dispose();
    adjustReasonCtrl.dispose();
    scrollController.dispose();

    super.onClose();
  }
}
