import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

class DepositInfoController extends BaseGetxController {
  final imagePath = Rxn<String>();

  final declaredStaffs = const <DeclaredStaffModel>[
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
  ].obs;

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      imagePath.value = path;
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      imagePath.value = path;
    }
  }

  void removeImage() {
    imagePath.value = null;
  }
}
