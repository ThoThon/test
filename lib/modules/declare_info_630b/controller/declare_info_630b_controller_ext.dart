import 'package:v_bhxh/modules/declare_info_630b/model/declare_info_630b_request.dart';

import '../../declare/staff_list/model/staff_list_argument.dart';
import '../../login/model/categories_630/categories_630_src.dart';
import '../../src.dart';

extension DeclareInfo630bControllerExt on DeclareInfo630bController {
  Future<void> saveDraft() async {
    if (formKey.currentState?.validate() != true) {
      autoValidateMode.value = AutovalidateMode.always;
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
    } else {
      if (argument.isUpdateStaff) {
        // await _update630a();
      } else {
        await add630b();
      }
    }
  }

  Future<void> add630b() async {
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
              procedureType: ProcedureType.procedure630a,
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

  
}
