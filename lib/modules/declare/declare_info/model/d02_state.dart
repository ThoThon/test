import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../login/model/model_src.dart';

class D02State {
  /// id d02Lt dùng khi update
  String? id;

  final formKey = GlobalKey<FormState>();

  final autoValidateMode = AutovalidateMode.disabled.obs;

  String? selectedStaffId;

  /// Loại khai báo/Loại hồ sơ
  final declarationType = Rxn<DeclarationTypeModel>();

  /// Phương án
  final plan = Rxn<AdjustmentPlanModel>();

  /// Sinh dữ liệu Tk1-TS
  final isGenerateTk1Data = false.obs;

  /// Từ tháng/năm *
  final fromDateTextCtrl = TextEditingController();

  /// Đến tháng/năm *
  final toDateTextCtrl = TextEditingController();

  /// Cấp bậc/chức vụ *
  final positionTextCtrl = TextEditingController();

  /// Nơi làm việc *
  final workplaceTextCtrl = TextEditingController();

  /// Đóng theo hệ số
  final isSalaryCoefficient = false.obs;

  /// Tiền lương/Hệ số *
  final salaryCoefficientTextCtrl = TextEditingController();

  /// PC chức vụ
  final positionAllowanceTextCtrl = TextEditingController();

  /// PC TNN (%) - Phụ cấp thâm nhiên nghề
  final pcTNNTextCtrl = TextEditingController();

  /// PC TN vượt khung (%)
  final pcTNVuotKhungTextCtrl = TextEditingController();

  /// Phụ cấp lương
  final salaryAllowanceTextCtrl = TextEditingController();

  /// Các khoản bổ sung
  final otherAllowanceTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  /// Sinh dữ liệu D01-TS
  final isGenerateD01Data = false.obs;

  void mapFromD02Detail(DeclareInfoDetailResponse detail) {
    final d02Lt = detail.d02Lt;

    id = d02Lt.id;

    if (d02Lt.loaiHoSo != null) {
      declarationType.value = d02Lt.loaiHoSo;
    }

    if (d02Lt.phuongAn != null) {
      plan.value = d02Lt.phuongAn;
    }

    isGenerateTk1Data.value = d02Lt.xuatTk01;

    if (d02Lt.tuThang != null) {
      fromDateTextCtrl.text = d02Lt.tuThang ?? '';
    }

    if (d02Lt.denThang != null) {
      toDateTextCtrl.text = d02Lt.denThang ?? '';
    }

    if (d02Lt.chucVu != null) {
      positionTextCtrl.text = d02Lt.chucVu!.trim();
    }

    if (d02Lt.noiLamViec != null) {
      workplaceTextCtrl.text = d02Lt.noiLamViec!.trim();
    }

    isSalaryCoefficient.value = d02Lt.dongTheoHeSo;

    if (d02Lt.tienLuong.isStringNotEmpty) {
      salaryCoefficientTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.tienLuong!);
    }

    if (d02Lt.phuCapChucVu != null && d02Lt.phuCapChucVu! > 0) {
      positionAllowanceTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapChucVu!);
    }

    if (d02Lt.phuCapThamNienVuotKhung != null &&
        d02Lt.phuCapThamNienVuotKhung! > 0) {
      pcTNVuotKhungTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapThamNienVuotKhung!);
    }

    if (d02Lt.phuCapThamNienNghe != null && d02Lt.phuCapThamNienNghe! > 0) {
      pcTNNTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapThamNienNghe!);
    }

    if (d02Lt.phuCapLuong.isStringNotEmpty) {
      salaryAllowanceTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapLuong!);
    }

    if (d02Lt.phuCapBoSung.isStringNotEmpty) {
      otherAllowanceTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapBoSung!);
    }

    if (d02Lt.ghiChu != null) {
      noteTextCtrl.text = d02Lt.ghiChu!.trim();
    }

    isGenerateD01Data.value = d02Lt.xuatD01;
  }

  void mapFromStaffDetail(StaffDetailResponse staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    positionTextCtrl.text = staff.chucVu?.trim() ?? '';

    selectedStaffId = staff.id;

    isSalaryCoefficient.value = staff.dongTheoHeSo;

    salaryCoefficientTextCtrl.text =
        staff.tienLuong != null && staff.tienLuong! > 0
            ? CurrencyUtils.formatCurrencyForeign(staff.tienLuong!)
            : '';

    positionAllowanceTextCtrl.text =
        staff.phuCapChucVu != null && staff.phuCapChucVu! > 0
            ? CurrencyUtils.formatCurrencyForeign(
                staff.phuCapChucVu!,
                lastDecimal: 2,
              )
            : '';

    pcTNVuotKhungTextCtrl.text = staff.phuCapThamNienVuotKhung != null &&
            staff.phuCapThamNienVuotKhung! > 0
        ? CurrencyUtils.formatCurrencyForeign(staff.phuCapThamNienVuotKhung!)
        : '';

    pcTNNTextCtrl.text =
        staff.phuCapThamNienNghe != null && staff.phuCapThamNienNghe! > 0
            ? CurrencyUtils.formatCurrencyForeign(staff.phuCapThamNienNghe!)
            : '';

    salaryAllowanceTextCtrl.text =
        staff.phuCapLuong != null && staff.phuCapLuong! > 0
            ? CurrencyUtils.formatCurrencyForeign(staff.phuCapLuong!)
            : '';

    otherAllowanceTextCtrl.text =
        staff.phuCapBoSung != null && staff.phuCapBoSung! > 0
            ? CurrencyUtils.formatCurrencyForeign(staff.phuCapBoSung!)
            : '';
  }

  void dispose() {
    fromDateTextCtrl.dispose();
    toDateTextCtrl.dispose();
    positionTextCtrl.dispose();
    workplaceTextCtrl.dispose();
    salaryCoefficientTextCtrl.dispose();
    positionAllowanceTextCtrl.dispose();
    pcTNNTextCtrl.dispose();
    pcTNVuotKhungTextCtrl.dispose();
    salaryAllowanceTextCtrl.dispose();
    otherAllowanceTextCtrl.dispose();
    noteTextCtrl.dispose();
  }
}
