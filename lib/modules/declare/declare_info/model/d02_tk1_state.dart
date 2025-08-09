import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/declare_info_detail_response.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';

import '../../../../base_app/model/app_data.dart';
import 'model_src.dart';

/// Các state dùng chung ở 2 form D02 vầ TK1
class D02Tk1State {
  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdTextCtrl = TextEditingController();

  /// Loại ngày sinh
  final birthType = BirthTypeEnum.defaultValue.obs;

  /// Ngày sinh
  final dateOfBirthTextCtrl = TextEditingController();

  /// Giới tính *
  final gender = Gender.female.obs;

  /// Dân tộc *
  /// Luôn khởi tạo Dân tộc là "Kinh"
  final selectedEthnic = Rxn<Ethnic>(
    AppData.instance.ethnics.firstWhereOrNull((ethnics) => ethnics.value == 1),
  );

  /// Quốc tịch *
  /// Luôn khởi tạo Quốc tịch là "VIỆT NAM"
  final selectedNationality = Rxn<Nation>(AppData.instance.nations
      .firstWhereOrNull((nations) => nations.value == "VN"));

  void mapFromD02Detail(DeclareInfoDetailResponse detail) {
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

    birthType.value = d02Lt.chiCoNamSinh;

    if (d02Lt.ngaySinh != null) {
      dateOfBirthTextCtrl.text =
          convertDateToStringSafe(d02Lt.ngaySinh, birthType.value.pattern) ??
              '';
    }

    if (d02Lt.gioiTinh != null) {
      gender.value = d02Lt.gioiTinh ?? Gender.female;
    }

    if (d02Lt.danToc != null) {
      selectedEthnic.value = d02Lt.danToc;
    }

    if (d02Lt.quocTich != null) {
      selectedNationality.value = d02Lt.quocTich;
    }
  }

  void mapFromStaffDetail(StaffDetailResponse staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    fullNameTextCtrl.text = staff.hoTen?.trim() ?? '';

    bhxhTextCtrl.text = staff.maSoBHXH?.trim() ?? '';

    cccdTextCtrl.text = staff.soCCCD?.trim() ?? '';

    birthType.value = staff.chiCoNamSinh ?? BirthTypeEnum.defaultValue;

    dateOfBirthTextCtrl.text =
        convertDateToStringSafe(staff.ngaySinh, birthType.value.pattern) ?? '';

    gender.value = staff.gioiTinh ?? Gender.female;

    selectedEthnic.value = staff.danToc;

    selectedNationality.value = staff.quocTich;
  }

  void dispose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    dateOfBirthTextCtrl.dispose();
  }
}
