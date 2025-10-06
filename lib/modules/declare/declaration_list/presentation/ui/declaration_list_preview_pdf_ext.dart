part of 'declaration_list_page.dart';

extension DeclarationListPreviewExt on DeclarationListPage {
  List<Widget> _buildBodyPreviewPdf() {
    final saveResult = controller.argument.saveXmlResult;

    return [
      _buildDeclarationItem(
        visible: saveResult?.hasDsM01hsb ?? false,
        title: LocaleKeys.declareInfo_healingHsbList.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.healingHsb,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: saveResult?.hasTsM01hsb ?? false,
        title: LocaleKeys.declareInfo_maternityHsbList.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.maternityHsb,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: saveResult?.hasOdM01hsb ?? false,
        title: LocaleKeys.declareInfo_sickHsbList.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.sickHsb,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: saveResult?.hasD02 ?? false,
        title: LocaleKeys.declareInfo_d02LaborList.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.d02,
            title: LocaleKeys.declareInfo_laborList.tr,
            isRotateHorizontal: true,
          );
        },
      ),
      _buildTk1Preview<Tk1PreviewPath>(
        listItemTk1s: controller.argument.saveXmlResult?.tk1s ?? [],
        getName: (item) => item.name,
        onTap: (item) => controller.getPreviewPdf(
          previewDocumentType: PreviewDocumentTypeEnum.tk1,
          title: LocaleKeys.declareInfo_tk1Declaration.tr,
          documentRecordId: item.documentRecordId,
        ),
      ),
      _buildDeclarationItem(
        visible: saveResult?.hasD01 ?? false,
        title: LocaleKeys.declareInfo_d01infoTable.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.d01,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: saveResult?.attachPreviewPath != null,
        title: LocaleKeys.unitInfo_missingFileInclude.tr,
        onTap: () {
          Get.toNamed(
            AppRoutesCl.viewPdf.path,
            arguments: ViewPdfArgument(
              url: saveResult?.attachPreviewPath ?? '',
              title: LocaleKeys.unitInfo_missingFileInclude.tr,
            ),
          );
        },
      ),
    ];
  }
}
