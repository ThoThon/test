part of 'declaration_list_page.dart';

extension DeclarationListWidget on DeclarationListPage {
  Widget _buildBody() {
    final saveResult = controller.argument.saveXmlResult;
    final declareHistoryRecord =
        controller.argument.declarationHistoryRecordList;
    final isFromHistoryPage = controller.argument.isFromHistoryPage;

    final hasDsM01hsb = isFromHistoryPage
        ? declareHistoryRecord?.hasDsM01hsb
        : saveResult?.hasDsM01hsb;

    final hasTsM01hsb = isFromHistoryPage
        ? declareHistoryRecord?.hasTsM01hsb
        : saveResult?.hasTsM01hsb;

    final hasOdM01hsb = isFromHistoryPage
        ? declareHistoryRecord?.hasOdM01hsb
        : saveResult?.hasOdM01hsb;

    final hasD02 =
        isFromHistoryPage ? declareHistoryRecord?.hasD02 : saveResult?.hasD02;

    final hasD01 =
        isFromHistoryPage ? declareHistoryRecord?.hasD01 : saveResult?.hasD01;

    final attachPreviewPath = isFromHistoryPage
        ? declareHistoryRecord?.attachPreviewPath
        : saveResult?.attachPreviewPath;

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
                  if (hasDsM01hsb ?? false)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_healingHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          id: declareHistoryRecord?.dsM01hsbId,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                          previewDocumentType:
                              PreviewDocumentTypeEnum.healingHsb,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (hasTsM01hsb ?? false)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_maternityHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          id: declareHistoryRecord?.tsM01hsbId,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                          previewDocumentType:
                              PreviewDocumentTypeEnum.maternityHsb,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (hasOdM01hsb ?? false)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_sickHsbList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          id: declareHistoryRecord?.odM01hsbId,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                          previewDocumentType: PreviewDocumentTypeEnum.sickHsb,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (hasD02 ?? false)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_d02LaborList.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          id: declareHistoryRecord?.d02Id,
                          title: LocaleKeys.declareInfo_laborList.tr,
                          previewDocumentType: PreviewDocumentTypeEnum.d02,
                          isRotateHorizontal: true,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  _buildTk1Preview(),
                  if (hasD01 ?? false)
                    _buildDeclarationItem(
                      title: LocaleKeys.declareInfo_d01infoTable.tr,
                      onTap: () {
                        controller.getPreviewPdf(
                          id: declareHistoryRecord?.d01Id,
                          title: LocaleKeys
                              .declareInfo_participationDeclaration.tr,
                          previewDocumentType: PreviewDocumentTypeEnum.d01,
                        );
                      },
                    ).paddingOnly(bottom: AppDimens.paddingSmall),
                  if (attachPreviewPath != null)
                    _buildDeclarationItem(
                      title: LocaleKeys.unitInfo_missingFileInclude.tr,
                      onTap: () {
                        Get.toNamed(
                          AppRoutesCl.viewPdf.path,
                          arguments: ViewPdfArgument(
                            url: saveResult?.attachPreviewPath ??
                                declareHistoryRecord?.attachPreviewPath ??
                                '',
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
    final paths = controller.argument.saveXmlResult?.tk1s;
    if (paths == null) {
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
                      controller.createPdf(
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
