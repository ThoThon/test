part of 'select_staff_page.dart';

extension SelectStaffWidget on SelectStaffPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchStaff(),
        sdsSBHeight12,
        _buildViewListStaffSelect(),
        _buildButtonConfirm(),
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
        hintTextSize: AppDimens.fontSmall(),
        iconAssets: Assets.ASSETS_ICONS_IC_SEARCH_SVG,
        onChanged: (_) {
          controller.functionSearch();
        },
        border: _buildOutlineBorder(),
        focusedBorder: _buildOutlineBorder(),
        enabledBorder: _buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius30),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.colorBlack,
      ),
    );
  }

  Widget _buildItemStaff(SelectStaffResponse item) {
    return Obx(
      () {
        final isSelected = controller.staffSelected.value == item;
        return InkWell(
          onTap: () {
            controller.staffSelected.value = item;
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: item.hoTen,
                            style: AppTextStyle.font16Bo,
                          ),
                          if (item.soCCCD.isNotEmpty)
                            TextSpan(
                              text: ' (${item.maSoBHXH})',
                              style: AppTextStyle.font14Re.copyWith(
                                color: AppColors.colorBlack,
                              ),
                            ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                    Visibility(
                      visible: item.chucVu.isNotEmpty,
                      child: SDSBuildText(
                        item.chucVu,
                        style: AppTextStyle.font12Re,
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.check_outlined,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.colorTransparent,
              ),
            ],
          ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
        );
      },
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
                    itemBuilder: (context, index) {
                      final item = controller.listStaffSelect[index];
                      return _buildItemStaff(item);
                    },
                    itemCount: controller.listStaffSelect.length,
                    separatorBuilder: (context, index) =>
                        UtilWidget.buildDividerDefault(),
                  ),
          ),
        ).paddingAll(AppDimens.paddingSmall),
      ),
    );
  }

  Widget _buildButtonConfirm() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.staffList_confirm.tr,
      onPressed: () {
        Get.back(result: controller.staffSelected.value);
      },
    ).paddingSymmetric(vertical: AppDimens.defaultPadding);
  }
}
