part of 'declaration_list_page.dart';

extension DeclarationListWidget on DeclarationListPage {
  Widget _buildBody() {
    final saveResult = controller.argument.saveXmlResult;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SDSBuildText(
                    LocaleKeys.declareInfo_listOfForm.tr,
                    style: AppTextStyle.font16Bo,
                  ),
                  sdsSBHeight12,
                  if (saveResult.hasDsM01hsb)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_healingHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          previewDocumentType:
                              PreviewDocumentTypeEnum.healingHsb,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (saveResult.hasTsM01hsb)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_maternityHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          previewDocumentType:
                              PreviewDocumentTypeEnum.maternityHsb,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (saveResult.hasOdM01hsb)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_sickHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          previewDocumentType: PreviewDocumentTypeEnum.sickHsb,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (saveResult.hasD02)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_d02LaborList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          previewDocumentType: PreviewDocumentTypeEnum.d02,
                          title: LocaleKeys.declareInfo_laborList.tr,
                          isRotateHorizontal: true,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  _buildTk1Preview(),
                  if (saveResult.hasD01)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_d01infoTable.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          previewDocumentType: PreviewDocumentTypeEnum.d01,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (saveResult.attachPreviewPath != null)
                    _buildDeclarationItem(
                      title: LocaleKeys.unitInfo_missingFileInclude.tr,
                      onTap: () {
                        Get.toNamed(
                          AppRoutesCl.viewPdf.path,
                          arguments: ViewPdfArgument(
                            url: saveResult.attachPreviewPath!,
                            title: LocaleKeys.unitInfo_missingFileInclude.tr,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
        UtilWidget.buildSolidButton(
          height: AppDimens.btnLargeFigma,
          borderRadius: AppDimens.radius30,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
          title: LocaleKeys.dialog_consignment.tr,
          onPressed: controller.signDocument,
        ).paddingOnly(
          top: AppDimens.defaultPadding,
          bottom: AppDimens.padding32,
          right: AppDimens.defaultPadding,
          left: AppDimens.defaultPadding,
        ),
      ],
    ).paddingOnly(top: AppDimens.defaultPadding);
  }

  Widget _buildTk1Preview() {
    final paths = controller.argument.saveXmlResult.tk1s;
    if (paths.isEmpty) {
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
        LocaleKeys.declareInfo_tk1Declaration.tr,
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
                      path.name,
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
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
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
