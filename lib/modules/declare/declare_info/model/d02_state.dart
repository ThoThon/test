import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class D02State {
  final formKey = GlobalKey<FormState>();

  /// Loại khai báo
  final declarationType = Rxn<DeclarationTypeModel>();

  /// Phương án
  final plan = Rxn<PlanEnum>();

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
