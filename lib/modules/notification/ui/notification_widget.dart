part of 'notification_page.dart';

extension NotificationWidget on NotificationPage {
  Widget _buildBody() {
    final enableButtonDelete = controller.selectedID.isNotEmpty;
    return Column(
      children: [
        Expanded(
          child: Obx(
            () {
              if (controller.listNotification.isEmpty) {
                return UtilWidget.buildEmptyOnRefresh(
                  refreshController: controller.refreshController,
                  onRefresh: controller.onRefresh,
                );
              }

              return UtilWidget.buildSmartRefresher(
                refreshController: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoadMore: controller.onLoadMore,
                enablePullUp: true,
                child: _buildListNotification(),
              );
            },
          ),
        ),
        if (controller.isShowCheckbox.value)
          Padding(
            padding: const EdgeInsets.all(AppDimens.defaultPadding),
            child: UtilWidget.buildSolidButton(
              backgroundColor: enableButtonDelete
                  ? AppColors.primaryColor
                  : const Color.fromARGB(255, 255, 154, 176),
              title: enableButtonDelete
                  ? '${LocaleKeys.notification_delete.tr} (${controller.selectedID.length})'
                  : LocaleKeys.notification_delete.tr,
              borderRadius: AppDimens.radius30,
              onPressed: () {
                if (enableButtonDelete) {
                  controller.deleteListNotification();
                } else {
                  return;
                }
              },
            ),
          ),
      ],
    );
  }

  Widget _buildListNotification() {
    final enableCheckobx = controller.isShowCheckbox.value;

    return ListView.separated(
      itemBuilder: (context, index) {
        final item = controller.listNotification[index];
        final isSelected = controller.selectedID.contains(item.id);
        return InkWell(
          onTap: () {
            if (enableCheckobx) {
              if (isSelected) {
                controller.selectedID.remove(item.id);
              } else {
                controller.selectedID.add(item.id);
              }
            }
          },
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (enableCheckobx)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingSmall,
                    ),
                    child: UtilWidget.buildCircleCheckbox(
                      isChecked: isSelected,
                      onTap: () {
                        if (isSelected) {
                          controller.selectedID.remove(item.id);
                        } else {
                          controller.selectedID.add(item.id);
                        }
                      },
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: enableCheckobx
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(
                            horizontal: AppDimens.defaultPadding,
                          ),
                    child: _buildCardItem(index),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: controller.listNotification.length,
      separatorBuilder: (context, index) => sdsSBHeight12,
    );
  }

  Widget _buildIconNotification(NotificationItemModel item) {
    return SDSImageSvg(
      item.entityType == EnityType.declaraForm
          ? Assets.ASSETS_ICONS_IC_NOTIFICATION_DECLARE_SVG
          : Assets.ASSETS_ICONS_IC_NOTIFICATION_UNIT_INFO_SVG,
      color: AppColors.primaryColor,
    );
  }

  void _buildBtsActionNoti() {
    Get.bottomSheet(
      UtilWidget.buildBottomSheetFigma(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.isShowCheckbox.toggle();
                controller.selectedID.clear();
                Get.back();
              },
              child: Row(
                children: [
                  SDSImageSvg(Assets.ASSETS_ICONS_IC_NOTIFICATION_DELETE_SVG),
                  sdsSBWidth12,
                  SDSBuildText(LocaleKeys.notification_deleteNotification.tr),
                ],
              ),
            ),
            sdsSBHeight16,
          ],
        ).paddingOnly(left: AppDimens.paddingVerySmall),
      ),
    );
  }

  Widget _buildCardItem(int index) {
    final item = controller.listNotification[index];
    return Obx(
      () {
        final enableCheckobx = controller.isShowCheckbox.value;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            border: Border.all(width: 1, color: AppColors.dsGray6),
            borderRadius: enableCheckobx
                ? const BorderRadius.horizontal(
                    left: Radius.circular(AppDimens.radius16),
                  )
                : BorderRadius.circular(AppDimens.radius16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconNotification(item),
              sdsSBWidth16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SDSBuildText(
                            item.name,
                            style: AppTextStyle.font14Bo.copyWith(
                              color: AppColors.colorBlack,
                            ),
                          ),
                        ),
                        SDSBuildText(
                          convertDateToStringSafe(item.createDate, PATTERN_6) ??
                              '',
                          style: AppTextStyle.font12Re
                              .copyWith(color: AppColors.dsGray1),
                        ),
                      ],
                    ),
                    sdsSBHeight8,
                    SDSBuildText(
                      item.message,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingOnly(
            top: AppDimens.paddingSmall,
            bottom: AppDimens.paddingSmall,
            left: AppDimens.defaultPadding,
            right: enableCheckobx
                ? AppDimens.paddingVerySmall
                : AppDimens.defaultPadding,
          ),
        );
      },
    );
  }
}
