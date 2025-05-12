import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gender.dart';

class D02State {
  final formKey = GlobalKey<FormState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdTextCtrl = TextEditingController();

  /// Ngày sinh
  final dateOfBirth = Rxn<DateTime>();

  /// Giới tính *
  final gender = Gender.male.obs;

  /// Dân tộc *
  final selectedEthnic = Rxn<String>();

  /// Quốc tịch *
  final selectedNationality = Rxn<String>();

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
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
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
