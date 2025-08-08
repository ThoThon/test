import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/entity_src.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';
import 'package:v_bhxh/shares/utils/uuid_utils.dart';

class FamilyMemberDetailControllerCl extends BaseGetClController {
  final FamilyMemberEntity? argument;

  FamilyMemberDetailControllerCl({
    this.argument,
  });

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  final formKey = GlobalKey<FormState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhNumberTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdNumberTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  final birthType = BirthTypeEnum.defaultValue.obs;

  /// Ngày sinh
  final dateOfBirthCtrl = TextEditingController();

  /// Giới tính *
  final gender = Gender.female.obs;

  /// Dân tộc *
  /// Luôn khởi tạo Dân tộc là "Kinh"
  late final selectedEthnic = Rxn<Ethnic>(
    AppData.instance.ethnicsCl
        .firstWhereOrNull((ethnics) => ethnics.value == 1),
  );

  /// Quốc tịch *
  /// Luôn khởi tạo Quốc tịch là "VIỆT NAM"
  late final selectedNationality = Rxn<Nation>(AppData.instance.nationsCl
      .firstWhereOrNull((nations) => nations.value == "VN"));

  /// Tỉnh khai sinh *
  final selectedProvince = Rxn<Province>();

  /// Huyện khai sinh *
  final selectedDistrict = Rxn<District>();

  /// Xã khai sinh *
  final selectedWard = Rxn<Ward>();

  /// Mối quan hệ với chủ hộ
  final relationship = Rxn<Relationship>();

  /// Là người tham gia
  final isParticipant = false.obs;

  @override
  void onInit() {
    super.onInit();
    final member = argument;
    if (member != null) {
      fullNameTextCtrl.text = member.fullName;
      bhxhNumberTextCtrl.text = member.bhxhNumber;
      birthType.value = member.birthType;
      dateOfBirthCtrl.text = convertDateToStringSafe(
              member.dateOfBirth, birthType.value.pattern) ??
          '';
      gender.value = member.gender;
      selectedEthnic.value = member.ethnic;
      selectedNationality.value = member.nation;
      selectedProvince.value = member.province;
      selectedDistrict.value = member.district;
      selectedWard.value = member.ward;
      relationship.value = member.relationship;
      cccdNumberTextCtrl.text = member.cccdNumber;
      noteTextCtrl.text = member.note;
      isParticipant.value = member.isParticipant;
    }
  }

  void onSubmit() {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
      return;
    }

    // Note: đã validate các trường required nên có thể force null
    nav.back(
      result: FamilyMemberEntity(
        // Khi sửa thành viên ở local hoặc DB thì sẽ giữ id cũ
        id: argument?.id ?? generateUuid(),
        fullName: fullNameTextCtrl.text.trim(),
        bhxhNumber: bhxhNumberTextCtrl.text.trim(),
        cccdNumber: cccdNumberTextCtrl.text.trim(),
        note: noteTextCtrl.text.trim(),
        birthType: birthType.value,
        dateOfBirth:
            convertStringToDate(dateOfBirthCtrl.text, birthType.value.pattern),
        gender: gender.value,
        ethnic: selectedEthnic.value!,
        nation: selectedNationality.value!,
        province: selectedProvince.value!,
        district: selectedDistrict.value!,
        ward: selectedWard.value!,
        relationship: relationship.value!,
        isParticipant: isParticipant.value,
        giaDinhId: argument?.giaDinhId,
        // Khi update thành viên ở DB thì sẽ truyền isUpdate = true
        // Cần keep trạng thái isUpdate để tránh tạo mới
        isUpdate: argument?.isUpdate ?? false,
      ),
    );
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    dateOfBirthCtrl.dispose();
    bhxhNumberTextCtrl.dispose();
    cccdNumberTextCtrl.dispose();
    noteTextCtrl.dispose();
    super.onClose();
  }
}
