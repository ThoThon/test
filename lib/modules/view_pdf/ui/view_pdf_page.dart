import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/modules/view_pdf/controller/view_pdf_controller.dart';

class ViewPdfPage extends BaseGetWidget<ViewPdfController> {
  ViewPdfPage({super.key});

  @override
  ViewPdfController get controller => _controller;

  late final _controller = Get.put(ViewPdfController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(title: controller.argument.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SfPdfViewerTheme(
              data: const SfPdfViewerThemeData(
                backgroundColor: Colors.transparent,
              ),
              child: Expanded(
                child: RotatedBox(
                  quarterTurns:
                      controller.argument.isRotateHorizontal ?? false ? 1 : 0,
                  child: SfPdfViewer.network(
                    controller.argument.url,
                    controller: controller.pdfViewerController,
                    pageLayoutMode: PdfPageLayoutMode.continuous,
                    canShowScrollHead: false,
                    scrollDirection: PdfScrollDirection.vertical,
                    onDocumentLoaded: controller.onDocumentLoaded,
                    onPageChanged: controller.onPageChanged,
                  ),
                ),
              ),
            ),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: UtilWidget.buildSolidButtonBack(
            title: 'Tải về',
            onPressed: () {},
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            title: 'Đóng',
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
