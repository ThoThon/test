part of 'history_page.dart';

extension HistoryDeclareTab on HistoryPage {
  Widget _buildHistoryDeclare() {
    return baseShowLoading(
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
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = controller.listHistoryDeclare[index];
              return _buildCardItemHistoryDeclare(item);
            },
            itemCount: controller.listHistoryDeclare.length,
            separatorBuilder: (context, index) => sdsSBHeight12,
          ),
        );
      },
    );
  }

  Widget _buildCardItemHistoryDeclare(HistoryDeclareItemModel item) {
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
          _buildCardStatus(item),
          sdsSBHeight12,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          sdsSBHeight8,
          _buildTitleProcedure(item),
          sdsSBHeight8,
          _buildTimeAndLookup(item),
          sdsSBHeight8,
        ],
      ),
    );
  }

  Widget _buildCardStatus(HistoryDeclareItemModel item) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingVerySmall,
        vertical: AppDimens.paddingSmallest,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius16),
        color: item.trangThai.cardStatusColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: item.trangThai.historyStatusColor,
              shape: BoxShape.circle,
            ),
          ),
          sdsSBWidth8,
          SDSBuildText(
            item.trangThai.titleStatus,
            style: AppTextStyle.font12Re.copyWith(
              color: item.trangThai.historyStatusColor,
            ),
          ),
        ],
      ),
    ).paddingOnly(top: AppDimens.paddingSmall, left: AppDimens.defaultPadding);
  }

  Widget _buildTitleProcedure(HistoryDeclareItemModel item) {
    return Row(
      children: [
        SDSImageSvg(Assets.ASSETS_ICONS_IC_PROCEDURE_SVG),
        sdsSBWidth8,
        SDSBuildText(
          "${LocaleKeys.history_procedure.tr} ${item.maThuTuc}",
          style: AppTextStyle.font14Bo,
        ),
        if (item.soHoSo?.isNotEmpty ?? false)
          Expanded(
            child: SDSBuildText(
              "${LocaleKeys.history_number.tr}${item.soHoSo ?? ''}",
              style: AppTextStyle.font14Bo,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildTimeAndLookup(HistoryDeclareItemModel item) {
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            changeDateString(item.thoiGianGui, pattern: PATTERN_14),
            style: AppTextStyle.font12Re.copyWith(color: AppColors.dsGray2),
            maxLines: 1,
          ),
        ),
        InkWell(
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
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
