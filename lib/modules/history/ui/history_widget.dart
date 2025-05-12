part of 'history_page.dart';

extension HistoryWidget on HistoryPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                _buildSearchAndFilter(),
                Expanded(
                  child: UtilWidget.buildCardBase(
                    baseShowLoading(
                      () => UtilWidget.buildSmartRefresher(
                        refreshController: controller.refreshController,
                        onRefresh: controller.onRefresh,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // final item = controller.listHistoryRegister[index];
                            return Container();
                            // _buildCardItemHistory(item);
                          },
                          itemCount: 10,
                        ),
                      ),
                    ),
                  ).paddingOnly(top: AppDimens.defaultPadding),
                ),
              ],
            ).paddingSymmetric(
              horizontal: AppDimens.defaultPadding,
            ),
          ),
        ],
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
                TextUtils(
                  text: LocaleKeys.historyRegister_searchProfile.tr,
                  availableStyle: StyleEnum.bodyRegular,
                  color: AppColors.thumbColorSwitch,
                ),
              ],
            ).paddingAll(AppDimens.paddingSmall),
          ),
        ),
        SDSImageSvg(
          Assets.ASSETS_ICONS_IC_FILTER_SVG,
          width: AppDimens.sizeIcon32,
          height: AppDimens.sizeIcon32,
        ).paddingOnly(left: AppDimens.paddingSmall),
      ],
    );
  }

  Widget _buildCardItemHistory(
    int index,
  ) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SDSImageSvg(
            color: index == 0 ? AppColors.primaryColor : AppColors.dsGray3,
            Assets.ASSETS_ICONS_IC_USER_SVG,
            width: AppDimens.sizeIconMedium,
            height: AppDimens.sizeIconMedium,
          ).paddingOnly(right: AppDimens.paddingVerySmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // SDSBuildText(
                    //   "${item.toKhai}${LocaleKeys.historyRegister_number.tr}",
                    // ),
                    // Flexible(
                    //   child: SDSBuildText(
                    //     item.soHoSo,
                    //     style: AppTextStyle.font14Bo,
                    //   ),
                    // ),
                  ],
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                SDSBuildText(
                  '123',
                  // changeDateString(item.thoiGianGui, pattern: PATTERN_9),
                  style: AppTextStyle.font12Re,
                  maxLines: 1,
                ).paddingOnly(bottom: AppDimens.paddingSmallest),
                Row(
                  children: [
                    SDSBuildText(
                      "${LocaleKeys.historyRegister_status.tr}: ",
                      style: AppTextStyle.font12Re,
                    ),
                    SDSBuildText(
                      'Thành công',
                      style: AppTextStyle.font14Bo.copyWith(
                        color: AppColors.statusGreen,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: index == 0,
            child: SDSImageSvg(
              Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
              height: AppDimens.sizeIcon,
              width: AppDimens.sizeIcon,
            ),
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }
}
