import 'dart:typed_data';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:v_bhxh/shares/function/logger.dart';

class PdfSaver {
  static Future<bool> savePdfFile(Uint8List bytes, String fileName) async {
    try {
      if (!await FlutterFileDialog.isPickDirectorySupported()) {
        logger.e("Picking directory not supported");
        return false;
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

        if (filePath != null) {
          logger.i('File saved to: $filePath');
          return true;
        }
      }

      return false;
    } catch (e) {
      logger.d('Error saving PDF file: $e');
      return false;
    }
  }
}
