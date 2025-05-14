import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

class FamilyMemberDetailController extends BaseGetxController {
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

  /// Tỉnh khai sinh *
  final selectedProvince = Rxn<String>();

  /// Huyện khai sinh *
  final selectedDistrict = Rxn<String>();

  /// Xã khai sinh *
  final selectedWard = Rxn<String>();

  /// Mối quan hệ với chủ hộ
  final selectedRelationship = Rxn<String>();

  /// Là người tham gia
  final isParticipant = false.obs;

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    super.onClose();
  }
}
