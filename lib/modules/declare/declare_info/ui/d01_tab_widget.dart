part of 'declare_info_page.dart';

extension D01TabWidget on DeclareInfoPage {
  Widget _buildD01TabBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sdsSBHeight12,
        SDSBuildText(
          LocaleKeys.declareInfo_listOfTables.tr,
          style: AppTextStyle.font16Bo,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                sdsSBHeight12,
                ...controller.d01State.forms.mapIndexed(
                  (index, form) {
                    return _buildD01Item(
                      form: form,
                    );
                  },
                ),
                // InkWell(
                //   onTap: controller.createNewDeclarationForm,
                //   child: Row(
                //     children: [
                //       Ink(
                //         decoration: const ShapeDecoration(
                //           color: AppColors.primaryColor,
                //           shape: CircleBorder(),
                //         ),
                //         child: IconButton(
                //           icon: const Icon(Icons.add),
                //           color: Colors.white,
                //           onPressed: controller.createNewDeclarationForm,
                //         ),
                //       ),
                //       UtilWidget.sizedBoxWidth16,
                //       SDSBuildText(
                //         'Thêm mới bảng kê',
                //         style: AppTextStyle.font16Re,
                //       ),
                //     ],
                //   ).paddingSymmetric(
                //     vertical: AppDimens.paddingVerySmall,
                //     horizontal: AppDimens.defaultPadding,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        UtilWidget.buildSolidButton(
          title: LocaleKeys.declareInfo_addTable.tr,
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
              maxLines: 3,
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
      onSelected: (action) {
        if (action == ActionD01FormEnum.edit) {
          // Gọi hàm sửa
          controller.editDeclarationForm(form);
        } else if (action == ActionD01FormEnum.delete) {
          // Gọi hàm xóa
          controller.showDialogDeleteForm(form);
        }
      },
      itemBuilder: (ctx) {
        return ActionD01FormEnum.values.map(
          (action) {
            return PopupMenuItem<ActionD01FormEnum>(
              value: action,
              child: Row(
                children: [
                  SDSBuildText(action.title),
                  sdsSBWidth16,
                  Icon(
                    action.icon,
                    color: AppColors.dsGray3,
                  ),
                ],
              ),
            );
          },
        ).toList();
      },
    );
  }
}
