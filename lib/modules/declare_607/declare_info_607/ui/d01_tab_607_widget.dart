part of 'declare_info_607_page.dart';

extension D01Tab607Widget on DeclareInfo607Page {
  Widget _buildD01TabBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UtilWidget.sizedBox16,
                SDSBuildText(
                  LocaleKeys.declareInfo_listTable.tr,
                  style: AppTextStyle.font16Bo,
                ),
                sdsSBHeight12,
                ...addSeparator(
                  children: controller.d01State.forms.map(
                    (form) {
                      return _buildD01Item(
                        form: form,
                      );
                    },
                  ),
                  spacer: sdsSBHeight16,
                ),
                sdsSBHeight16,
              ],
            ),
          ),
        ),
        UtilWidget.buildSolidButton(
          title: 'Thêm bảng kê',
          onPressed: controller.createNewDeclarationForm,
          side: const BorderSide(
            color: AppColors.colorBlack,
            width: 1,
          ),
          backgroundColor: AppColors.basicWhite,
          textStyle:
              AppTextStyle.font14Re.copyWith(color: AppColors.colorBlack),
          borderRadius: AppDimens.radius30,
        ),
      ],
    );
  }

  Widget _buildD01Item({
    required DeclarationForm form,
  }) {
    return Slidable(
      key: ValueKey(form.id),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (ctx) {
              controller.showDialogDeleteForm(form);
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            child: SDSBuildText(
              LocaleKeys.app_delete.tr,
              style: AppTextStyle.font20Bo.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: AppDimens.paddingSmall,
          bottom: AppDimens.defaultPadding,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SDSBuildText(
                      form.fullName,
                      style: AppTextStyle.font16Re,
                    ),
                  ),
                  PopupMenuButton<ActionD01FormEnum>(
                    surfaceTintColor: AppColors.basicWhite,
                    constraints: const BoxConstraints(),
                    color: AppColors.basicWhite,
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == ActionD01FormEnum.edit) {
                        // Gọi hàm sửa
                        controller.editDeclarationForm(form);
                      } else if (value == ActionD01FormEnum.delete) {
                        // Gọi hàm xóa
                        controller.showDialogDeleteForm(form);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: ActionD01FormEnum.edit,
                        child: Row(
                          children: [
                            SDSBuildText('Sửa'),
                            sdsSBWidth16,
                            Icon(
                              Icons.autorenew,
                              color: AppColors.dsGray3,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: ActionD01FormEnum.delete,
                        child: Row(
                          children: [
                            const SDSBuildText('Xóa'),
                            sdsSBWidth16,
                            SDSImageSvg(Assets.ASSETS_ICONS_IC_DELETE_SVG),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sdsSBHeight8,
            const Divider(
              height: 1,
              color: AppColors.dsGray5,
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_documentType.tr,
              content: form.documentType,
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_documentNumber.tr,
              content: form.documentNumber,
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_dateOfIssue.tr,
              content:
                  convertDateToStringSafe(form.dateOfIssue, PATTERN_1) ?? '',
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
                title: LocaleKeys.declarationFormDetail_effectiveDate.tr,
                content: convertDateToStringSafe(
                      form.effectiveDate,
                      PATTERN_1,
                    ) ??
                    ''),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_issuingAgency.tr,
              content: form.issuingAgency,
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_summary.tr,
              content: form.summary,
            ),
            sdsSBHeight12,
            _buildTitleAndContent(
              title: LocaleKeys.declarationFormDetail_summaryCannotEmpty.tr,
              content: form.contentToBeAssessed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndContent({
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: SDSBuildText(
              '$title:',
              style: AppTextStyle.font14Re.copyWith(color: AppColors.dsGray1),
            ),
          ),
          SDSBuildText(
            content,
            style: AppTextStyle.font14Re.copyWith(color: AppColors.dsGray1),
          ),
        ],
      ),
    );
  }
}
