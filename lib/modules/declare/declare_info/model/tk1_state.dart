import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'family_member.dart';
import 'gender.dart';

class Tk1State {
  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhNumberTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdNumberTextCtrl = TextEditingController();

  /// Ngày sinh
  final dateOfBirth = Rxn<DateTime>();

  /// Giới tính *
  final gender = Gender.male.obs;

  /// Dân tộc *
  final selectedEthnic = Rxn<String>();

  /// Quốc tịch *
  final selectedNationality = Rxn<String>();

  /// Tỉnh khai sinh *
  final selectedProvince = Rxn<String>();

  /// Huyện khai sinh *
  final selectedDistrict = Rxn<String>();

  /// Xã khai sinh *
  final selectedWard = Rxn<String>();

  /// Địa chỉ khai sinh *
  final addressTextCtrl = TextEditingController();

  /// Trùng địa chỉ khai sinh
  final isSameAddress = false.obs;

  /// Tỉnh nơi nhận *
  final selectedProvinceReceive = Rxn<String>();

  /// Huyện nơi nhận *
  final selectedDistrictReceive = Rxn<String>();

  /// Xã nơi nhận *
  final selectedWardReceive = Rxn<String>();

  /// Địa chỉ nơi nhận *
  final addressReceiveTextCtrl = TextEditingController();

  /// Tỉnh nơi KCB *
  final selectedProvinceKCB = Rxn<String>();

  /// Bệnh viện nơi KCB *
  final selectedHospital = Rxn<String>();

  /// SĐT liên hệ
  final phoneTextCtrl = TextEditingController();

  /// Người tham gia là chủ hộ
  final isHeadOfHousehold = false.obs;

  /// Họ và tên chủ hộ
  final headOfHouseholdTextCtrl = TextEditingController();

  /// Số CCCD/ĐDCN của chủ hộ
  final headOfHouseholdIdTextCtrl = TextEditingController();

  /// Tỉnh thường trú
  final selectedProvinceTT = Rxn<String>();

  /// Huyện thường trú
  final selectedDistrictTT = Rxn<String>();

  /// Xã thường trú
  final selectedWardTT = Rxn<String>();

  /// Địa chỉ thường trú
  final addressTTTextCtrl = TextEditingController();

  /// Danh sách thành viên trong gia đình
  final familyMembers = <FamilyMember>[].obs;

  void dispose() {
    fullNameTextCtrl.dispose();
    bhxhNumberTextCtrl.dispose();
    cccdNumberTextCtrl.dispose();
    addressTextCtrl.dispose();
    addressReceiveTextCtrl.dispose();
    phoneTextCtrl.dispose();
    headOfHouseholdTextCtrl.dispose();
    headOfHouseholdIdTextCtrl.dispose();
    addressTTTextCtrl.dispose();
  }
}
