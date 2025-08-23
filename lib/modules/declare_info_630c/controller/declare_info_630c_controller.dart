import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare_info_630c/model/declare_info_630c_request.dart';
import 'package:v_bhxh/modules/declare_info_630c/model/declare_info_630c_response.dart';
import 'package:v_bhxh/modules/declare_info_630c/repository/declare_info_630c_repository.dart';
import 'package:v_bhxh/modules/login/model/categories_630/bank_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/benefit_group_630_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/declare_form_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/receive_form_model.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../declare/staff_list/model/model_src.dart';

// REF: BHW-3103
const declineValid = ['D301', 'D302', 'D303'];

class DeclareInfo630cController extends BaseGetxController {
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
  final declareForm = Rxn<DeclareForm630Model>();

  /// Mã nhóm hưởng *
  final benefitGroup = Rxn<BenefitGroup630Model>();

  /// Từ ngày *
  final toDateCtrl = TextEditingController();

  /// Đến ngày *
  final fromDateCtrl = TextEditingController();

  /// Tổng số ngày *
  final countDayTextCtrl = TextEditingController();

  /// Từ ngày đơn vị *
  final fromDateUnitTextCtrl = TextEditingController();

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
  final receiveForm = Rxn<ReceiveFormModel>();

  /// Số tài khoản ngân hàng *
  final bankNumberCtrl = TextEditingController();

  /// Tên chủ tài khoản *
  final accountHolderNameCtrl = TextEditingController();

  /// Ngân hàng *
  final selectedBank = Rxn<BankModel>();

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

  final DeclareInfoArgument argument = Get.arguments;

  /// Trả về "true" khi "Hình thức kê khai" là "Điều chỉnh"
  bool get isAdjustDeclareForm {
    return declareForm.value?.value == declareMethodAdjustValue;
  }

  late final _repository = DeclareInfo630cRepository(this);

  final declarationPeriodController =
      Get.findOrNull<DeclarationPeriodController>();

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
    try {
      showLoadingOverlay();
      final response = await _repository.addProcedure630c(_buildRequest());
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
              procedureType: ProcedureType.procedure630c,
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

  DeclareInfo630cRequest _buildRequest() {
    return DeclareInfo630cRequest(
      id: id,
      kyKeKhaiId: argument.declarationPeriodId,
      hoTen: fullNameTextCtrl.text.trim(),
      maSoBhxh: bhxhTextCtrl.text.trim(),
      soCmnd: cccdTextCtrl.text.trim(),
      maNhanVien: staffCodeTextCtrl.text.trim(),
      phatSinhDieuChinh: declareForm.value?.value ?? '',
      maNhomHuong: benefitGroup.value?.value ?? '',
      tuNgay: convertStringToDateSafe(fromDateCtrl.text, PATTERN_1),
      denNgay: convertStringToDateSafe(toDateCtrl.text, PATTERN_1),
      tongSoNgay: int.tryParse(countDayTextCtrl.text),
      tuNgayDonVi:
          convertStringToDateSafe(fromDateUnitTextCtrl.text, PATTERN_1),
      ngayTroLaiLamViec:
          convertStringToDateSafe(returnWorkDateCtrl.text, PATTERN_1),
      ngayGiamDinh: convertStringToDateSafe(appraisalDateCtrl.text, PATTERN_1),
      tyLeSuyGiam: int.tryParse(rateToDeclineCtrl.text),
      soSeriCT: serialNumberCtrl.text.trim(),
      dotBoSung: supplementalPeriodCtrl.text.trim(),
      maHoSo: fileCodeTextCtrl.text.trim(),
      ghiChu: noteTextCtrl.text.trim(),
      hinhThucNhan: receiveForm.value?.value ?? '',
      soTaiKhoan: bankNumberCtrl.text.trim(),
      tenChuTaiKhoan: accountHolderNameCtrl.text.trim(),
      maNganHang: selectedBank.value?.code,
      dotDaGiaiQuyet: resolvedPeriodCtrl.text.trim(),
      tuNgayDuyetTruoc:
          convertStringToDateSafe(resolvedDateCtrl.text, PATTERN_1),
      lyDoDieuChinh: adjustReasonCtrl.text.trim(),
    );
  }

  Future<void> _get630cDetail() async {
    final staffId = argument.staffId;
    if (staffId == null) {
      return;
    }
    try {
      showLoadingOverlay();

      final response = await _repository.getDetail630c(id: staffId);
      final infoDetail = response.result;
      if (response.isSuccess && infoDetail != null) {
        mapFrom630cDetail(infoDetail);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void mapFrom630cDetail(DeclareInfo630cResponse detail) {
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

    // Hìnhh thức kê khai
    declareForm.value = AppData.instance.declareForm.firstWhereOrNull(
      (item) => item.value == detail.phatSinhDieuChinh,
    );

    // Mã nhóm hưởng
    benefitGroup.value = AppData.instance.benefitGroup630c.firstWhereOrNull(
      (item) => item.value == detail.maNhomHuong,
    );

    // Từ ngày
    fromDateCtrl.text = convertDateToStringSafe(detail.tuNgay, PATTERN_1) ?? '';

    // Đến ngày
    toDateCtrl.text = convertDateToStringSafe(detail.denNgay, PATTERN_1) ?? '';

    // Tổng số ngày
    countDayTextCtrl.text = detail.tongSoNgay.toString();

    // Từ ngày đơn vị
    fromDateUnitTextCtrl.text =
        convertDateToStringSafe(detail.tuNgayDonVi, PATTERN_1) ?? '';

    // Ngày trở lại làm việc
    returnWorkDateCtrl.text =
        convertDateToStringSafe(detail.ngayTroLaiLamViec, PATTERN_1) ?? '';

    // Ngày giám định
    appraisalDateCtrl.text =
        convertDateToStringSafe(detail.ngayGiamDinh, PATTERN_1) ?? '';

    // Tỷ lệ suy giảm
    if (detail.tyLeSuyGiam != null) {
      rateToDeclineCtrl.text = detail.tyLeSuyGiam.toString();
    }
    // Số serial
    serialNumberCtrl.text = detail.soSeriCT?.trim() ?? '';

    // Đợt bổ sung
    supplementalPeriodCtrl.text = detail.dotBoSung?.trim() ?? '';

    // Mã hồ sơ
    fileCodeTextCtrl.text = detail.maHoSo?.trim() ?? '';

    // Ghi chú
    noteTextCtrl.text = detail.ghiChu?.trim() ?? '';

    // Hình thức nhận
    receiveForm.value = AppData.instance.receiveForm.firstWhereOrNull(
      (item) => item.value == detail.hinhThucNhan,
    );

    // Số tài khoản ngân hàng
    bankNumberCtrl.text = detail.soTaiKhoan?.trim() ?? '';

    // Tên chủ tài khoản
    accountHolderNameCtrl.text = detail.tenChuTaiKhoan?.trim() ?? '';

    // Ngân hàng
    selectedBank.value = AppData.instance.bank.firstWhereOrNull(
      (item) => item == detail.nganHang,
    );

    // Đợt đã giải quyết
    resolvedPeriodCtrl.text = detail.dotDaGiaiQuyet?.trim() ?? '';

    // Ngày đã giải quyết
    resolvedDateCtrl.text =
        convertDateToStringSafe(detail.tuNgayDuyetTruoc, PATTERN_1) ?? '';

    // Lý do điều chỉnh
    adjustReasonCtrl.text = detail.lyDoDieuChinh?.trim() ?? '';
  }

  Future<void> _update630c() async {
    try {
      // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
      // => Chặn việc cập nhật
      if (id == null) {
        showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
        return;
      }

      showLoadingOverlay();

      final response = await _repository.update630c(_buildRequest());

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

  bool get isRateToDecline => declineValid.contains(benefitGroup.value?.value);
}
