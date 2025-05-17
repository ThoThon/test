part of 'history_page.dart';

extension HistoryWidget on HistoryPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildSearchAndFilter(),
          _buildDatePicker(),
          _buildViewListHistory(),
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
        _buildFilterButton(),
      ],
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

  Widget _buildViewListHistory() {
    return Expanded(
      child: UtilWidget.buildCardBase(
        baseShowLoading(
          () => UtilWidget.buildSmartRefresher(
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoadMore: controller.onLoadMore,
            enablePullUp: true,
            child: controller.listHistory.isEmpty
                ? UtilWidget.buildEmptyList()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final item = controller.listHistory[index];
                      return _buildCardItemHistory(item);
                    },
                    itemCount: controller.listHistory.length,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SDSBuildText(
              '${LocaleKeys.declarationPeriod_month.tr} ${convertDateToString(controller.selectedPeriodDate.value, PATTERN_12)}',
              style: AppTextStyle.font16Bo,
            ),
            UtilWidget.buildSolidButtonBack(
              title: LocaleKeys.declarationPeriod_selectMonth.tr,
              onPressed: () {
                controller.pickPeriodDate();
              },
            ),
          ],
        );
      },
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildFilterButton() {
    return IconButton(
      icon: SDSImageSvg(
        Assets.ASSETS_ICONS_IC_FILTER_SVG,
        width: AppDimens.sizeIcon32,
        height: AppDimens.sizeIcon32,
      ),
      onPressed: () {
        Get.bottomSheet(
          UtilWidget.buildBottomSheetFigma(
            title: LocaleKeys.history_selectedProcedure.tr,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final type = ProcedureFilterEnum.values[index];
                return Material(
                  color: AppColors.colorWhite,
                  child: Obx(
                    () => _buildItemBottomSheetFilter(
                      onTap: () {
                        //Lọc thủ tục
                        controller.selectProcedure.value = type;
                        // Khi chọn thủ tục thì đóng bottom sheet
                        Get.back();
                        controller.listHistory.clear();
                        controller.getListHistory();
                      },
                      text: type.title.tr,
                      style: controller.selectProcedure.value == type
                          ? AppTextStyle.font14Bo
                              .copyWith(color: AppColors.primaryColor)
                          : AppTextStyle.font14Re,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  UtilWidget.buildDividerDefault(),
              itemCount: ProcedureFilterEnum.values.length,
            ),
          ),
        );
      },
    ).paddingOnly(left: AppDimens.paddingSmall);
  }
}
