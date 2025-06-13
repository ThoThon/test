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
                if (controller.argument.saveXmlResult.hasD02)
                  _buildDeclarationItem(
                    title: 'Danh sách lao động tham gia BHXH - (Mẫu D02-LT)',
                    onPressed: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.d02,
                        title: 'Danh sách lao động',
                        isRotateHorizontal: true,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                _buildTk1Preview(),
                if (controller.argument.saveXmlResult.hasD01)
                  _buildDeclarationItem(
                    title: 'Bảng kê thông tin (Mẫu D01-TS)',
                    onPressed: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.d01,
                        title: 'Tờ khai tham gia',
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (controller.argument.saveXmlResult.attachPreviewPath != null)
                  _buildDeclarationItem(
                    title: 'File đính kèm',
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.viewPdf.path,
                        arguments: ViewPdfArgument(
                          url: controller
                              .argument.saveXmlResult.attachPreviewPath!,
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

  Widget _buildTk1Preview() {
    final paths = controller.argument.saveXmlResult.tk1s;
    if (paths == null || paths.isEmpty) {
      return UtilWidget.shrink;
    }

    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.dsGray5),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.dsGray5),
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      iconColor: AppColors.primaryColor,
      collapsedIconColor: AppColors.primaryColor,
      title: SDSBuildText(
        'Tờ khai tham gia, điều chỉnh thông tin BHXH, BHYT (Mẫu TK1-TS)',
        style: AppTextStyle.font16Semi,
        maxLines: 3,
      ),
      children: addSeparator(
        children: paths
            .map(
              (path) => Row(
                children: [
                  const SizedBox(
                    width: AppDimens.padding40,
                  ),
                  Expanded(
                    child: SDSBuildText(
                      path.hoTen ?? '',
                      style: AppTextStyle.font14Semi,
                      maxLines: 1,
                    ),
                  ),
                  UtilWidget.sizedBoxWidth16,
                  TextButton(
                    onPressed: () {
                      // final previewPath = path.previewPath;
                      // if (previewPath != null) {
                      //   Get.toNamed(
                      //     AppRoutes.viewPdf.path,
                      //     arguments: ViewPdfArgument(
                      //       url: previewPath,
                      //       title: 'Tờ khai tham gia',
                      //     ),
                      //   );
                      // }
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.tk1,
                        documentRecordId: path.documentRecordId,
                        title: 'Tờ khai tham gia',
                      );
                    },
                    child: SDSBuildText(
                      'Xem',
                      style: AppTextStyle.font16Re.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  UtilWidget.sizedBoxWidth16,
                ],
              ),
            )
            .toList(),
        spacer: UtilWidget.buildDividerDefault()
            .paddingOnly(left: AppDimens.padding40),
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
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
