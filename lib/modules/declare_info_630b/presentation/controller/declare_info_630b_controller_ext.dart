// import 'declare_info_630b_controller.dart';
part of 'declare_info_630b_controller.dart';

extension DeclareInfo630bControllerExt on DeclareInfo630bController {
  Future<void> saveDraft() async {
    if (formKey.currentState?.validate() != true) {
      autoValidateMode.value = AutovalidateMode.always;
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
    } else {
      if (argument.isUpdateStaff) {
        await _update630b();
      } else {
        await _add630b();
      }
    }
  }

  Future<void> _add630b() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await _addProcedure630bUseCase.execute(_buildRequest());

        // Refresh màn đợt kê khai sau khi thêm mới thành công
        eventBus.fire(const RefreshDeclarationPeriodEvent());

        nav.showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          type: SnackBarType.success,
        );
        if (argument.isAddPeriodFromDeclarePeriod) {
          nav.offNamed(
            AppRoutesCl.staffList.path,
            arguments: StaffListArgument(
              declarationPeriodId: argument.declarationPeriodId,
              procedureType: ProcedureType.procedure630b,
            ),
          );
        } else if (argument.isAddStaffFromStaffList) {
          nav.back(
            result: argument.declarationPeriodId,
          );
        }
      },
    );
  }

  DeclareInfo630b _buildRequest() {
    return DeclareInfo630b(
      id: id,
      periodId: argument.declarationPeriodId,
      fullName: fullNameTextCtrl.text.trim(),
      bhxhNumber: bhxhTextCtrl.text.trim(),
      cccdNumber: cccdTextCtrl.text.trim(),
      employeeId: staffCodeTextCtrl.text.trim(),
      adjustment: declareForm.value?.value ?? '',
      groupCode: benefitGroup.value?.value ?? '',
      groupCodeLv2: benefitGroupLv2.value?.maNhomHuongC2 ?? '',
      fromDate: convertStringToDateSafe(fromDateCtrl.text, PATTERN_1),
      toDate: convertStringToDateSafe(toDateCtrl.text, PATTERN_1),
      totalDays: int.tryParse(countDayTextCtrl.text),
      unitFromDate:
          convertStringToDateSafe(fromDateUnitTextCtrl.text, PATTERN_1),
      dayOff: weeklyDayOffString,
      seriNumber: serialNumberCtrl.text.trim(),
      childDob: convertStringToDateSafe(birthDayChildCtrl.text, PATTERN_1),
      childCount: int.tryParse(numberChildCtrl.text),
      childDeathCount: int.tryParse(numberChildDeathCtrl.text),
      antenatalCondition: pregnancyCondition.value?.value ?? '',
      childbirthCondition: childbirthCondition.value?.value ?? '',
      maternityLeave: maternityRest.value?.value ?? '',
      fatherLeave: parentalLeave.value?.value ?? '',
      contraceptiveMethod: contraception.value?.value ?? '',
      adoptionDate: convertStringToDateSafe(adoptionDateCtrl.text, PATTERN_1),
      actualWorkDate:
          convertStringToDateSafe(returnWorkDateCtrl.text, PATTERN_1),
      childDeathDate:
          convertStringToDateSafe(childDeathDateCtrl.text, PATTERN_1),
      motherDeathDate:
          convertStringToDateSafe(motherDeathDateCtrl.text, PATTERN_1),
      surrogatePregnancy: surrogacy.value?.value ?? '',
      conclusionDate:
          convertStringToDateSafe(conclusionDateCtrl.text, PATTERN_1),
      childBhxhNumber: bhxhCodeChildCtrl.text.trim(),
      childBhyt: bhytCardCodeChildCtrl.text.trim(),
      motherBhxhNumber: bhxhCodeMotherCtrl.text.trim(),
      motherBhyt: bhytCardMotherCtrl.text.trim(),
      motherCccd: cccdMotherCtrl.text.trim(),
      medicalAssessmentFee: int.tryParse(medicalFeeCtrl.text),
      bhxhNND: guardianBhxhCtrl.text.trim(),
      surgery32Weeks: surgeryOrUnder32Week.value?.value ?? '',
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
      pregnancyAge: int.tryParse(pregnancyWeekCtrl.text),
    );
  }

  String get weeklyDayOffString =>
      weeklyDayOffs.map((dayOff) => dayOff.value).join(';');

  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }

  /// Trả về "true" khi "Hình thức nhận" là "Chi trả qua ATM"
  bool get isATMpayment {
    return receiveForm.value?.value == ATMPaymentValue;
  }

  // REF: BHW-2969
  bool get isRequiredConclusionDate =>
      benefitGroupLv2.value?.maNhomHuongC2 == 'T44';

  // REF: BHW-2967 và BHW-2965
  // "Ngày con chết" và "Số con chết"
  bool get isRequiredChildDeathDate => requiredDateAndCountChildDeath
      .contains(benefitGroupLv2.value?.maNhomHuongC2);

  // REF: BHW-2968
  bool get isRequiredAdoptionDate => conditionRequiredAdoptionDate
      .contains(benefitGroupLv2.value?.maNhomHuongC2);

  // REF: BHW-2962
  bool get isRequiredPregnancyWeek =>
      requiredPregnancyWeek.contains(benefitGroupLv2.value?.maNhomHuongC2);

  // REF: BHW-2964 và BHW-2963
  // Dùng cho "Số con" và "Ngày sinh con"
  bool get isRequiredBirthAndConutChild =>
      requiredBirthAndCountChild.contains(benefitGroupLv2.value?.maNhomHuongC2);

  // REF: BHW-2996
  bool get isRequiredPregnancyCondition =>
      benefitGroupLv2.value?.maNhomHuongC2 == 'T11';

  void onChangeBenefitGroup(BenefitGroup630? method) {
    if (method == null) {
      return;
    }
    benefitGroup.value = method;
    benefitGroupLv2.value = null;
  }

  Future<void> get630bDetail() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final staffId = argument.staffId;
        if (staffId == null) {
          return;
        }
        final response = await _getDetailProcedure630bUseCase.execute(staffId);

        mapFrom630bDetail(response);
      },
    );
  }

  Future<void> _update630b() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
        // => Chặn việc cập nhật
        if (id == null) {
          nav.showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
          return;
        }

        await _updateProcedure630bUseCase.execute(_buildRequest());

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

  void goToSelectStaffPage() async {
    KeyBoard.hide();
    final result = await nav.toNamed(
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

  void onChangeDeclareMethod(Category? method) {
    if (method == null) {
      return;
    }
    declareForm.value = method;

    // Nếu chọn hình thức kê khai khác "Phát sinh" (1) thì reset các trường liên quan
    // REF: BHW-3039
    if (method.value != declareMethodArisingValue) {
      serialNumberCtrl.clear();
      pregnancyCondition.value = null;
      pregnancyWeekCtrl.clear();
      contraception.value = null;
      childbirthCondition.value = null;
      birthDayChildCtrl.clear();
      numberChildCtrl.clear();
      bhxhCodeChildCtrl.clear();
      bhytCardCodeChildCtrl.clear();
      cccdMotherCtrl.clear();
      surgeryOrUnder32Week.value = null;
      motherDeathDateCtrl.clear();
      conclusionDateCtrl.clear();
      medicalFeeCtrl.clear();
      guardianBhxhCtrl.clear();
      maternityRest.value = null;
      parentalLeave.value = null;
      surrogacy.value = null;
      supplementalPeriodCtrl.clear();
      numberChildDeathCtrl.clear();
      childDeathDateCtrl.clear();
      adoptionDateCtrl.clear();
      returnWorkDateCtrl.clear();
      bhxhCodeMotherCtrl.clear();
      bhytCardMotherCtrl.clear();
    }

    // REF: BHW-3039
    if (method.value != declareMethodAdjustValue) {
      resolvedPeriodCtrl.clear();
      resolvedDateCtrl.clear();
      adjustReasonCtrl.clear();
    }
  }

  void mapFrom630bDetail(DeclareInfo630b detail) {
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
    staffCodeTextCtrl.text = detail.employeeId!.trim();

    // Hình thức kê khai
    declareForm.value = AppData.instance.declareForm[detail.adjustment];

    // Mã nhóm hưởng
    benefitGroup.value = AppData.instance.benefitGroup630b.firstWhereOrNull(
      (item) => item.value == detail.groupCode,
    );

    // Mã nhóm hưởng cấp 2
    benefitGroupLv2.value =
        benefitGroup.value?.benefitGroupLv2.firstWhereOrNull(
      (item) => item.maNhomHuongC2 == detail.groupCodeLv2,
    );

    // Từ ngày
    fromDateCtrl.text =
        convertDateToStringSafe(detail.fromDate, PATTERN_1) ?? '';

    // Đến ngày
    toDateCtrl.text = convertDateToStringSafe(detail.toDate, PATTERN_1) ?? '';

    // Tổng số ngày
    countDayTextCtrl.text = detail.totalDays?.toString() ?? '';

    // Từ ngày đơn vị
    fromDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.unitFromDate, PATTERN_1) ?? '';

    // Ngày nghỉ tuần
    // Vì BE trả về kiểu "ngayNghiTuan": "t3;t4;t5" nên phải làm như này
    final dayOff = detail.dayOff;
    if (dayOff != null && dayOff.isNotEmpty) {
      weeklyDayOffs.value = dayOff
          .split(';')
          .map((item) => WeeklyDayOffEnum.parse(item.trim()))
          .whereType<WeeklyDayOffEnum>()
          .toList();
    }

    // Số serial
    if (detail.seriNumber != null) {
      serialNumberCtrl.text = detail.seriNumber!.trim();
    }

    // Điều kiện khám thai
    pregnancyCondition.value =
        AppData.instance.pregnancyCondition[detail.antenatalCondition];

    // Tuổi thai
    if (detail.pregnancyAge != null) {
      pregnancyWeekCtrl.text = detail.pregnancyAge.toString();
    }

    // Biện pháp tránh thai
    contraception.value =
        AppData.instance.contraception[detail.contraceptiveMethod];

    // Điều kiện sinh con
    childbirthCondition.value =
        AppData.instance.childBirthCondition[detail.childbirthCondition];

    // Ngày sinh con
    birthDayChildCtrl.text =
        convertDateToStringSafe(detail.childDob, PATTERN_1) ?? '';

    // Số con
    if (detail.childCount != null && detail.childCount! > 0) {
      numberChildCtrl.text = detail.childCount.toString();
    }

    // Mã số BHXH của con
    if (detail.childBhxhNumber != null) {
      bhxhCodeChildCtrl.text = detail.childBhxhNumber!.trim();
    }

    // Mã thẻ BHYT của con
    if (detail.childBhyt != null) {
      bhytCardCodeChildCtrl.text = detail.childBhyt!.trim();
    }

    // Số con chết
    numberChildDeathCtrl.text = detail.childDeathCount?.toString() ?? '';

    // Ngày con chết
    childDeathDateCtrl.text =
        convertDateToStringSafe(detail.childDeathDate, PATTERN_1) ?? '';

    // Ngày nhận con
    adoptionDateCtrl.text =
        convertDateToStringSafe(detail.adoptionDate, PATTERN_1) ?? '';

    // Ngày đi làm thực tế
    returnWorkDateCtrl.text =
        convertDateToStringSafe(detail.actualWorkDate, PATTERN_1) ?? '';

    // Mã số BHXH của mẹ
    if (detail.motherBhxhNumber != null) {
      bhxhCodeMotherCtrl.text = detail.motherBhxhNumber!.trim();
    }

    // Mã số BHYT của mẹ
    if (detail.motherBhyt != null) {
      bhytCardMotherCtrl.text = detail.motherBhyt!.trim();
    }

    // Số CMND của mẹ
    if (detail.motherCccd != null) {
      cccdMotherCtrl.text = detail.motherCccd!.trim();
    }

    // Phẫu thuật hoặc thai dưới 32 tuần
    surgeryOrUnder32Week.value =
        AppData.instance.surgeryPregnancy32w[detail.surgery32Weeks];

    // Ngày mẹ chết
    motherDeathDateCtrl.text =
        convertDateToStringSafe(detail.motherDeathDate, PATTERN_1) ?? '';

    // Ngày kết luận
    conclusionDateCtrl.text =
        convertDateToStringSafe(detail.conclusionDate, PATTERN_1) ?? '';

    // Phí giám định y khoa
    medicalFeeCtrl.text = detail.medicalAssessmentFee?.toString() ?? '';

    // Số BHXH của người nuôi dưỡng (TH mẹ chết)
    if (detail.bhxhNND != null) {
      guardianBhxhCtrl.text = detail.bhxhNND!.trim();
    }

    // Nghỉ dưỡng thai
    maternityRest.value =
        AppData.instance.maternityLeave[detail.maternityLeave];

    // Nghỉ chăm con
    parentalLeave.value = AppData.instance.parentalLeave[detail.fatherLeave];

    // Mang thai hộ
    surrogacy.value = AppData.instance.surrogacy[detail.surrogatePregnancy];

    // Đợt bổ sung
    if (detail.extraBatch != null) {
      supplementalPeriodCtrl.text = detail.extraBatch!.trim();
    }

    // Mã hồ sơ
    fileCodeTextCtrl.text = detail.dossierId.trim();

    // Ghi chú
    if (detail.note != null) {
      noteTextCtrl.text = detail.note!.trim();
    }

    // Hình thức nhận
    receiveForm.value = AppData.instance.receiveForm[detail.receiveType];

    // Số tài khoản ngân hàng
    if (detail.bankAccount != null) {
      bankNumberCtrl.text = detail.bankAccount!.trim();
    }

    // Tên chủ tài khoản
    if (detail.accountName != null) {
      accountHolderNameCtrl.text = detail.accountName!.trim();
    }

    // Ngân hàng
    selectedBank.value =
        AppData.instance.bank.firstWhereOrNull((item) => item == detail.bank);

    // Đợt đã giải quyết
    if (detail.resolvedBatch != null) {
      resolvedPeriodCtrl.text = detail.resolvedBatch!.trim();
    }

    // Ngày đã giải quyết
    resolvedDateCtrl.text =
        convertDateToStringSafe(detail.prevApproveDate, PATTERN_1) ?? '';

    // Lý do điều chỉnh
    if (detail.adjustReason != null) {
      adjustReasonCtrl.text = detail.adjustReason!.trim();
    }
  }
}
