import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

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
      final file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        // maxHeight: 80,
        // maxWidth: 80,
        // imageQuality: 100,
      );
      return file?.path;
    } catch (_) {
      return null;
    }
  }
}
