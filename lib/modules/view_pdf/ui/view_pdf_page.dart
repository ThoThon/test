import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/modules/view_pdf/controller/view_pdf_controller.dart';

class ViewPdfPage extends BaseGetWidget<ViewPdfController> {
  ViewPdfPage({super.key});

  @override
  ViewPdfController get controller => _controller;

  late final _controller = Get.put(ViewPdfController());

  @override
  Widget buildWidgets(BuildContext context) {
    final accessToken = sl<AppHive>().get<String>(HiveKeys.keyJwtToken);
    return Scaffold(
      appBar: BaseAppBar(
        leading: UtilWidget.buildButtonBackAppbar(),
        centerTitle: true,
        title: BaseAppBarTitle(title: controller.argument.title),
      ),
      body: buildLoadingOverlay(() {
        return SafeArea(
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
                      headers: {
                        if (accessToken != null)
                          'Authorization': 'Bearer $accessToken',
                      },
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
        );
      }),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Visibility(
          visible: controller.argument.enableDownloadButton ?? true,
          child: Expanded(
            child: UtilWidget.buildSolidButton(
              borderRadius: AppDimens.radius30,
              side: const BorderSide(width: 1, color: AppColors.primaryColor),
              backgroundColor: AppColors.basicWhite,
              textStyle:
                  AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
              title: LocaleKeys.viewPdf_download.tr,
              onPressed: controller.savePDF,
            ),
          ),
        ),
        UtilWidget.sizedBoxWidth16,
        Expanded(
          child: UtilWidget.buildSolidButton(
            borderRadius: AppDimens.radius30,
            title: LocaleKeys.viewPdf_share.tr,
            textStyle:
                AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
            onPressed: controller.sharePDF,
          ),
        ),
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }
}
