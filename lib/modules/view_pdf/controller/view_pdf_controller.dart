import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';

class ViewPdfController extends BaseGetxController {
  final ViewPdfArgument argument = Get.arguments;

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

  @override
  void onClose() {
    pdfViewerController.dispose();
    super.onClose();
  }
}
