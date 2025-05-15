import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';

import 'family_member.dart';

class Tk1State {
  final formKey = GlobalKey<FormState>();

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
  final headOfHouseholdCCCDTextCtrl = TextEditingController();

  /// Tỉnh thường trú
  final selectedProvinceTT = Rxn<String>();

  /// Huyện thường trú
  final selectedDistrictTT = Rxn<String>();

  /// Xã thường trú
  final selectedWardTT = Rxn<String>();

  /// Địa chỉ thường trú
  final addressTTTextCtrl = TextEditingController();

  /// Danh sách thành viên trong gia đình
  final familyMembers = <FamilyMember>[
    FamilyMember(
      fullName: 'Nguyễn Văn A1',
      dateOfBirth: DateTime.now(),
      district: '',
      ethnic: '',
      gender: Gender.male,
      isParticipant: false,
      nationality: 'Việt Nam',
      province: 'Phú Thọ',
      relationship: 'Vợ',
      ward: '',
    ),
    FamilyMember(
      fullName: 'Nguyễn Văn B',
      dateOfBirth: DateTime.now(),
      district: '',
      ethnic: '',
      gender: Gender.male,
      isParticipant: false,
      nationality: 'Việt Nam',
      province: 'Phú Thọ',
      relationship: 'Con gái',
      ward: '',
    ),
    FamilyMember(
      fullName: 'Nguyễn Văn B',
      dateOfBirth: DateTime.now(),
      district: '',
      ethnic: '',
      gender: Gender.male,
      isParticipant: false,
      nationality: 'Việt Nam',
      province: 'Phú Thọ',
      relationship: 'Con trai',
      ward: '',
    ),
  ].obs;

  void dispose() {
    addressTextCtrl.dispose();
    addressReceiveTextCtrl.dispose();
    phoneTextCtrl.dispose();
    headOfHouseholdTextCtrl.dispose();
    headOfHouseholdCCCDTextCtrl.dispose();
    addressTTTextCtrl.dispose();
  }
}
