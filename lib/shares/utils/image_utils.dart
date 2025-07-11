import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_compress/image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:v_bhxh/modules/src.dart';

class ImageUtils {
  const ImageUtils._();

  static Future<String?> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      );
      if (result == null) return null;
      return result.files.firstOrNull?.path;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> takePhoto() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        // maxWidth: 1080,
        // maxHeight: 1920,
        // imageQuality: 80,
      );
      if (pickedFile == null) return null;
      File file = File(pickedFile.path);
      if (GetPlatform.isIOS) {
        pickedFile = XFile(
            (await FlutterExifRotation.rotateImage(path: file.path)).path);
      }
      final imageBytes = await file.readAsBytes();

      final compressedBytes = await ImageCompress.compressImage(
        imageBytes: imageBytes,
        maxSizeInKB: 500,
      );
      if (compressedBytes == null) return null;
      final dir = await getTemporaryDirectory();
      final compressedFile =
          File('${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await compressedFile.writeAsBytes(compressedBytes);

      return compressedFile.path;
    } catch (_) {
      return null;
    }
  }
}
