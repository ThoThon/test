import 'package:file_picker/file_picker.dart';
import 'package:v_bhxh/modules/declare/declaration_period/model/declaration_period_model.dart';
import 'package:v_bhxh/modules/declare/declaration_period_detail/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:collection/collection.dart';

class DeclarationPeriodDetailController extends BaseGetxController {
  final declarationPeriod = Get.arguments as DeclarationPeriodModel;

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
