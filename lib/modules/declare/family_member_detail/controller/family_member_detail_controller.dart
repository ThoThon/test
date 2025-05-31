import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../../../base_app/base_app.src.dart';
import '../model/model_src.dart';

class FamilyMemberDetailController extends BaseGetxController {
  final argument = Get.arguments as FamilyMember?;

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
  final gender = Gender.male.obs;

  /// Dân tộc *
  final selectedEthnic = Rxn<EthnicModel>();

  /// Quốc tịch *
  final selectedNationality = Rxn<NationModel>();

  /// Tỉnh khai sinh *
  final selectedProvince = Rxn<ProvinceModel>();

  /// Huyện khai sinh *
  final selectedDistrict = Rxn<DistrictModel>();

  /// Xã khai sinh *
  final selectedWard = Rxn<WardModel>();

  /// Mối quan hệ với chủ hộ
  final relationship = Rxn<RelationshipModel>();

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
    final dob = dateOfBirthCtrl.text;
    if (dob.isEmpty) {
      showSnackBar("Ngày sinh không được để trống");
      return;
    }

    if (formKey.currentState?.validate() ?? false) {
      // Note: đã validate các trường required nên có thể force null
      Get.back(
        result: FamilyMember(
          // Khi sửa thành viên ở local hoặc DB thì sẽ giữ id cũ
          id: argument?.id ?? generateUuid(),
          fullName: fullNameTextCtrl.text.trim(),
          bhxhNumber: bhxhNumberTextCtrl.text.trim(),
          cccdNumber: cccdNumberTextCtrl.text.trim(),
          note: noteTextCtrl.text.trim(),
          birthType: birthType.value,
          dateOfBirth: convertStringToDateSafe(dob, birthType.value.pattern),
          gender: gender.value,
          ethnic: selectedEthnic.value!,
          nation: selectedNationality.value!,
          province: selectedProvince.value!,
          district: selectedDistrict.value!,
          ward: selectedWard.value!,
          relationship: relationship.value!,
          isParticipant: isParticipant.value,
          // Khi update thành viên ở DB thì sẽ truyền isUpdate = true
          // Cần keep trạng thái isUpdate để tránh tạo mới
          isUpdate: argument?.isUpdate ?? false,
        ),
      );
    }
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
