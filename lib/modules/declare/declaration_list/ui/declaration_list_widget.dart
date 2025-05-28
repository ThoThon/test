part of 'declaration_list_page.dart';

extension DeclarationListWidget on DeclarationListPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: AppDimens.defaultPadding,
                right: AppDimens.defaultPadding,
                bottom: AppDimens.defaultPadding),
            child: Column(
              children: [
                _buildDeclarationItem(
                  title: 'Danh sách lao động tham gia BHXH',
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.viewPdf.path,
                      arguments: ViewPdfArgument(
                        url:
                            'https://testapi.easyhrm.vn/upload/a97398b7804942598df1e1fa1af518a6/Files/Contract/D02tk1-test.pdf',
                        title: 'Danh sách lao động',
                        isRotateHorizontall: true,
                      ),
                    );
                  },
                ),
                UtilWidget.sizedBox12,
                _buildDeclarationItem(
                  title:
                      'Tờ khai tham gia, điều chỉnh thông tin BHXH, BHYT (Mẫu TK1-TS)',
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.viewPdf.path,
                      arguments: ViewPdfArgument(
                        url:
                            'https://testapi.easyhrm.vn/upload/a97398b7804942598df1e1fa1af518a6/Files/Contract/TK01-test.pdf',
                        title: 'Tờ khai tham gia',
                      ),
                    );
                  },
                ),
                UtilWidget.sizedBox12,
                _buildDeclarationItem(
                  title: 'Bảng kê thông tin (Mẫu D01-TS)',
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.viewPdf.path,
                      arguments: ViewPdfArgument(
                        url:
                            'https://testapi.easyhrm.vn/upload/a97398b7804942598df1e1fa1af518a6/Files/Contract/D01ts-test.pdf',
                        title: 'Tờ khai tham gia',
                      ),
                    );
                  },
                ),
                UtilWidget.sizedBox12,
                _buildDeclarationItem(
                  title: 'File đính kèm',
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.viewPdf.path,
                      arguments: ViewPdfArgument(
                        url:
                            'https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf',
                        title: 'File đính kèm',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: UtilWidget.buildSolidButtonBack(
                height: AppDimens.btnLargeFigma,
                title: 'Quay lại',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            UtilWidget.sizedBoxWidth16,
            Expanded(
              child: UtilWidget.buildSolidButton(
                height: AppDimens.btnLargeFigma,
                title: 'Ký gửi',
                onPressed: controller.signDocument,
              ),
            ),
          ],
        ).paddingAll(AppDimens.defaultPadding),
      ],
    );
  }

  Widget _buildDeclarationItem({
    required String title,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.dsGray5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SDSBuildText(
              title,
              style: AppTextStyle.font16Semi,
              maxLines: 3,
            ),
          ),
          UtilWidget.sizedBoxWidth16,
          UtilWidget.buildSolidButtonBack(
            title: 'Xem',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
