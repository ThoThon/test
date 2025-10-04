part of 'declaration_list_page.dart';

extension DeclarationListRecordPdfWidget on DeclarationListPage {
  Widget _buildBodyRecordPdf() {
    final recordPdfList = controller.argument.declarationHistoryRecordList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SDSBuildText(
                  LocaleKeys.declareInfo_listOfForm.tr,
                  style: AppTextStyle.font16Bo,
                ),
                sdsSBHeight12,
                if (recordPdfList?.hasDsM01hsb ?? false)
                  _buildDeclarationItem(
                    title: LocaleKeys.declareInfo_healingHsbList.tr,
                    onTap: () {
                      controller.getRecordPdf(
                        id: recordPdfList?.dsM01hsbId,
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (recordPdfList?.hasTsM01hsb ?? false)
                  _buildDeclarationItem(
                    title: LocaleKeys.declareInfo_maternityHsbList.tr,
                    onTap: () {
                      controller.getRecordPdf(
                        id: recordPdfList?.tsM01hsbId,
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (recordPdfList?.hasOdM01hsb ?? false)
                  _buildDeclarationItem(
                    title: LocaleKeys.declareInfo_sickHsbList.tr,
                    onTap: () {
                      controller.getRecordPdf(
                        id: recordPdfList?.odM01hsbId,
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (recordPdfList?.hasD02 ?? false)
                  _buildDeclarationItem(
                    title: LocaleKeys.declareInfo_d02LaborList.tr,
                    onTap: () {
                      controller.getRecordPdf(
                        id: recordPdfList?.d02Id,
                        title: LocaleKeys.declareInfo_laborList.tr,
                        isRotateHorizontal: true,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                _buildTk1Preview(id: recordPdfList?.tk1Id),
                if (recordPdfList?.hasD01 ?? false)
                  _buildDeclarationItem(
                    title: LocaleKeys.declareInfo_d01infoTable.tr,
                    onTap: () {
                      controller.getPreviewPdf(
                        previewDocumentType: PreviewDocumentTypeEnum.d01,
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
                      );
                    },
                  ).paddingOnly(bottom: AppDimens.paddingSmall),
                if (recordPdfList?.attachPreviewPath != null)
                  _buildDeclarationItem(
                    title: LocaleKeys.unitInfo_missingFileInclude.tr,
                    onTap: () {
                      Get.toNamed(
                        AppRoutesCl.viewPdf.path,
                        arguments: ViewPdfArgument(
                          url: recordPdfList?.attachPreviewPath ?? '',
                          title: LocaleKeys.unitInfo_missingFileInclude.tr,
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
          title: LocaleKeys.dialog_consignment.tr,
          onPressed: controller.signDocument,
        ),
        sdsSBHeight16,
      ],
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget _buildTk1Preview({
    required String? id,
  }) {
    final staff =
        controller.argument.declarationHistoryRecordList?.staffs ?? [];
    if (staff.isEmpty) {
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
        children: staff
            .map(
              (staff) => Row(
                children: [
                  const SizedBox(
                    width: AppDimens.padding40,
                  ),
                  Expanded(
                    child: SDSBuildText(
                      staff.name,
                      style: AppTextStyle.font14Re,
                      maxLines: 1,
                    ),
                  ),
                  UtilWidget.sizedBoxWidth16,
                  InkWell(
                    onTap: () {
                      controller.getRecordPdf(
                        title:
                            LocaleKeys.declareInfo_participationDeclaration.tr,
                        id: id,
                        staffId: staff.staffId,
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
