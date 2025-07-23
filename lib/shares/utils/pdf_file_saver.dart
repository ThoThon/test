import 'dart:typed_data';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class PdfSaver {
  /// Trả về đường dẫn đầy đủ của file PDF đã lưu (lưu ý đây là đường dẫn ảo - không phải đường dẫn thực trên hệ thống)
  static Future<String?> savePdfFile(
    Uint8List bytes,
    String fileName,
  ) async {
    if (!await FlutterFileDialog.isPickDirectorySupported()) {
      logger.e("Picking directory not supported");
      return null;
    }

    final pickedDirectory = await FlutterFileDialog.pickDirectory();

    if (pickedDirectory != null) {
      final filePath = await FlutterFileDialog.saveFileToDirectory(
        directory: pickedDirectory,
        data: bytes,
        mimeType: "application/pdf",
        fileName: fileName,
        replace: true,
      );

      return filePath;
    }

    return null;
  }
}
