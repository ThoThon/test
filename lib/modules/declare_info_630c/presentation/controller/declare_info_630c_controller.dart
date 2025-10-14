import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';

import '../../../../clean/core/presentation/navigation/navigation_src.dart';
import '../../../../clean/shared/entity/categories_630/categories_630_src.dart';
import '../../../../clean/shared/entity/category.dart';
import '../../../../shares/utils/utils_src.dart';
import '../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../declare/declaration_period/domain/entity/entity_src.dart';
import '../../../declare/declaration_period/presentation/events/declaration_period_event.dart';
import '../../../selected_staff/domain/entity/selected_staff_detail.dart';
import '../../../selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import '../../../src.dart';
import '../../declare_info_630c_src.dart';

// REF: BHW-3103
const declineValid = ['D301', 'D302', 'D303'];

class DeclareInfo630cController extends BaseGetClController {
  final AddProcedure630cUseCase _addProcedure630cUseCase;
  final GetDetailProcedure630cUseCase _getDetailProcedure630cUseCase;
  final UpdateProcedure630cUseCase _updateProcedure630cUseCase;
  final GetStaffDetailUseCase _getStaffDetailUseCase;
  final DeclareInfoArgument argument;

  DeclareInfo630cController(
    this._addProcedure630cUseCase,
    this._getDetailProcedure630cUseCase,
    this._updateProcedure630cUseCase,
    this._getStaffDetailUseCase, {
    required this.argument,
  });

  /// id 630c dùng khi update
  String? id;

  /// Id nhân viên được chọn
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

  /// Từ ngày *
  final toDateCtrl = TextEditingController();

  /// Đến ngày *
  final fromDateCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

  /// Đến ngày đơn vị *
  final toDateUnitTextCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Ngày trở lại làm việc *
  final returnWorkDateCtrl = TextEditingController();

  /// Ngày giám định
  final appraisalDateCtrl = TextEditingController();

  /// Tỷ lệ suy giảm
  final rateToDeclineCtrl = TextEditingController();

  /// Số serial
  final serialNumberCtrl = TextEditingController();

  /// Đợt bổ sung
  final supplementalPeriodCtrl = TextEditingController();

  /// Mã hồ sơ
  final fileCodeTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Hình thức nhận *
  final receiveForm = Rxn<Category>();

  /// Số tài khoản ngân hàng *
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản *
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng *
  final selectedBank = Rxn<Bank>();

  /// Đợt đã giải quyết
  final resolvedPeriodCtrl = TextEditingController();

  /// Ngày đã giải quyết
  final resolvedDateCtrl = TextEditingController();

  /// Lý do điều chỉnh
  final adjustReasonCtrl = TextEditingController();

  final scrollController = ScrollController();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  final formKey = GlobalKey<FormState>();

  final autoValidateMode = Rxn<AutovalidateMode>();

  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }

  /// Trả về "true" khi "Hình thức nhận" là "Chi trả qua ATM"
  bool get isATMpayment {
    return receiveForm.value?.value == ATMPaymentValue;
  }

  @override
  void onInit() {
    super.onInit();
    _get630cDetail();
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    staffCodeTextCtrl.dispose();
    fromDateCtrl.dispose();
    toDateCtrl.dispose();
    countDayTextCtrl.dispose();
    fromDateUnitTextCtrl.dispose();
    toDateUnitTextCtrl.dispose();
    returnWorkDateCtrl.dispose();
    appraisalDateCtrl.dispose();
    rateToDeclineCtrl.dispose();
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

  Future<void> saveDraft() async {
    if (formKey.currentState?.validate() != true) {
      autoValidateMode.value = AutovalidateMode.always;
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
    } else {
      if (argument.isUpdateStaff) {
        await _update630c();
      } else {
        await _add630c();
      }
    }
  }

  Future<void> _add630c() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await _addProcedure630cUseCase.execute(_buildRequest());

        // Refresh màn đợt kê khai sau khi thêm mới thành công
        eventBus.fire(const RefreshDeclarationPeriodEvent());

        nav.showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          type: SnackBarType.success,
        );
        if (argument.isAddPeriodFromDeclarePeriod) {
          Get.offNamed(
            AppRoutesCl.staffList.path,
            arguments: StaffListArgument(
              declarationPeriodId: argument.declarationPeriodId,
              procedureType: ProcedureType.procedure630c,
            ),
          );
        } else if (argument.isAddStaffFromStaffList) {
          Get.back(
            result: argument.declarationPeriodId,
          );
        }
      },
    );
  }

  DeclareInfo630c _buildRequest() {
    return DeclareInfo630c(
      id: id,
      periodId: argument.declarationPeriodId,
      fullName: fullNameTextCtrl.text.trim(),
      bhxhNumber: bhxhTextCtrl.text.trim(),
      cccdNumber: cccdTextCtrl.text.trim(),
      employeeId: staffCodeTextCtrl.text.trim(),
      adjustment: declareForm.value?.value ?? '',
      groupCode: benefitGroup.value?.value ?? '',
      fromDate: convertStringToDateSafe(fromDateCtrl.text, PATTERN_1),
      toDate: convertStringToDateSafe(toDateCtrl.text, PATTERN_1),
      totalDays: CurrencyUtils.formatNumberCurrency(
        countDayTextCtrl.text,
      ),
      unitFromDate:
          convertStringToDateSafe(fromDateUnitTextCtrl.text, PATTERN_1),
      unitToDate: convertStringToDateSafe(toDateUnitTextCtrl.text, PATTERN_1),
      returnToWorkDate:
          convertStringToDateSafe(returnWorkDateCtrl.text, PATTERN_1),
      appraisalDate: convertStringToDateSafe(appraisalDateCtrl.text, PATTERN_1),
      rateToDecline: int.tryParse(rateToDeclineCtrl.text),
      seriNumber: serialNumberCtrl.text.trim(),
      extraBatch: supplementalPeriodCtrl.text.trim(),
      dossierId: fileCodeTextCtrl.text.trim(),
      note: noteTextCtrl.text.trim(),
      receiveType: receiveForm.value?.value ?? '',
      bankAccount: bankNumberCtrl.text.trim(),
      accountName: accountHolderNameCtrl.text.trim(),
      bank: selectedBank.value,
      resolvedBatch: resolvedPeriodCtrl.text.trim(),
      prevApproveDate:
          convertStringToDateSafe(resolvedDateCtrl.text, PATTERN_1),
      adjustReason: adjustReasonCtrl.text.trim(),
    );
  }

  Future<void> _get630cDetail() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final staffId = argument.staffId;
        if (staffId == null) {
          return;
        }
        final response = await _getDetailProcedure630cUseCase.execute(staffId);

        mapFrom630cDetail(response);
      },
    );
  }

  void mapFrom630cDetail(DeclareInfo630c detail) {
    id = detail.id;
    // Họ và tên
    fullNameTextCtrl.text = detail.fullName.trim();

    // Mã số BHXH
    bhxhTextCtrl.text = detail.bhxhNumber.trim();

    // Số CCCD
    if (detail.cccdNumber != null) {
      cccdTextCtrl.text = detail.cccdNumber!.trim();
    }

    // Mã nhân viên
    if (detail.employeeId != null) {
      staffCodeTextCtrl.text = detail.employeeId!.trim();
    }

    // Hìnhh thức kê khai
    declareForm.value = AppData.instance.declareForm[detail.adjustment];

    // Mã nhóm hưởng
    benefitGroup.value = AppData.instance.benefitGroup630c.firstWhereOrNull(
      (item) => item.value == detail.groupCode,
    );

    // Từ ngày
    fromDateCtrl.text =
        convertDateToStringSafe(detail.fromDate, PATTERN_1) ?? '';

    // Đến ngày
    toDateCtrl.text = convertDateToStringSafe(detail.toDate, PATTERN_1) ?? '';

    // Từ ngày đơn vị
    fromDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.unitFromDate, PATTERN_1) ?? '';

    // Đến ngày đơn vị
    toDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.unitToDate, PATTERN_1) ?? '';

    // Tổng số ngày
    if (detail.totalDays != null && detail.totalDays! > 0) {
      countDayTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(detail.totalDays);
    }

    // Ngày trở lại làm việc
    returnWorkDateCtrl.text =
        convertDateToStringSafe(detail.returnToWorkDate, PATTERN_1) ?? '';

    // Ngày giám định
    appraisalDateCtrl.text =
        convertDateToStringSafe(detail.appraisalDate, PATTERN_1) ?? '';

    // Tỷ lệ suy giảm
    if (detail.rateToDecline != null) {
      rateToDeclineCtrl.text = detail.rateToDecline.toString();
    }
    // Số serial
    serialNumberCtrl.text = detail.seriNumber?.trim() ?? '';

    // Đợt bổ sung
    supplementalPeriodCtrl.text = detail.extraBatch?.trim() ?? '';

    // Mã hồ sơ
    fileCodeTextCtrl.text = detail.dossierId.trim();

    // Ghi chú
    noteTextCtrl.text = detail.note?.trim() ?? '';

    // Hình thức nhận
    receiveForm.value = AppData.instance.receiveForm[detail.receiveType];

    // Số tài khoản ngân hàng
    bankNumberCtrl.text = detail.bankAccount?.trim() ?? '';

    // Tên chủ tài khoản
    accountHolderNameCtrl.text = detail.accountName?.trim() ?? '';

    // Ngân hàng
    selectedBank.value = AppData.instance.bank.firstWhereOrNull(
      (item) => item == detail.bank,
    );

    // Đợt đã giải quyết
    resolvedPeriodCtrl.text = detail.resolvedBatch?.trim() ?? '';

    // Ngày đã giải quyết
    resolvedDateCtrl.text =
        convertDateToStringSafe(detail.prevApproveDate, PATTERN_1) ?? '';

    // Lý do điều chỉnh
    adjustReasonCtrl.text = detail.adjustReason?.trim() ?? '';
  }

  Future<void> _update630c() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
        // => Chặn việc cập nhật
        if (id == null) {
          nav.showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
          return;
        }

        await _updateProcedure630cUseCase.execute(_buildRequest());

        eventBus.fire(const RefreshDeclarationPeriodEvent());

        nav.showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          type: SnackBarType.success,
        );
        nav.back(
          result: argument.declarationPeriodId,
        );
      },
    );
  }

  bool get isRateToDecline => declineValid.contains(benefitGroup.value?.value);

  void onChangeReceiveMethod(Category? method) {
    if (method == null) {
      return;
    }

    // Nếu khác ATM thì reset các trường liên quan ATM
    // REF: BHW-3022
    if (method.value != ATMPaymentValue) {
      bankNumberCtrl.clear();
      accountHolderNameCtrl.clear();
      selectedBank.value = null;
    }

    // Scroll đến cuối màn hình khi chọn "Chi trả qua ATM"
    // REF: BHW-3051
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

  void goToSelectStaffPage() async {
    KeyBoard.hide();
    final result = await Get.toNamed(
      AppRoutesCl.selectStaff.path,
      // Truyền id sang để biết nhân viên nào đang được chọn
      arguments: selectedStaffId,
    );
    if (result is String) {
      await _getDetailStaff(staffId: result);
    }
  }

  Future<void> _getDetailStaff({
    required String staffId,
  }) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await _getStaffDetailUseCase.execute(staffId);
        mapFromStaffDetail(response);
      },
    );
  }

  void mapFromStaffDetail(SelectedStaffDetail staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    selectedStaffId = staff.id;

    fullNameTextCtrl.text = staff.fullName?.trim() ?? '';

    bhxhTextCtrl.text = staff.bhxhNumber?.trim() ?? '';

    cccdTextCtrl.text = staff.cccdNumber?.trim() ?? '';
  }

  void onChangeDeclareMethod(Category? method) {
    if (method == null) {
      return;
    }
    declareForm.value = method;

    // Nếu chọn hình thức kê khai khác "Phát sinh" (1) thì reset các trường liên quan
    // REF: VBHXHMOB-9
    if (method.value != declareMethodArisingValue) {
      returnWorkDateCtrl.clear();
      rateToDeclineCtrl.clear();
      appraisalDateCtrl.clear();
      serialNumberCtrl.clear();
      supplementalPeriodCtrl.clear();
    }

    // REF: VBHXHMOB-9
    if (method.value != declareMethodAdjustValue) {
      resolvedPeriodCtrl.clear();
      resolvedDateCtrl.clear();
      adjustReasonCtrl.clear();
    }
  }
}
