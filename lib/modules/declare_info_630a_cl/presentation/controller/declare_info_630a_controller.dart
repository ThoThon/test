import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/events/declaration_period_event.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/entity/declare_info_630a.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/use_case/add_procedure_630a_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/use_case/get_detail_procedure_630a_use_case.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/use_case/update_procedure_630a_use_case.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_detail.dart';
import 'package:v_bhxh/modules/selected_staff/domain/use_case/get_staff_detail_use_case.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../clean/shared/entity/category.dart';
import '../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../declare/declaration_period/domain/entity/entity_src.dart';

class DeclareInfo630aController extends BaseGetClController {
  final AddProcedure630aUseCase _addProcedure630aUseCase;
  final GetDetailProcedure630aUseCase _getDetailProcedure630aUseCase;
  final UpdateProcedure630aUseCase _updateProcedure630aUseCase;
  final GetStaffDetailUseCase _getStaffDetailUseCase;

  DeclareInfo630aController(
    this._addProcedure630aUseCase,
    this._getDetailProcedure630aUseCase,
    this._updateProcedure630aUseCase,
    this._getStaffDetailUseCase,
  );

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

  // late final _repository = DeclareInfo630aRepository(this);

  // late final declareInfoRepository = DeclareInfoRepository(this);

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
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await _addProcedure630aUseCase.execute(_buildRequest());
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
              procedureType: ProcedureType.procedure630a,
            ),
          );
          return;
        }

        if (argument.isAddStaffFromStaffList) {
          Get.back(
            result: argument.declarationPeriodId,
          );
          return;
        }
      },
    );
  }

  Future<void> _update630a() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
        // => Chặn việc cập nhật
        if (id == null) {
          nav.showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
          return;
        }

        await _updateProcedure630aUseCase.execute(_buildRequest());

        // Refresh màn đợt kê khai sau khi cập nhật thành công
        eventBus.fire(const RefreshDeclarationPeriodEvent());

        nav.showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          type: SnackBarType.success,
        );
        Get.back(
          result: argument.declarationPeriodId,
        );
      },
    );
  }

  String get weeklyDayOffString =>
      weeklyDayOffs.map((dayOff) => dayOff.value).join(';');

  DeclareInfo630a _buildRequest() {
    return DeclareInfo630a(
      id: id,
      periodId: argument.declarationPeriodId,
      fullName: fullNameTextCtrl.text.trim(),
      bhxhNumber: bhxhTextCtrl.text.trim(),
      cccdNumber: cccdTextCtrl.text.trim(),
      employeeId: staffCodeTextCtrl.text.trim(),
      adjustment: declareForm.value?.value ?? '',
      groupCode: benefitGroup.value?.value ?? '',
      childDob: convertDateStringToString(birthDayChildCtrl.text, PATTERN_1),
      childCount: int.tryParse(numberChildCtrl.text) ?? 0,
      childBhyt: bhytCardCodeChildCtrl.text.trim(),
      fromDate: convertDateStringToString(fromDateCtrl.text, PATTERN_1),
      toDate: convertDateStringToString(toDateCtrl.text, PATTERN_1),
      totalDays: int.tryParse(countDayTextCtrl.text) ?? 0,
      unitFromDate:
          convertDateStringToString(fromDateUnitTextCtrl.text, PATTERN_1),
      dayOff: weeklyDayOffString,
      hospitalLevel: selectHospitalLine.value?.value ?? '',
      chronicCode: selectDiseaseCode.value?.code ?? '',
      diseaseName: diseaseNameTextCtrl.text.trim(),
      seriNumber: serialNumberCtrl.text.trim(),
      maternityLeave: isMaternityRest.value,
      workCondition: workCondition.value?.value ?? '',
      extraBatch: supplementalPeriodCtrl.text.trim(),
      dossierId: fileCodeTextCtrl.text.trim(),
      note: noteTextCtrl.text.trim(),
      receiveType: receiveForm.value?.value ?? '',
      bankAccount: bankNumberCtrl.text.trim(),
      accountName: accountHolderNameCtrl.text.trim(),
      bank: selectedBank.value,
      resolvedBatch: resolvedPeriodCtrl.text.trim(),
      prevApproveDate:
          convertDateStringToString(resolvedDateCtrl.text, PATTERN_1),
      adjustReason: adjustReasonCtrl.text.trim(),
    );
  }

  Future<void> _get630aDetail() async {
    return buildState(
      action: () async {
        final staffId = argument.staffId;
        if (staffId == null) {
          return;
        }
        final response = await _getDetailProcedure630aUseCase.execute(staffId);

        mapFrom630aDetail(response);
      },
    );
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

  void mapFrom630aDetail(DeclareInfo630a detail) {
    id = detail.id;

    // Full name
    fullNameTextCtrl.text = detail.fullName.trim();

    // BHXH number
    bhxhTextCtrl.text = detail.bhxhNumber.trim();

    // ID number (CCCD/CMND)
    cccdTextCtrl.text = detail.cccdNumber.trim();

    // Employee ID
    staffCodeTextCtrl.text = detail.employeeId.trim();

    // Adjustment form
    declareForm.value = AppData.instance.declareForm[detail.adjustment];

    // Benefit group
    benefitGroup.value = AppData.instance.benefitGroup630a.firstWhereOrNull(
      (item) => item.value == detail.groupCode,
    );

    // Child DOB
    birthDayChildCtrl.text =
        convertDateStringToString(detail.childDob, PATTERN_1);

    // Number of children
    numberChildCtrl.text = detail.childCount.toString();

    // Child BHYT card
    bhytCardCodeChildCtrl.text = detail.childBhyt;

    // From date
    fromDateCtrl.text = convertDateStringToString(detail.fromDate, PATTERN_1);

    // To date
    toDateCtrl.text = convertDateStringToString(detail.toDate, PATTERN_1);

    // Total days
    countDayTextCtrl.text = detail.totalDays.toString();

    // Unit from date
    fromDateUnitTextCtrl.text =
        convertDateStringToString(detail.unitFromDate, PATTERN_1);

    // Weekly day off
    final dayOff = detail.dayOff;
    if (dayOff.isNotEmpty) {
      weeklyDayOffs.value = dayOff
          .split(';')
          .map((item) => WeeklyDayOffEnum.parse(item.trim()))
          .whereType<WeeklyDayOffEnum>()
          .toList();
    }

    // Hospital line
    selectHospitalLine.value =
        AppData.instance.hospitalLine[detail.hospitalLevel];

    // Chronic disease code
    selectDiseaseCode.value = AppData.instance.longDiease
        .firstWhereOrNull((item) => item.code == detail.chronicCode);

    // Disease name
    diseaseNameTextCtrl.text = detail.diseaseName.trim();

    // Serial number
    serialNumberCtrl.text = detail.seriNumber.trim();

    // Work condition
    workCondition.value = AppData.instance.workCondition[detail.workCondition];

    // Maternity leave
    isMaternityRest.value = detail.maternityLeave;

    // Extra batch
    supplementalPeriodCtrl.text = detail.extraBatch.trim();

    // Dossier ID
    fileCodeTextCtrl.text = detail.dossierId.trim();

    // Note
    noteTextCtrl.text = detail.note.trim();

    // Receive type
    receiveForm.value = AppData.instance.receiveForm[detail.receiveType];

    // Bank account
    bankNumberCtrl.text = detail.bankAccount.trim();

    // Account holder
    accountHolderNameCtrl.text = detail.accountName.trim();

    // Bank
    selectedBank.value = AppData.instance.bank.firstWhereOrNull(
      (item) => item == detail.bank,
    );

    // Resolved batch
    resolvedPeriodCtrl.text = detail.resolvedBatch.trim();

    // Previous approve date
    resolvedDateCtrl.text =
        convertDateStringToString(detail.prevApproveDate, PATTERN_1);

    // Adjust reason
    adjustReasonCtrl.text = detail.adjustReason.trim();
  }

  void mapFromStaffDetail(SelectedStaffDetail staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    selectedStaffId = staff.id;

    fullNameTextCtrl.text = staff.fullName?.trim() ?? '';

    bhxhTextCtrl.text = staff.bhxhNumber?.trim() ?? '';

    cccdTextCtrl.text = staff.cccdNumber?.trim() ?? '';
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
