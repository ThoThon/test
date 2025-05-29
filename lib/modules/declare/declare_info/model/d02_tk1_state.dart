import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

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
  final gender = Rxn<Gender>();

  /// Dân tộc *
  final selectedEthnic = Rxn<EthnicModel>();

  /// Quốc tịch *
  final selectedNationality = Rxn<NationModel>();

  void updateFromD02Detail(DeclareInfoDetailResponse detail) {
    final d02Lt = detail.d02Lt;

    if (d02Lt.hoTen != null) {
      fullNameTextCtrl.text = d02Lt.hoTen!.trim();
    }

    if (d02Lt.maSoBhxh != null) {
      bhxhTextCtrl.text = d02Lt.maSoBhxh!.trim();
    }

    if (d02Lt.cmnd != null) {
      cccdTextCtrl.text = d02Lt.cmnd!.trim();
    }

    if (d02Lt.ngaySinh != null) {
      dateOfBirth.value = d02Lt.ngaySinh;
    }

    if (d02Lt.gioiTinh != null) {
      gender.value = d02Lt.gioiTinh;
    }

    if (d02Lt.danToc != null) {
      selectedEthnic.value = d02Lt.danToc;
    }

    if (d02Lt.quocTich != null) {
      selectedNationality.value = d02Lt.quocTich;
    }
  }

  void dispose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
  }
}
