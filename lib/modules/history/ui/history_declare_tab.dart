part of 'history_page.dart';

extension HistoryDeclareTab on HistoryPage {
  Widget _buildHistoryDeclare() {
    return UtilWidget.buildCardBase(
      baseShowLoading(
        () {
          if (controller.listHistoryDeclare.isEmpty) {
            return UtilWidget.buildEmptyOnRefresh(
              refreshController: controller.declareRefreshCtrl,
              onRefresh: controller.onRefreshDeclare,
            );
          }
          return UtilWidget.buildSmartRefresher(
            refreshController: controller.declareRefreshCtrl,
            onRefresh: controller.onRefreshDeclare,
            onLoadMore: controller.onLoadMoreDeclare,
            enablePullUp: true,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = controller.listHistoryDeclare[index];
                return _buildCardItemHistoryDeclare(item);
              },
              itemCount: controller.listHistoryDeclare.length,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardItemHistoryDeclare(HistoryDeclareItemModel item) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.historyDetailDeclare.path,
          arguments: item,
        )?.then(
          (value) async {
            controller.listHistoryDeclare.clear();
            await controller.getHistoryDeclare();
          },
        );
      },
      child: Row(
        children: [
          const Icon(
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
