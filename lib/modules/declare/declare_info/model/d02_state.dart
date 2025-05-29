import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/shares/base/ui/formatter/currency_utils.dart';

class D02State {
  final formKey = GlobalKey<FormState>();

  final autoValidateMode = AutovalidateMode.disabled.obs;

  /// Loại khai báo/Loại hồ sơ
  final declarationType = Rxn<DeclarationTypeModel>();

  /// Phương án
  final plan = Rxn<AdjustmentPlanModel>();

  /// Sinh dữ liệu Tk1-TS
  final isGenerateTk1Data = false.obs;

  /// Từ tháng/năm *
  final fromDate = Rxn<DateTime>();

  /// Đến tháng/năm *
  final toDate = Rxn<DateTime>();

  /// Cấp bập/chức vụ *
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

  void updateFromD02Detail(DeclareInfoDetailResponse detail) {
    final d02Lt = detail.d02Lt;

    if (d02Lt.loaiHoSo != null) {
      declarationType.value = d02Lt.loaiHoSo;
    }

    if (d02Lt.phuongAn != null) {
      plan.value = d02Lt.phuongAn;
    }

    isGenerateTk1Data.value = d02Lt.xuatTk01;

    if (d02Lt.tuThang != null) {
      fromDate.value = d02Lt.tuThang;
    }

    if (d02Lt.denThang != null) {
      toDate.value = d02Lt.denThang;
    }

    if (d02Lt.chucVu != null) {
      positionTextCtrl.text = d02Lt.chucVu!.trim();
    }

    if (d02Lt.noiLamViec != null) {
      workplaceTextCtrl.text = d02Lt.noiLamViec!.trim();
    }

    if (d02Lt.tienLuong != null && d02Lt.tienLuong! > 0) {
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

    if (d02Lt.phuCapLuong != null && d02Lt.phuCapLuong! > 0) {
      salaryAllowanceTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapLuong!);
    }

    if (d02Lt.phuCapBoSung != null && d02Lt.phuCapBoSung! > 0) {
      otherAllowanceTextCtrl.text =
          CurrencyUtils.formatCurrencyForeign(d02Lt.phuCapBoSung!);
    }

    if (d02Lt.ghiChu != null) {
      noteTextCtrl.text = d02Lt.ghiChu!.trim();
    }

    isGenerateD01Data.value = d02Lt.xuatD01;
  }

  void dispose() {
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
