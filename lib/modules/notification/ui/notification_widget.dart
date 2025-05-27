part of 'notification_page.dart';

extension NotificationWidget on NotificationPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: UtilWidget.buildCardBase(
            baseShowLoading(
              () => UtilWidget.buildSmartRefresher(
                refreshController: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoadMore: controller.onLoadMore,
                enablePullUp: true,
                child: controller.listNotification.isEmpty
                    ? UtilWidget.buildEmptyList()
                    : _buildListNotification(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListNotification() {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = controller.listNotification[index];
        // Status = 1 : Noti chưa đọc
        final isUnReadNoti = item.status == 1;
        return InkWell(
          onTap: () {
            // Khi onTap thì đổi status = 2 ở local rồi mới đến call API
            item.status = 2;
            controller.listNotification.refresh();
            controller.readNotification(item.id);
          },
          child: Row(
            children: [
              _buildIconNotifcation(item),
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
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildIconNotifcation(NotificationItemModel item) {
    return Icon(
      item.entityType == EnityType.declaraForm
          ? Icons.description
          : Icons.autorenew,
      color: AppColors.primaryColor,
    );
  }
}
