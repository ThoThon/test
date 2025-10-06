part of 'declaration_list_page.dart';

extension DeclarationListPrpdfWidget on DeclarationListPage {
  Widget _buildBody() {
    final isFromHistoryPage = controller.argument.isFromHistoryPage;
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
                ...(isFromHistoryPage
                    ? _buildBodyRecordPdf()
                    : _buildBodyPreviewPdf()),
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

  Widget _buildTk1Preview<T>({
    required List<T> listItemTk1s,
    required String Function(T item) getName,
    required void Function(T item) onTap,
  }) {
    if (listItemTk1s.isEmpty) return UtilWidget.shrink;

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
        children: listItemTk1s
            .map(
              (item) => Row(
                children: [
                  const SizedBox(
                    width: AppDimens.padding40,
                  ),
                  Expanded(
                    child: SDSBuildText(
                      getName(item),
                      style: AppTextStyle.font14Re,
                      maxLines: 1,
                    ),
                  ),
                  UtilWidget.sizedBoxWidth16,
                  InkWell(
                    onTap: () => onTap(item),
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
    required bool visible,
    VoidCallback? onTap,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
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
      ).paddingOnly(bottom: AppDimens.paddingSmall),
    );
  }
}
