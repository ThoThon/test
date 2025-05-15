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
                      arguments: const ViewPdfArgument(
                        url:
                            'https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf',
                        title: 'Danh sách lao động',
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
                      arguments: const ViewPdfArgument(
                        url:
                            'https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf',
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
                      arguments: const ViewPdfArgument(
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
        UtilWidget.buildSolidButton(
          height: AppDimens.btnLargeFigma,
          title: 'Ký gửi',
          onPressed: () {
            controller.showDialogCheckedSuccess();
          },
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
