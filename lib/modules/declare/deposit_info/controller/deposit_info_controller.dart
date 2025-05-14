import 'package:file_picker/file_picker.dart';
import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:collection/collection.dart';

class DepositInfoController extends BaseGetxController {
  final imagePath = Rxn<String>();

  final declaredStaffs = const <DeclaredStaffModel>[
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
    DeclaredStaffModel(name: 'Nguyễn Văn A', phoneNumber: '0123456789'),
  ].obs;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    final file = result?.files.firstOrNull;
    if (file != null) {
      imagePath.value = file.path;
    }
  }

  void removeImage() {
    imagePath.value = null;
  }
}
