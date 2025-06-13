part of 'history_page.dart';

extension HistoryRegisterTab on HistoryPage {
  Widget _buildHistoryRegister() {
    return UtilWidget.buildCardBase(
      baseShowLoading(
        () {
          if (controller.listHistoryRegister.isEmpty) {
            return UtilWidget.buildEmptyOnRefresh(
              refreshController: controller.refreshController,
              onRefresh: controller.onRefresh,
            );
          }
          // return UtilWidget.buildSmartRefresher(
          //   refreshController: controller.refreshController,
          //   onRefresh: controller.onRefresh,
          //   onLoadMore: controller.onLoadMore,
          //   enablePullUp: true,
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       final item = controller.listHistoryDeclare[index];
          //       return _buildCardItemHistory(item);
          //     },
          //     itemCount: controller.listHistoryDeclare.length,
          //   ),
          // );
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = controller.listHistoryRegister[index];
              return _buildCardItemHistoryRegister(item);
            },
            itemCount: controller.listHistoryRegister.length,
          );
        },
      ),
    );
  }

  Widget _buildCardItemHistoryRegister(HistoryRegisterItemModel item) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.historyDetail.path,
          arguments: item,
        )?.then(
          (value) async {
            // controller.listHistoryDeclare.clear();
            // await controller.getListHistoryDeclare();
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
                      item.toKhai,
                    ),
                    Expanded(
                      child: SDSBuildText(
                        "${LocaleKeys.history_number.tr}${item.soHoSo}",
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
                      item.trangThaiTK.titleStatus,
                      style: AppTextStyle.font14Bo.copyWith(
                        color: item.trangThaiTK.historyStatusColor,
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

  Widget _buildItemBottomSheetFilter({
    required Function()? onTap,
    required String text,
    TextStyle? style,
  }) {
    return InkWell(
      onTap: onTap,
      child: SDSBuildText(
        text,
        style: style,
      ),
    ).paddingOnly(bottom: AppDimens.paddingVerySmall);
  }
}
