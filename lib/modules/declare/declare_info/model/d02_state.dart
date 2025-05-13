import 'package:flutter/material.dart';
import 'package:get/get.dart';

class D02State {
  final formKey = GlobalKey<FormState>();

  /// Loại khai báo
  final declareType = Rxn<String>();

  /// Phương án
  final plan = Rxn<String>();

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

  /// Tiền lương/Hệ số *
  final salaryTextCtrl = TextEditingController();

  /// PC chức vụ
  final positionAllowanceTextCtrl = TextEditingController();

  /// PC TNN (%)
  final pcTNNTextCtrl = TextEditingController();

  /// PC TN vượt khung (%)
  final pcTNVuotKhungTextCtrl = TextEditingController();

  /// Phụ cấp lương
  final salaryAllowanceTextCtrl = TextEditingController();

  /// Các khoản bổ sung
  final otherAllowanceTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  void dispose() {
    positionTextCtrl.dispose();
    workplaceTextCtrl.dispose();
    salaryTextCtrl.dispose();
    positionAllowanceTextCtrl.dispose();
    pcTNNTextCtrl.dispose();
    pcTNVuotKhungTextCtrl.dispose();
    salaryAllowanceTextCtrl.dispose();
    otherAllowanceTextCtrl.dispose();
    noteTextCtrl.dispose();
  }
}
