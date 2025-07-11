part of 'select_staff_page.dart';

extension SelectStaffWidget on SelectStaffPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchStaff(),
        sdsSBHeight12,
        _buildViewListStaffSelect(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildSearchStaff() {
    return BuildInputText(
      InputTextModel(
        controller: controller.searchController,
        hintText: LocaleKeys.staffList_fillFullName.tr,
        iconNextTextInputAction: TextInputAction.done,
        hintTextColor: AppColors.thumbColorSwitch,
        maxLengthInputForm: 100,
        isShowCounterText: false,
        hintTextSize: AppDimens.fontSmall(),
        iconAssets: Assets.ASSETS_ICONS_IC_SEARCH_SVG,
        onChanged: (_) => controller.functionSearch(),
        border: _buildOutlineBorder(),
        focusedBorder: _buildOutlineBorder(),
        enabledBorder: _buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.statusRed,
        ),
      );

  Widget _buildItemStaff(SelectStaffResponse item) {
    return Obx(
      () {
        return InkWell(
          onTap: () {
            Get.back(result: item);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SDSImageSvg(
                Assets.ASSETS_ICONS_IC_PERSON_SVG,
                height: AppDimens.sizeIcon32,
                color: AppColors.primaryColor,
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
          ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
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
      child: UtilWidget.buildCardBase(
        baseShowLoading(
          () => UtilWidget.buildSmartRefresher(
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoadMore: controller.onLoadMore,
            enablePullUp: true,
            child: controller.listStaffSelect.isEmpty
                ? UtilWidget.buildEmptyList()
                : ListView.separated(
                    itemBuilder: (_, index) =>
                        _buildItemStaff(controller.listStaffSelect[index]),
                    itemCount: controller.listStaffSelect.length,
                    separatorBuilder: (_, __) =>
                        UtilWidget.buildDividerDefault(),
                  ),
          ),
        ).paddingAll(AppDimens.paddingSmall),
      ),
    );
  }
}
