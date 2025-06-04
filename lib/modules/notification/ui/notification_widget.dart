part of 'notification_page.dart';

extension NotificationWidget on NotificationPage {
  Widget _buildBody() {
    return Obx(
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
    );
  }

  Widget _buildListNotification() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      itemBuilder: (context, index) {
        final item = controller.listNotification[index];
        // Status = 1 : Noti chưa đọc
        final isUnReadNoti = item.status == 1;
        return InkWell(
          onTap: () {
            controller.readNoti(item);
          },
          child: Row(
            children: [
              _buildIconNotification(item),
              sdsSBWidth16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      item.name,
                      style: AppTextStyle.font14Bo.copyWith(
                        color: isUnReadNoti
                            ? AppColors.colorBlack
                            : AppColors.dsGray3,
                      ),
                    ),
                    SDSBuildText(
                      item.message,
                      style: AppTextStyle.font14Re.copyWith(
                        color: isUnReadNoti
                            ? AppColors.colorBlack
                            : AppColors.dsGray3,
                      ),
                      maxLines: 3,
                    ),
                    SDSBuildText(
                      controller.timeAgo(item.createDate),
                      style: AppTextStyle.font12Re.copyWith(
                        color: isUnReadNoti
                            ? AppColors.colorBlack
                            : AppColors.dsGray3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(vertical: AppDimens.paddingSmall),
        );
      },
      itemCount: controller.listNotification.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.dsGray5,
      ),
    );
  }

  Widget _buildIconNotification(NotificationItemModel item) {
    return Icon(
      item.entityType == EnityType.declaraForm
          ? Icons.description
          : Icons.autorenew,
      color: AppColors.primaryColor,
    );
  }
}
