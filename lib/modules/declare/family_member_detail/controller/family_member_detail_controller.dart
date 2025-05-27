import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../base_app/base_app.src.dart';
import '../model/model_src.dart';

class FamilyMemberDetailController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdTextCtrl = TextEditingController();

  /// Ghi chú
  final noteTextCtrl = TextEditingController();

  final birthType = BirthTypeEnum.full.obs;

  /// Ngày sinh
  final dateOfBirth = Rxn<DateTime>();

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

  void onSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      // TODO:
    }
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    noteTextCtrl.dispose();
    super.onClose();
  }
}
