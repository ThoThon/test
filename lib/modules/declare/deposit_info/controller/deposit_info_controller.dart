import 'dart:io';

import 'package:path/path.dart';
import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../base_app/base_app.src.dart';

class DepositInfoController extends BaseGetxController {
  final imagePath = Rxn<String>();

  final listImage = <String>[].obs;

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
      listImage.add(path);
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      imagePath.value = path;
      listImage.add(path);
    }
  }

  String getImageSize(File imageFile) {
    final int sizeInBytes = imageFile.lengthSync();
    final double sizeInKB = sizeInBytes / 1024;
    if (sizeInKB < 1024) {
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else {
      final double sizeInMB = sizeInKB / 1024;
      return '${sizeInMB.toStringAsFixed(2)} MB';
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void removeImage(int index) {
    listImage.removeAt(index);
  }

  void maximumUploadFile() {
    showSnackBar('Chỉ cho phép chọn tối đa 5 file');
  }
}
