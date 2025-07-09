part of 'history_page.dart';

extension HistoryRegisterTab on HistoryPage {
  Widget _buildHistoryRegister() {
    return baseShowLoading(
      () {
        if (controller.listHistoryRegister.isEmpty) {
          return UtilWidget.buildEmptyOnRefresh(
            refreshController: controller.registerRefreshCtrl,
            onRefresh: controller.onRefreshRegister,
          );
        }
        return UtilWidget.buildSmartRefresher(
          refreshController: controller.registerRefreshCtrl,
          onRefresh: controller.onRefreshRegister,
          onLoadMore: controller.onLoadMoreRegister,
          enablePullUp: true,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = controller.listHistoryRegister[index];
              return _buildCardItemHistoryRegister(item);
            },
            itemCount: controller.listHistoryRegister.length,
            separatorBuilder: (context, index) => sdsSBHeight12,
          ),
        );
      },
    );
  }

  Widget _buildCardItemHistoryRegister(HistoryRegisterItemModel item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(
          AppDimens.radius16,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardStatusRegister(item),
          sdsSBHeight12,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          sdsSBHeight8,
          Row(
            children: [
              SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
              sdsSBWidth8,
              SDSBuildText(
                item.toKhai + LocaleKeys.history_number.tr,
                style: AppTextStyle.font14Bo,
              ),
              if (item.soHoSo?.isNotEmpty ?? false)
                Expanded(
                  child: SDSBuildText(
                    "${item.soHoSo ?? ''}",
                    style: AppTextStyle.font14Bo,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          sdsSBHeight8,
          Row(
            children: [
              Expanded(
                child: SDSBuildText(
                  changeDateString(item.thoiGianGui, pattern: PATTERN_14),
                  style:
                      AppTextStyle.font12Re.copyWith(color: AppColors.dsGray2),
                  maxLines: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.historyDetailRegister.path,
                    arguments: item,
                  )?.then(
                    (value) async {
                      controller.listHistoryRegister.clear();
                      await controller.getHistoryRegister();
                    },
                  );
                },
                child: Row(
                  children: [
                    SDSBuildText(
                      LocaleKeys.history_lookup.tr,
                      style: AppTextStyle.font14Re
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    sdsSBWidth4,
                    SDSImageSvg(
                      Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          sdsSBHeight8,
        ],
      ),
    );
  }

  Widget _buildCardStatusRegister(HistoryRegisterItemModel item) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingVerySmall,
        vertical: AppDimens.paddingSmallest,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius16),
        color: item.trangThaiTK.cardStatusColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: item.trangThaiTK.historyStatusColor,
              shape: BoxShape.circle,
            ),
          ),
          sdsSBWidth8,
          SDSBuildText(
            item.trangThaiTK.titleStatus,
            style: AppTextStyle.font12Re.copyWith(
              color: item.trangThaiTK.historyStatusColor,
            ),
          ),
        ],
      ),
    ).paddingOnly(top: AppDimens.paddingSmall, left: AppDimens.defaultPadding);
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
