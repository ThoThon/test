import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sds_share_pdf/sds_share_pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';
import 'package:v_bhxh/modules/view_pdf/repository/view_pdf_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/utils/uuid_utils.dart';

class ViewPdfController extends BaseGetxController {
  final ViewPdfArgument argument = Get.arguments;

  late final _viewPdfRepository = ViewPdfRepository(this);

  final pdfViewerController = PdfViewerController();

  final totalPage = 0.obs;
  final currentPage = 0.obs;

  void onDocumentLoaded(
    PdfDocumentLoadedDetails details,
  ) {
    totalPage.value = details.document.pages.count;
    currentPage.value = pdfViewerController.pageNumber;
    details.document.pageSettings.height;
  }

  void onPageChanged(
    PdfPageChangedDetails details,
  ) {
    currentPage.value = details.newPageNumber;
  }

  Future<Uint8List?> downloadPdf() async {
    try {
      final bytes = await _viewPdfRepository.downloadPdf(argument.url);
      return bytes;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<String> saveFileToTemporary(Uint8List bytes) async {
    final uri = Uri.parse(argument.url);
    final fileName = uri.path.split('/').lastOrNull ?? '${generateUuid()}.pdf';
    final tempPath = (await getTemporaryDirectory()).path;
    final file = File('$tempPath${Platform.pathSeparator}$fileName');
    await file.writeAsBytes(bytes);
    return file.path;
  }

  Future<String?> downloadAndSavePdf() async {
    try {
      showLoadingOverlay();
      final bytes = await downloadPdf();
      if (bytes == null) {
        return null;
      }
      final path = await saveFileToTemporary(bytes);
      return path;
    } catch (e) {
      logger.e(e);
      return null;
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> sharePDF() async {
    final savedFilePath = await downloadAndSavePdf();

    if (savedFilePath == null) {
      showSnackBar(LocaleKeys.viewPdf_cannotDownloadFile.tr);
      return;
    }

    if (GetPlatform.isAndroid) {
      await SdsSharePdf.sharePdf(savedFilePath);
    } else {
      final file = XFile(savedFilePath);
      await SharePlus.instance.share(
        ShareParams(files: [file]),
      );
    }
  }

  @override
  void onClose() {
    pdfViewerController.dispose();
    super.onClose();
  }
}
