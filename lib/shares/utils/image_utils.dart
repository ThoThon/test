import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_compress/image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_bhxh/modules/src.dart';

const _maxImageFileSizeInKB = 512;

class ImageUtils {
  const ImageUtils._();

  static Future<String?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    final path = result?.files.firstOrNull?.path;
    if (path == null) return null;

    // Compress the image
    final file = File(path);
    final imageBytes = await file.readAsBytes();

    // Việc nén ảnh có thể tạo ra ảnh có kích thước lớn hơn _maxImageFileSizeInKB,
    // vì BE sẽ nén lại ảnh lần nữa, mobile chỉ cần nén để giảm dung lượng nhằm giảm tải cho BE
    final compressedFilePath = await ImageCompress.compressAndSaveTempFile(
      imageBytes: imageBytes,
      maxSizeInKB: _maxImageFileSizeInKB,
    );

    return compressedFilePath;
  }

  static Future<String?> takePhoto() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) return null;
    final file = File(pickedFile.path);

    // Xoay lại ảnh nếu ở iOS
    if (GetPlatform.isIOS) {
      pickedFile =
          XFile((await FlutterExifRotation.rotateImage(path: file.path)).path);
    }

    final imageBytes = await file.readAsBytes();

    // Việc nén ảnh có thể tạo ra ảnh có kích thước lớn hơn _maxImageFileSizeInKB,
    // vì BE sẽ nén lại ảnh lần nữa, mobile chỉ cần nén để giảm dung lượng nhằm giảm tải cho BE
    final compressedFilePath = await ImageCompress.compressAndSaveTempFile(
      imageBytes: imageBytes,
      maxSizeInKB: _maxImageFileSizeInKB,
    );

    return compressedFilePath;
  }
}
