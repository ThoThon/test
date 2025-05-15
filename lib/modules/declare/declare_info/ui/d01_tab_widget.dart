part of 'declare_info_page.dart';

extension D01TabWidget on DeclareInfoPage {
  Widget _buildD01TabBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...controller.d01State.checkLists.mapIndexed(
            (index, checkList) {
              return _buildD01Item(
                index: index,
                checkList: checkList,
              );
            },
          ),
          InkWell(
            onTap: controller.createNewCheckList,
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
                    onPressed: controller.createNewCheckList,
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
    required DocumentCheckList checkList,
  }) {
    return Slidable(
      key: ValueKey(checkList.id),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (ctx) {
              controller.showDialogDeleteCheckList(checkList);
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
                    checkList.title,
                    style: AppTextStyle.font16Semi,
                  ),
                  SDSBuildText(
                    checkList.user,
                    style: AppTextStyle.font16Re,
                  ),
                ],
              ),
            ),
            UtilWidget.buildSolidButtonBack(
              title: 'Sửa',
              onPressed: () {
                Get.toNamed(
                  AppRoutes.checkListDetail.path,
                  arguments: CheckListDetailArgument(
                    checkList: checkList,
                    action: CheckListDetailAction.edit,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
