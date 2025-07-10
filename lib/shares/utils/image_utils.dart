import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_bhxh/modules/src.dart';

class ImageUtils {
  const ImageUtils._();

  static Future<String?> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      );
      return result?.files.firstOrNull?.path;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> takePhoto() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1080,
        maxWidth: 1920,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        if (GetPlatform.isIOS) {
          pickedFile = XFile(
              (await FlutterExifRotation.rotateImage(path: file.path)).path);
        }
      }
      return pickedFile?.path;
    } catch (_) {
      return null;
    }
  }
}
