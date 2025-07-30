part of 'declaration_list_page.dart';

extension DeclarationListWidget on DeclarationListPage {
  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  'Danh sách biểu mẫu',
                  style: AppTextStyle.font16Bo,
                ),
                sdsSBHeight12,
                if (controller.argument.saveXmlResult.hasOdM01hsb)
                  _buildDeclarationItem(
                    title:
                        'Danh sách đề nghị giải quyết hưởng chế độ ốm đau (Mẫu 01D-HSB)',
                    onTap: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.hsb,
                        title: 'Tờ khai tham gia',
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (controller.argument.saveXmlResult.hasD02)
                  _buildDeclarationItem(
                    title: 'Danh sách lao động tham gia BHXH - (Mẫu D02-LT)',
                    onTap: () {
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
                    onTap: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.d01,
                        title: 'Tờ khai tham gia',
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (controller.argument.saveXmlResult.attachPreviewPath != null)
                  _buildDeclarationItem(
                    title: 'File đính kèm',
                    onTap: () {
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
        UtilWidget.buildSolidButton(
          height: AppDimens.btnLargeFigma,
          borderRadius: AppDimens.radius30,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          title: 'Ký gửi',
          onPressed: controller.signDocument,
        ).paddingOnly(
          bottom: AppDimens.padding32,
          right: AppDimens.defaultPadding,
          left: AppDimens.defaultPadding,
        ),
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
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      tilePadding:
          const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      childrenPadding:
          const EdgeInsets.symmetric(vertical: AppDimens.paddingSmallest),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      iconColor: AppColors.dsGray2,
      collapsedIconColor: AppColors.dsGray2,
      title: SDSBuildText(
        'Tờ khai tham gia, điều chỉnh thông tin BHXH, BHYT (Mẫu TK1-TS)',
        style: AppTextStyle.font14Bo,
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
                      style: AppTextStyle.font14Re,
                      maxLines: 1,
                    ),
                  ),
                  UtilWidget.sizedBoxWidth16,
                  InkWell(
                    onTap: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.tk1,
                        documentRecordId: path.documentRecordId,
                        title: 'Tờ khai tham gia',
                      );
                    },
                    child: SDSImageSvg(Assets.ASSETS_ICONS_IC_EYE_SVG),
                  ),
                  UtilWidget.sizedBoxWidth16,
                ],
              ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
            )
            .toList(),
        spacer: UtilWidget.buildDividerDefault()
            .paddingSymmetric(horizontal: AppDimens.paddingSmallest),
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  Widget _buildDeclarationItem({
    required String title,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Row(
        children: [
          Expanded(
            child: SDSBuildText(
              title,
              style: AppTextStyle.font14Bo,
              maxLines: 3,
            ),
          ),
          UtilWidget.sizedBoxWidth16,
          InkWell(
            onTap: onTap,
            child: SDSImageSvg(Assets.ASSETS_ICONS_IC_EYE_SVG),
          )
        ],
      ),
    );
  }
}
