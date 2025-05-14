import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model_src.dart';

/// Các state dùng chung ở 2 form D02 vầ TK1
class D02Tk1State {
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

  void dispose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
  }
}
