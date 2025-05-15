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
            SizedBox(
              width: Get.width,
              height: Get.width * 297 / 210,
              child: SfPdfViewerTheme(
                data: const SfPdfViewerThemeData(
                  backgroundColor: Colors.transparent,
                ),
                child: SfPdfViewer.network(
                  controller.argument.url,
                  controller: controller.pdfViewerController,
                  pageLayoutMode: PdfPageLayoutMode.single,
                  canShowScrollHead: false,
                  scrollDirection: PdfScrollDirection.horizontal,
                  onDocumentLoaded: controller.onDocumentLoaded,
                  onPageChanged: controller.onPageChanged,
                ),
              ),
            ),
            // Next and Previous buttons
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: controller.currentPage.value > 1
                          ? () {
                              controller.pdfViewerController.previousPage();
                            }
                          : null,
                    ),
                    SDSBuildText(
                      'Trang ${controller.currentPage.value} / ${controller.totalPage.value}',
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: controller.currentPage.value <
                              controller.totalPage.value
                          ? () {
                              controller.pdfViewerController.nextPage();
                            }
                          : null,
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
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
    ).paddingOnly(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      top: AppDimens.defaultPadding,
    );
  }
}
