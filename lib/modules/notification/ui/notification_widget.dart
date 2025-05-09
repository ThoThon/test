part of 'notification_page.dart';

extension NotificationWidget on NotificationPage {
  Widget _buildBody() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          children: [
            _buildDataNotification(),
            Divider(
              height: 1,
              color: AppColors.dsGray5,
            ),
            _buildFakeDataUpdateInfo(false),
            Divider(
              height: 1,
              color: AppColors.dsGray5,
            ),
            _buildFakeDataUpdateInfo(true),
          ],
        );
      },
      itemCount: 10,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: AppColors.dsGray5,
      ),
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildDataNotification() {
    return Row(
      children: [
        Icon(
          Icons.description,
          color: AppColors.primaryColor,
        ),
        sdsSBWidth16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SDSBuildText(
                "Hồ sơ kê khai",
                style: AppTextStyle.font14Bo,
              ),
              SDSBuildText(
                "Gửi hồ sơ 600 vào lúc 15:14 22/04/2025 thành công",
                maxLines: 3,
              ),
              SDSBuildText(
                "1 giờ trước",
                style: AppTextStyle.font12Re,
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildFakeDataUpdateInfo(bool enable) {
    return Row(
      children: [
        Icon(
          Icons.autorenew,
          color: AppColors.primaryColor,
        ),
        sdsSBWidth16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SDSBuildText(
                "Thông tin đơn vị",
                style: AppTextStyle.font14Bo.copyWith(
                  color: enable ? AppColors.colorBlack : AppColors.dsGray3,
                ),
              ),
              SDSBuildText(
                "Thay đổi thông tin đơn vị vào lúc 15:14 22/04/2025 thành công",
                maxLines: 3,
                style: AppTextStyle.font14Re.copyWith(
                  color: enable ? AppColors.colorBlack : AppColors.dsGray3,
                ),
              ),
              SDSBuildText(
                "1 giờ trước",
                style: AppTextStyle.font12Re.copyWith(
                  color: enable ? AppColors.colorBlack : AppColors.dsGray3,
                ),
              ),
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }
}
