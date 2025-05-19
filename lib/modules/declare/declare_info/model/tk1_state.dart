import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';

import 'family_member.dart';

class Tk1State {
  final formKey = GlobalKey<FormState>();

  /// Tỉnh khai sinh *
  final provinceOfBirth = Rxn<String>();

  /// Huyện khai sinh *
  final districtOfBirth = Rxn<String>();

  /// Xã khai sinh *
  final selectedWard = Rxn<String>();

  /// Địa chỉ khai sinh *
  final birthAddressTextCtrl = TextEditingController();

  /// Trùng địa chỉ khai sinh
  final isSameAddress = false.obs;

  /// Tỉnh nơi nhận *
  final provinceReceive = Rxn<String>();

  /// Huyện nơi nhận *
  final districtReceive = Rxn<String>();

  /// Xã nơi nhận *
  final wardReceive = Rxn<String>();

  /// Địa chỉ nơi nhận *
  final addressReceiveTextCtrl = TextEditingController();

  /// Tỉnh nơi KCB *
  final provinceKCB = Rxn<String>();

  /// Bệnh viện nơi KCB *
  final hospitalKCB = Rxn<String>();

  /// SĐT liên hệ
  final contactPhoneNumberTextCtrl = TextEditingController();

  /// Người tham gia là chủ hộ
  final participantHeadOfHousehold = false.obs;

  /// Họ và tên chủ hộ
  final headOfHouseholdTextCtrl = TextEditingController();

  /// Số CCCD/ĐDCN của chủ hộ
  final headOfHouseholdCCCDTextCtrl = TextEditingController();

  /// Tỉnh thường trú
  final provinceTT = Rxn<String>();

  /// Huyện thường trú
  final districtTT = Rxn<String>();

  /// Xã thường trú
  final wardTT = Rxn<String>();

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
    birthAddressTextCtrl.dispose();
    addressReceiveTextCtrl.dispose();
    contactPhoneNumberTextCtrl.dispose();
    headOfHouseholdTextCtrl.dispose();
    headOfHouseholdCCCDTextCtrl.dispose();
    addressTTTextCtrl.dispose();
  }
}
