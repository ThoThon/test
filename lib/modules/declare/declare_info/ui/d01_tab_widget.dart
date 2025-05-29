part of 'declare_info_page.dart';

extension D01TabWidget on DeclareInfoPage {
  Widget _buildD01TabBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UtilWidget.sizedBox16,
          ...controller.d01State.forms.mapIndexed(
            (index, form) {
              return _buildD01Item(
                index: index,
                form: form,
              );
            },
          ),
          InkWell(
            onTap: controller.createNewDeclarationForm,
            child: Row(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    onPressed: controller.createNewDeclarationForm,
                  ),
                ),
                UtilWidget.sizedBoxWidth16,
                SDSBuildText(
                  'Thêm mới bảng kê',
                  style: AppTextStyle.font16Re,
                ),
              ],
            ).paddingSymmetric(
              vertical: AppDimens.paddingVerySmall,
              horizontal: AppDimens.defaultPadding,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildD01Item({
    required int index,
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
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : Colors.grey[100],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SDSBuildText(
                    "Bảng kê hồ sơ ${index + 1}",
                    style: AppTextStyle.font16Semi,
                  ),
                  SDSBuildText(
                    form.fullName,
                    style: AppTextStyle.font16Re,
                  ),
                ],
              ),
            ),
            UtilWidget.buildSolidButtonBack(
              title: 'Sửa',
              onPressed: () {
                controller.editDeclarationForm(form);
              },
            ),
          ],
        ),
      ),
    );
  }
}
