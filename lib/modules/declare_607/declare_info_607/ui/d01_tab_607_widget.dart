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
                Obx(
                  () {
                    if (controller.d01State.forms.isEmpty) {
                      return SizedBox(
                        height: 300,
                        child: Align(
                          alignment: Alignment.center,
                          child: UtilWidget.buildEmptyList(),
                        ),
                      );
                    }
                    return Column(
                      children: [
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
                      ],
                    );
                  },
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

  Widget _buildD01Item({required DeclarationForm form}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius16),
      ),
      child: Row(
        children: [
          SDSImageSvg(Assets.ASSETS_ICONS_IC_PERSONAL_SVG),
          sdsSBWidth8,
          Expanded(
            child: SDSBuildText(
              form.bhxhNumber.isNotEmpty
                  ? '${form.fullName} - ${form.bhxhNumber}'
                  : form.fullName,
              maxLines: 5,
              style: AppTextStyle.font16Bo,
            ),
          ),
          _buildMenuPopupOnption(form),
        ],
      ).paddingSymmetric(
        vertical: AppDimens.paddingSmall,
        horizontal: AppDimens.defaultPadding,
      ),
    ).paddingOnly(bottom: AppDimens.paddingSmall);
  }

  Widget _buildMenuPopupOnption(DeclarationForm form) {
    return PopupMenuButton<ActionD01FormEnum>(
      surfaceTintColor: AppColors.basicWhite,
      constraints: const BoxConstraints(),
      color: AppColors.basicWhite,
      icon: const Icon(Icons.more_horiz),
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
    );
  }
}
