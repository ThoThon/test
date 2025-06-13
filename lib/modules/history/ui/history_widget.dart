part of 'history_page.dart';

extension HistoryWidget on HistoryPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildSearchAndFilter(),
          _buildTabs(),
          Expanded(
            child: Obx(
              () {
                return IndexedStack(
                  index: controller.currentTab.value.index,
                  children: [
                    _buildHistoryDeclare(),
                    _buildHistoryRegister(),
                  ],
                );
              },
            ),
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
          child: BuildInputText(
            InputTextModel(
              controller: controller.searchController,
              hintText: LocaleKeys.history_fileNumber.tr,
              iconNextTextInputAction: TextInputAction.done,
              hintTextColor: AppColors.thumbColorSwitch,
              hintTextSize: AppDimens.fontSmall(),
              iconLeading: Icons.search,
              suffixColor: AppColors.primaryColor,
              prefixIconColor: AppColors.primaryColor,
              onChanged: (_) {
                controller.functionSearch();
              },
              border: _buildOutlineBorder(),
              focusedBorder: _buildOutlineBorder(),
              enabledBorder: _buildOutlineBorder(),
            ),
          ),
        ),
        _buildFilterButton(),
      ],
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius30),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildFilterButton() {
    return IconButton(
      icon: SDSImageSvg(
        Assets.ASSETS_ICONS_IC_FILTER_SVG,
        color: AppColors.primaryColor,
        width: AppDimens.sizeIcon32,
        height: AppDimens.sizeIcon32,
      ),
      onPressed: () {
        Get.bottomSheet(
          UtilWidget.buildBottomSheetFigma(
            title: LocaleKeys.history_selectedProcedure.tr,
            child: Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final procedure = controller.listProcedureFilter[index];
                  return Obx(
                    () => _buildItemBottomSheetFilter(
                      onTap: () {
                        //Lọc thủ tục
                        controller.selectProcedure.value = procedure;
                        // Khi chọn thủ tục thì đóng bottom sheet
                        Get.back();
                        controller.listHistoryDeclare.clear();
                        controller.getListHistoryDeclare();
                      },
                      text: '${procedure.ma} - ${procedure.ten.tr}',
                      style: controller.selectProcedure.value == procedure
                          ? AppTextStyle.font14Bo
                              .copyWith(color: AppColors.primaryColor)
                          : AppTextStyle.font14Re,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    UtilWidget.buildDividerDefault(),
                itemCount: controller.listProcedureFilter.length,
              ),
            ),
          ),
        );
      },
    ).paddingOnly(left: AppDimens.paddingSmall);
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppDimens.radius30),
        ),
        child: Obx(
          () {
            return Row(
              children: [
                Expanded(
                  child: _buildTabButton(
                    title: 'Hồ sơ kê khai',
                    isSelected: controller.currentTab.value ==
                        HistoryTabEnum.file_declare,
                    onTap: () {
                      controller.onTabChanged(HistoryTabEnum.file_declare);
                    },
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    title: 'Đăng ký giao dịch',
                    // enabled: controller.enableTk1Tab,
                    isSelected: controller.currentTab.value ==
                        HistoryTabEnum.register_transaction,
                    onTap: () {
                      controller
                          .onTabChanged(HistoryTabEnum.register_transaction);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lighterPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        border: isSelected
            ? Border.all(width: 1, color: AppColors.primaryColor)
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        child: Center(
          child: SDSBuildText(
            title,
            style: isSelected
                ? AppTextStyle.font14Bo.copyWith(color: AppColors.primaryColor)
                : AppTextStyle.font14Re.copyWith(
                    color: AppColors.colorBlack,
                  ),
          ).paddingSymmetric(
            horizontal: AppDimens.paddingSmall,
            vertical: AppDimens.paddingVerySmall,
          ),
        ),
      ),
    );
  }

  Widget _buildActionSelectMonth() {
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.only(right: AppDimens.defaultPadding),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: controller.pickPeriodDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingVerySmall,
                  vertical: AppDimens.paddingSmallest,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  color: AppColors.basicWhite,
                ),
                child: SDSBuildText(
                  '${controller.selectedPeriodDate.value.month}/${controller.selectedPeriodDate.value.year}',
                  style: AppTextStyle.font16Bo
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
