part of 'declaration_list_page.dart';

extension DeclarationListRecordPdfExt on DeclarationListPage {
  List<Widget> _buildBodyRecordPdf() {
    final recordPdfList = controller.argument.declarationHistoryRecordList;

    return [
      _buildDeclarationItem(
        visible: recordPdfList?.hasDsM01hsb ?? false,
        title: LocaleKeys.declareInfo_healingHsbList.tr,
        onTap: () {
          controller.getRecordPdf(
            id: recordPdfList?.dsM01hsbId,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: recordPdfList?.hasTsM01hsb ?? false,
        title: LocaleKeys.declareInfo_maternityHsbList.tr,
        onTap: () {
          controller.getRecordPdf(
            id: recordPdfList?.tsM01hsbId,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: recordPdfList?.hasOdM01hsb ?? false,
        title: LocaleKeys.declareInfo_sickHsbList.tr,
        onTap: () {
          controller.getRecordPdf(
            id: recordPdfList?.odM01hsbId,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: recordPdfList?.hasD02 ?? false,
        title: LocaleKeys.declareInfo_d02LaborList.tr,
        onTap: () {
          controller.getRecordPdf(
            id: recordPdfList?.d02Id,
            title: LocaleKeys.declareInfo_laborList.tr,
            isRotateHorizontal: true,
          );
        },
      ),
      _buildTk1Preview<StaffInfo>(
        listItemTk1s:
            controller.argument.declarationHistoryRecordList?.staffs ?? [],
        getName: (item) => item.name,
        onTap: (item) => controller.getRecordPdf(
          title: LocaleKeys.declareInfo_tk1Declaration.tr,
          id: controller.argument.declarationHistoryRecordList?.tk1Id,
          staffId: item.staffId,
        ),
      ),
      _buildDeclarationItem(
        visible: recordPdfList?.hasD01 ?? false,
        title: LocaleKeys.declareInfo_d01infoTable.tr,
        onTap: () {
          controller.getPreviewPdf(
            previewDocumentType: PreviewDocumentTypeEnum.d01,
            title: LocaleKeys.declareInfo_participationDeclaration.tr,
          );
        },
      ),
      _buildDeclarationItem(
        visible: recordPdfList?.attachPreviewPath != null,
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
    ];
  }
}
