part of 'history_page.dart';

extension HistoryWidget on HistoryPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTabAndSearchInput(),
          _buildActionSelectMonth(),
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
            ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          ),
        ],
      ),
    );
  }

  Widget _buildTabAndSearchInput() {
    return Container(
      color: AppColors.basicWhite,
      child: Column(
        children: [
          _buildSearchAndFilter(),
          _buildTabs(),
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
              borderRadius: BorderRadius.circular(AppDimens.radius30),
              color: AppColors.backgroundColorLight,
              border: Border.all(width: 1, color: AppColors.dsGray3),
            ),
            padding: const EdgeInsets.only(
              top: AppDimens.paddingSmallest,
              bottom: AppDimens.paddingSmallest,
              left: AppDimens.paddingVerySmall,
            ),
            child: Row(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_IC_SEARCH_SVG),
                sdsSBWidth8,
                Expanded(
                  child: BuildInputText(
                    InputTextModel(
                      inputFormatters: InputFormatterEnum.textNormal,
                      maxLengthInputForm: 20,
                      isShowCounterText: false,
                      controller: controller.searchController,
                      hintText: LocaleKeys.history_inputFileNumber.tr,
                      textInputAction: TextInputAction.done,
                      hintTextColor: AppColors.thumbColorSwitch,
                      hintTextSize: AppDimens.fontSmall(),
                      isDense: true,
                      fillColor: AppColors.backgroundColorLight,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (_) {
                        controller.functionSearch();
                      },
                      border: _buildOutlineBorder(),
                      focusedBorder: _buildOutlineBorder(),
                      enabledBorder: _buildOutlineBorder(),
                      errorBorder: _buildOutlineBorder(),
                      disabledBorder: _buildOutlineBorder(),
                      focusedErrorBorder: _buildOutlineBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildFilterButton(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius30),
      borderSide: BorderSide.none,
    );
  }

  Widget _buildFilterButton() {
    return IconButton(
      icon: SDSImageSvg(
        Assets.ASSETS_ICONS_IC_FILTER_SVG,
        color: AppColors.textColorGrey,
        width: AppDimens.sizeIcon32,
        height: AppDimens.sizeIcon32,
      ),
      onPressed: () {
        Get.bottomSheet(
          controller.currentTab.value == HistoryTabEnum.file_declare
              ? _buildFilterHistoryDeclare()
              : _buildFilterHistoryRegister(),
        );
      },
    ).paddingOnly(left: AppDimens.paddingSmallest);
  }

  Widget _buildTabs() {
    return Container(
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
              Expanded(
                child: _buildTabButton(
                  title: 'Kê khai hồ sơ',
                  isSelected: controller.currentTab.value ==
                      HistoryTabEnum.file_declare,
                  onTap: () {
                    controller.onTabChanged(HistoryTabEnum.file_declare);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingSmall),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(width: 4, color: AppColors.primaryColor))
              : null,
        ),
        child: Center(
          child: SDSBuildText(
            title,
            style: isSelected
                ? AppTextStyle.font14Bo.copyWith(color: AppColors.primaryColor)
                : AppTextStyle.font14Re.copyWith(
                    color: AppColors.colorBlack,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionSelectMonth() {
    return Obx(
      () {
        final month = controller.selectedPeriodDate.value.month;
        final year = controller.selectedPeriodDate.value.year;
        return InkWell(
          onTap: controller.pickPeriodDate,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingVerySmall,
              vertical: AppDimens.paddingVerySmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.basicWhite,
              borderRadius: BorderRadius.circular(
                AppDimens.radius20,
              ),
            ),
            margin: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SDSBuildText(
                  'Tháng $month/$year',
                  style:
                      AppTextStyle.font14Bo.copyWith(color: AppColors.dsGray1),
                ),
                sdsSBWidth4,
                SDSImageSvg(Assets.ASSETS_ICONS_IC_ARROW_DOWN_SVG),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterHistoryDeclare() {
    return UtilWidget.buildBottomSheetFigma(
      title: LocaleKeys.history_selectedProcedure.tr,
      textColor: AppColors.colorBlack,
      child: Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final procedure = controller.listProcedureFilter[index];
            final isFirstItem = index == 0;

            return Obx(
              () => _buildItemBottomSheetFilter(
                onTap: () {
                  //Lọc thủ tục
                  controller.selectProcedure.value = procedure;
                  // Khi chọn thủ tục thì đóng bottom sheet
                  Get.back();
                  controller.listHistoryDeclare.clear();
                  controller.getHistoryDeclare();
                },
                text: isFirstItem
                    ? procedure.ten.tr
                    : '${procedure.ma} - ${procedure.ten.tr}',
                style: (controller.selectProcedure.value == procedure ||
                        (controller.selectProcedure.value == null &&
                            isFirstItem))
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
    );
  }

  Widget _buildFilterHistoryRegister() {
    final historyRegisterType = HistoryRegisterTypeFilterEnum.values;
    return UtilWidget.baseBottomSheet(
      isMiniSize: true,
      isHeightMin: true,
      title: LocaleKeys.history_selectedTransaction.tr,
      body: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final filter = historyRegisterType[index];
          return Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingSmall),
              child: _buildItemBottomSheetFilter(
                onTap: () {
                  // Lọc thủ tục
                  controller.selectFilterHistoryRegister.value = filter;
                  // Khi chọn thủ tục thì đóng bottom sheet
                  Get.back();
                  controller.listHistoryRegister.clear();
                  controller.getHistoryRegister();
                },
                text: filter.title,
                style: controller.selectFilterHistoryRegister.value == filter
                    ? AppTextStyle.font14Bo
                        .copyWith(color: AppColors.primaryColor)
                    : AppTextStyle.font14Re,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => UtilWidget.buildDividerDefault(),
        itemCount: historyRegisterType.length,
      ),
    );
  }
}
