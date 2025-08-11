import 'package:collection/collection.dart';

import '../../../base_app/model/app_data.dart';
import '../../declare/staff_list/model/staff_list_argument.dart';
import '../../login/model/categories_630/categories_630_src.dart';
import '../../select_staff/model/model_src.dart';
import '../../src.dart';

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
    try {
      showLoadingOverlay();
      final response = await repository.addProcedure630b(_buildRequest());
      if (response.result != null && response.isSuccess) {
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        if (argument.isAddPeriodFromDeclarePeriod) {
          Get.offNamed(
            AppRoutes.staffList.path,
            arguments: StaffListArgument(
              declarationPeriodId: argument.declarationPeriodId,
              procedureType: ProcedureType.procedure630b,
            ),
          )?.then((value) {
            declarationPeriodController?.getDeclarationPeriods();
          });
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

  DeclareInfo630bRequest _buildRequest() {
    return DeclareInfo630bRequest(
      id: id,
      kyKeKhaiId: argument.declarationPeriodId,
      hoTen: fullNameTextCtrl.text,
      maSoBhxh: bhxhTextCtrl.text,
      soCmnd: cccdTextCtrl.text,
      maNhanVien: staffCodeTextCtrl.text,
      phatSinhDieuChinh: declareForm.value?.value ?? '',
      maNhomHuong: benefitGroup.value?.value ?? '',
      maNhomHuong2: benefitGroupLv2.value?.maNhomHuongC2 ?? '',
      tuNgay: convertStringToDateSafe(fromDateCtrl.text, PATTERN_1),
      denNgay: convertStringToDateSafe(toDateCtrl.text, PATTERN_1),
      tongSoNgay: int.tryParse(countDayTextCtrl.text.trim()),
      tuNgayDonVi:
          convertStringToDateSafe(fromDateUnitTextCtrl.text, PATTERN_1),
      ngayNghiTuan: weeklyDayOffString,
      soSeriCT: serialNumberCtrl.text,
      ngaySinhCon: convertStringToDateSafe(fromDateCtrl.text, PATTERN_1),
      soCon: int.tryParse(numberChildCtrl.text.trim()),
      soCCHoacThaiCL: int.tryParse(numberChildDeathCtrl.text.trim()),
      dieuKienKhamThai: pregnancyCondition.value?.value ?? '',
      dieuKienSinhCon: childbirthCondition.value?.value ?? '',
      nghiDuongThai: maternityRest.value?.value ?? '',
      chaNghiChamCon: parentalLeave.value?.value ?? '',
      bienPhapKHHGD: contraception.value?.value ?? '',
      ngayNhanCon: convertStringToDateSafe(adoptionDateCtrl.text, PATTERN_1),
      ngayDiLamThucTe:
          convertStringToDateSafe(returnWorkDateCtrl.text, PATTERN_1),
      ngayConChet: convertStringToDateSafe(childDeathDateCtrl.text, PATTERN_1),
      ngayMeChet: convertStringToDateSafe(motherDeathDateCtrl.text, PATTERN_1),
      mangThaiHo: surrogacy.value?.value ?? '',
      ngayKetLuan: convertStringToDateSafe(conclusionDateCtrl.text, PATTERN_1),
      maSoBHXHCuaCon: bhxhCodeChildCtrl.text,
      theBhytCuaCon: bhytCardCodeChildCtrl.text,
      maSoBHXHCuaMe: bhxhCodeMotherCtrl.text,
      theBHYTCuaMe: bhytCardMotherCtrl.text,
      soCMNDCuaMe: cccdMotherCtrl.text,
      phiGiamDinhYKhoa: int.tryParse(medicalFeeCtrl.text.trim()),
      soBHXHNND: guardianBhxhCtrl.text,
      phauThuatThai32: surgeryOrUnder32Week.value?.value ?? '',
      dotBoSung: supplementalPeriodCtrl.text,
      maHoSo: fileCodeTextCtrl.text,
      ghiChu: noteTextCtrl.text,
      hinhThucNhan: receiveForm.value?.value ?? '',
      soTaiKhoan: bankNumberCtrl.text,
      tenChuTaiKhoan: accountHolderNameCtrl.text,
      maNganHang: selectedBank.value?.code,
      dotDaGiaiQuyet: resolvedPeriodCtrl.text,
      tuNgayDuyetTruoc:
          convertStringToDateSafe(resolvedDateCtrl.text, PATTERN_1),
      lyDoDieuChinh: adjustReasonCtrl.text,
      tuoiThai: int.tryParse(pregnancyWeekCtrl.text),
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

  void onChangeBenefitGroup(BenefitGroup630bModel? method) {
    if (method == null) {
      return;
    }
    benefitGroup.value = method;
    benefitGroupLv2.value = null;
  }

  // REF: 2967
  bool get isRequiredChildDeathDate {
    return [
      'T61',
      'T62',
      'T63',
      'T104',
      'T105',
      'T106',
      'T114',
      'T115',
      'T116',
    ].contains(benefitGroupLv2.value?.maNhomHuongC2);
  }

  Future<void> get630bDetail() async {
    final staffId = argument.staffId;
    if (staffId == null) {
      return;
    }
    try {
      showLoadingOverlay();

      final response = await repository.getDetail630b(id: staffId);
      final infoDetail = response.result;
      if (response.isSuccess && infoDetail != null) {
        mapFrom630bDetail(infoDetail);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _update630b() async {
    try {
      // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
      // => Chặn việc cập nhật
      if (id == null) {
        showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
        return;
      }

      showLoadingOverlay();

      final response = await repository.update630b(_buildRequest());

      if (response.isSuccess) {
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

  void goToSelectStaffPage() async {
    final result = await Get.toNamed(
      AppRoutes.selectStaff.path,
      // Truyền id sang để biết nhân viên nào đang được chọn
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

  void mapFromStaffDetail(StaffDetailResponse staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    selectedStaffId = staff.id;

    fullNameTextCtrl.text = staff.hoTen?.trim() ?? '';

    bhxhTextCtrl.text = staff.maSoBHXH?.trim() ?? '';

    cccdTextCtrl.text = staff.soCCCD?.trim() ?? '';
  }

// REF: BHW-2968
  bool get isRequiredAdoptionDate {
    final maNhomHuongLv2 = benefitGroupLv2.value?.maNhomHuongC2;
    return [
      'T81',
      'T82',
      'T83',
      'T111',
      'T112',
      'T113',
      'T114',
      'T115',
      'T116',
      'T117',
      'T118',
    ].contains(maNhomHuongLv2);
  }

  void mapFrom630bDetail(DeclareInfo630bResponse detail) {
    id = detail.id;

    // Họ và tên
    fullNameTextCtrl.text = detail.hoTen.trim();

    // Mã số BHXH
    bhxhTextCtrl.text = detail.maSoBhxh.trim();

    // Số CCCD
    if (detail.soCmnd != null) {
      cccdTextCtrl.text = detail.soCmnd!.trim();
    }

    // Mã nhân viên
    if (detail.maNhanVien != null) {
      staffCodeTextCtrl.text = detail.maNhanVien!.trim();
    }

    // Hình thức kê khai
    declareForm.value = AppData.instance.declareForm.firstWhereOrNull(
      (item) => item.value == detail.phatSinhDieuChinh,
    );

    // Mã nhóm hưởng
    if (detail.maNhomHuong != null) {
      benefitGroup.value = detail.maNhomHuong;
    }

    // Mã nhóm hưởng cấp 2
    if (detail.maNhomHuong2 != null) {
      benefitGroupLv2.value = detail.maNhomHuong2;
    }

    // Từ ngày
    fromDateCtrl.text = convertDateToStringSafe(detail.tuNgay, PATTERN_1) ?? '';

    // Đến ngày
    toDateCtrl.text = convertDateToStringSafe(detail.denNgay, PATTERN_1) ?? '';

    // Tổng số ngày
    countDayTextCtrl.text = detail.tongSoNgay.toString();

    // Từ ngày đơn vị
    fromDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.tuNgayDonVi, PATTERN_1) ?? '';

    // Ngày nghỉ tuần
    // Vì BE trả về kiểu "ngayNghiTuan": "t3;t4;t5" nên phải làm như này
    final dayOff = detail.ngayNghiTuan;
    if (dayOff != null && dayOff.isNotEmpty) {
      weeklyDayOffs.value = dayOff
          .split(';')
          .map((item) => WeeklyDayOffEnum.parse(item.trim()))
          .whereType<WeeklyDayOffEnum>()
          .toList();
    }

    // Số serial
    if (detail.soSeriCT != null) {
      serialNumberCtrl.text = detail.soSeriCT!.trim();
    }

    // Điều kiện khám thai
    pregnancyCondition.value = AppData.instance.pregnancyCondition
        .firstWhereOrNull((item) => item.value == detail.dieuKienKhamThai);
    // Tuổi thai
    if (detail.tuoiThai != null) {
      pregnancyWeekCtrl.text = detail.tuoiThai.toString();
    }

    // Biện pháp tránh thai
    contraception.value = AppData.instance.contraception
        .firstWhereOrNull((item) => item.value == detail.bienPhapKHHGD);

    // Điều kiện sinh con
    childbirthCondition.value = AppData.instance.childBirthCondition
        .firstWhereOrNull((item) => item.value == detail.dieuKienSinhCon);

    // Ngày sinh con
    birthDayChildCtrl.text =
        convertDateToStringSafe(detail.ngaySinhCon, PATTERN_1) ?? '';

    // Số con
    numberChildCtrl.text = detail.soCon.toString();

    // Mã số BHXH của con
    if (detail.maSoBHXHCuaCon != null) {
      bhxhCodeChildCtrl.text = detail.maSoBHXHCuaCon!.trim();
    }

    // Mã thẻ BHYT của con
    if (detail.theBhytCuaCon != null) {
      bhytCardCodeChildCtrl.text = detail.theBhytCuaCon!.trim();
    }

    // Số con chết
    if (detail.soCCHoacThaiCL != null) {
      numberChildDeathCtrl.text = detail.soCCHoacThaiCL.toString();
    }

    // Ngày con chết
    childDeathDateCtrl.text =
        convertDateToStringSafe(detail.ngayConChet, PATTERN_1) ?? '';

    // Ngày nhận con
    adoptionDateCtrl.text =
        convertDateToStringSafe(detail.ngayNhanCon, PATTERN_1) ?? '';

    // Ngày đi làm thực tế
    returnWorkDateCtrl.text =
        convertDateToStringSafe(detail.ngayDiLamThucTe, PATTERN_1) ?? '';

    // Mã số BHXH của mẹ
    if (detail.maSoBHXHCuaMe != null) {
      bhxhCodeMotherCtrl.text = detail.maSoBHXHCuaMe!.trim();
    }

    // Mã số BHYT của mẹ
    if (detail.theBHYTCuaMe != null) {
      bhytCardMotherCtrl.text = detail.theBHYTCuaMe!.trim();
    }

    // Số CMND của mẹ
    if (detail.soCMNDCuaMe != null) {
      cccdMotherCtrl.text = detail.soCMNDCuaMe!.trim();
    }

    // Phẫu thuật hoặc thai dưới 32 tuần
    surgeryOrUnder32Week.value = AppData.instance.surgeryPregnancy32w
        .firstWhereOrNull((item) => item.value == detail.phauThuatThai32);

    // Ngày mẹ chết
    motherDeathDateCtrl.text =
        convertDateToStringSafe(detail.ngayMeChet, PATTERN_1) ?? '';

    // Ngày kết luận
    conclusionDateCtrl.text =
        convertDateToStringSafe(detail.ngayKetLuan, PATTERN_1) ?? '';

    // Phí giám định y khoa
    medicalFeeCtrl.text = detail.phiGiamDinhYKhoa.toString();

    // Số BHXH của người nuôi dưỡng (TH mẹ chết)
    if (detail.soBHXHNND != null) {
      guardianBhxhCtrl.text = detail.soBHXHNND!.trim();
    }

    // Nghỉ dưỡng thai
    maternityRest.value = AppData.instance.maternityLeave
        .firstWhereOrNull((item) => item.value == detail.nghiDuongThai);

    // Nghỉ chăm con
    parentalLeave.value = AppData.instance.parentalLeave
        .firstWhereOrNull((item) => item.value == detail.chaNghiChamCon);

    // Mang thai hộ
    surrogacy.value = AppData.instance.surrogacy.firstWhereOrNull(
      (item) => item.value == detail.mangThaiHo,
    );

    // Đợt bổ sung
    if (detail.dotBoSung != null) {
      supplementalPeriodCtrl.text = detail.dotBoSung!.trim();
    }

    // Mã hồ sơ
    if (detail.maHoSo != null) {
      fileCodeTextCtrl.text = detail.maHoSo!.trim();
    }

    // Ghi chú
    if (detail.ghiChu != null) {
      noteTextCtrl.text = detail.ghiChu!.trim();
    }

    // Hình thức nhận
    receiveForm.value = AppData.instance.receiveForm
        .firstWhereOrNull((item) => item.value == detail.hinhThucNhan);

    // Số tài khoản ngân hàng
    selectedBank.value = AppData.instance.bank
        .firstWhereOrNull((item) => item == detail.nganHang);

    // Tên chủ tài khoản
    if (detail.tenChuTaiKhoan != null) {
      accountHolderNameCtrl.text = detail.tenChuTaiKhoan!.trim();
    }

    // Đợt đã giải quyết
    if (detail.dotDaGiaiQuyet != null) {
      resolvedPeriodCtrl.text = detail.dotDaGiaiQuyet!.trim();
    }

    // Ngày đã giải quyết
    resolvedDateCtrl.text =
        convertDateToStringSafe(detail.tuNgayDuyetTruoc, PATTERN_1) ?? '';

    // Lý do điều chỉnh
    if (detail.lyDoDieuChinh != null) {
      adjustReasonCtrl.text = detail.lyDoDieuChinh!.trim();
    }
  }
}
