part of 'history_page.dart';

extension HistoryWidget on HistoryPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildSearchAndFilter(),
          Expanded(
            child: UtilWidget.buildCardBase(
              UtilWidget.buildSmartRefresher(
                refreshController: controller.refreshController,
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = controller.listHistory[index];
                    return _buildCardItemHistory(item);
                  },
                  itemCount: controller.listHistory.length,
                ),
              ),
            ).paddingOnly(top: AppDimens.defaultPadding),
          ),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.defaultPadding,
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primaryNavy),
              borderRadius: BorderRadius.circular(AppDimens.radius30),
            ),
            child: Row(
              children: [
                SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_SEARCH_SVG,
                  width: AppDimens.sizeIcon,
                  height: AppDimens.sizeIcon,
                ).paddingOnly(right: AppDimens.paddingVerySmall),
                SDSBuildText(
                  LocaleKeys.history_searchProfile.tr,
                  style: AppTextStyle.font14Re.copyWith(
                    color: AppColors.thumbColorSwitch,
                  ),
                )
              ],
            ).paddingAll(AppDimens.paddingSmall),
          ),
        ),
        IconButton(
          icon: SDSImageSvg(
            Assets.ASSETS_ICONS_IC_FILTER_SVG,
            width: AppDimens.sizeIcon32,
            height: AppDimens.sizeIcon32,
          ),
          onPressed: () {
            ///TODO: hoàn thành sau
            Get.bottomSheet(
              UtilWidget.baseBottomSheet(
                title: "Chọn thủ tục",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      'Tất cả',
                      style: AppTextStyle.font14Re
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    SDSBuildText(
                        '600c- tạm dừng đóng vào quỹ hưu trí - tử tuất theo luật bhxh 2014'),
                    SDSBuildText(
                        '600d- tạm dừng đóng vào quỹ hưu trí - tử tuất theo nghị định 68/NĐ-CP'),
                    SDSBuildText('600o - Tạm dừng đóng vào quỹ hưu trí'),
                  ],
                ),
              ),
            );
          },
        ).paddingOnly(left: AppDimens.paddingSmall),
      ],
    );
  }

  Widget _buildCardItemHistory(HistoryItemModel item) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.historyDetail.path,
          arguments: item,
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.assignment_outlined,
            color: AppColors.primaryColor,
            size: AppDimens.sizeIconMedium,
          ).paddingOnly(right: AppDimens.paddingVerySmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SDSBuildText(
                      "${LocaleKeys.history_procedure.tr} ${item.maThuTuc}",
                    ),
                    Expanded(
                      child: SDSBuildText(
                        "${LocaleKeys.history_number.tr}${item.soHoSo ?? ''}",
                        style: AppTextStyle.font14Bo,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                SDSBuildText(
                  "${LocaleKeys.history_submissionTime.tr}: ${changeDateString(item.thoiGianGui, pattern: PATTERN_9)}",
                  maxLines: 1,
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                Row(
                  children: [
                    SDSBuildText(
                      "${LocaleKeys.history_status.tr}: ",
                    ),
                    SDSBuildText(
                      item.trangThai.titleStatus,
                      style: AppTextStyle.font14Bo.copyWith(
                        color: item.trangThai.historyStatusColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SDSImageSvg(
            Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
            height: AppDimens.sizeIcon,
            width: AppDimens.sizeIcon,
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }
}
