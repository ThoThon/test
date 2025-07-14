part of 'select_staff_page.dart';

extension SelectStaffWidget on SelectStaffPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchStaff(),
        sdsSBHeight12,
        _staffTitle(),
        sdsSBHeight12,
        _buildViewListStaffSelect(),
        // const SizedBox(
        //   height: 20,
        // )
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingSmallest);
  }

  Widget _buildSearchStaff() {
    return SizedBox(
      height: 40,
      child: BuildInputText(
        InputTextModel(
          controller: controller.searchController,
          hintText: LocaleKeys.staffList_search.tr,
          hintTextColor: AppColors.thumbColorSwitch,
          prefixIconColor: AppColors.thumbColorSwitch,
          fillColor: AppColors.colorTransparent,
          maxLengthInputForm: 100,
          isShowCounterText: false,
          hintTextSize: AppDimens.fontSmall(),
          iconAssets: Assets.ASSETS_ICONS_IC_SEARCH_SVG,
          onChanged: (_) => controller.functionSearch(),
          border: _buildOutlineBorder(),
          focusedBorder: _buildOutlineBorder(),
          enabledBorder: _buildOutlineBorder(),
        ),
      ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
    );
  }

  OutlineInputBorder _buildOutlineBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.thumbColorSwitch,
        ),
      );

  Widget _buildItemStaff(SelectStaffResponse item, int index) {
    return Obx(
      () {
        final isFirst = index == 0;
        final isLast = index == controller.listStaffSelect.length - 1;

        BorderRadius borderRadius;
        Border border;

        if (isFirst && isLast) {
          // Single item - all corners rounded, all borders
          borderRadius = BorderRadius.circular(AppDimens.radius12);
          border = Border.all(color: AppColors.dsGray5);
        } else if (isFirst) {
          // First item - top corners rounded, top, left, right borders
          borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(AppDimens.radius12),
            topRight: Radius.circular(AppDimens.radius12),
          );
          border = const Border(
            top: BorderSide(color: AppColors.dsGray5),
            left: BorderSide(color: AppColors.dsGray5),
            right: BorderSide(color: AppColors.dsGray5),
          );
        } else if (isLast) {
          // Last item - bottom corners rounded, all borders
          borderRadius = const BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.radius12),
            bottomRight: Radius.circular(AppDimens.radius12),
          );
          border = Border.all(color: AppColors.dsGray5);
        } else {
          // Middle items - no rounded corners, left and right borders only
          borderRadius = BorderRadius.zero;
          border = const Border(
            top: BorderSide(color: AppColors.dsGray5),
            left: BorderSide(color: AppColors.dsGray5),
            right: BorderSide(color: AppColors.dsGray5),
          );
        }

        return Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
          ),
          child: InkWell(
            onTap: () {
              Get.back(result: item);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_PERSON_2_SVG,
                  height: AppDimens.sizeIcon32,
                  color: AppColors.primaryColor,
                ).paddingSymmetric(
                  vertical: AppDimens.paddingSmall,
                  horizontal: AppDimens.defaultPadding,
                ),
                sdsSBWidth12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStaffInfo(item),
                      if (item.chucVu.isNotEmpty)
                        SDSBuildText(
                          item.chucVu,
                          style: AppTextStyle.font12Re,
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.check_outlined,
                  color: controller.selectedID.value == item.id
                      ? AppColors.primaryColor
                      : AppColors.colorTransparent,
                ),
              ],
            ).paddingSymmetric(
              vertical: AppDimens.paddingSmallest,
              horizontal: AppDimens.paddingSmallest,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStaffInfo(SelectStaffResponse item) {
    // return RichText(
    //   maxLines: 2,
    //   text: TextSpan(
    //     children: [
    //       TextSpan(
    //         text: item.hoTen,
    //         style: AppTextStyle.font16Bo,
    //       ),
    //       if (item.maSoBHXH.isNotEmpty)
    //         TextSpan(
    //           text: ' (${item.maSoBHXH})',
    //           style: AppTextStyle.font14Re.copyWith(
    //             color: AppColors.colorBlack,
    //           ),
    //         ),
    //     ],
    //   ),
    // );
    return Row(
      children: [
        Expanded(
          child: SDSBuildText(
            '${item.hoTen}${item.maSoBHXH.isNotEmpty ? ' (${item.maSoBHXH})' : ''}',
            maxLines: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildViewListStaffSelect() {
    return Expanded(
      child: baseShowLoading(
        () => UtilWidget.buildSmartRefresher(
          refreshController: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadMore,
          enablePullUp: true,
          child: controller.listStaffSelect.isEmpty
              ? UtilWidget.buildEmptyList()
              : ListView.builder(
                  itemBuilder: (_, index) {
                    return _buildItemStaff(
                        controller.listStaffSelect[index], index);
                  },
                  itemCount: controller.listStaffSelect.length,
                ),
        ),
      ),
    );
  }

  Widget _staffTitle() {
    return SizedBox(
      width: double.infinity,
      child: SDSBuildText(
        LocaleKeys.staffList_listEmployee.tr,
        style: AppTextStyle.font16Bo,
        textAlign: TextAlign.start,
      ),
    ).paddingSymmetric(
      horizontal: AppDimens.paddingSmall,
    );
  }
}
