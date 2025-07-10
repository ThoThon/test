part of 'declare_info_607_page.dart';

extension DeclareInfo607Widget on DeclareInfo607Page {
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Column(
            children: [
              _buildTabs(),
              Expanded(
                child: Obx(
                  () {
                    return IndexedStack(
                      index: controller.currentTab.value.index,
                      children: [
                        _buildTk1TabBody(),
                        _buildD01TabBody(),
                      ],
                    );
                  },
                ),
              ),
              if (!isKeyboardVisible)
                Obx(
                  () => _buildBottomButtons(),
                ).paddingOnly(
                  top: AppDimens.defaultPadding,
                  bottom: AppDimens.paddingVerySmall,
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton(
                    title: 'TK1-TS',
                    enabled: true,
                    isSelected:
                        controller.currentTab.value == DeclareInfo607Tab.tk1,
                    onTap: () {
                      controller.onTabChanged(DeclareInfo607Tab.tk1);
                    },
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    title: 'D01-TS',
                    enabled: controller.enableD01Tab,
                    isSelected:
                        controller.currentTab.value == DeclareInfo607Tab.d01,
                    onTap: () {
                      controller.onTabChanged(DeclareInfo607Tab.d01);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    bool enabled = true,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: isSelected ? AppColors.basicWhite : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimens.radius12),
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(AppDimens.radius8),
          child: Center(
            child: SDSBuildText(
              title,
              style: AppTextStyle.font16Re.copyWith(
                color: !enabled
                    ? const Color(0xFFF56584)
                    : isSelected
                        ? AppColors.primaryColor
                        : AppColors.basicWhite,
              ),
            ).paddingSymmetric(
              horizontal: AppDimens.paddingSmall,
              vertical: AppDimens.paddingVerySmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    if (controller.isShowNextButton) {
      return UtilWidget.buildSolidButton(
        borderRadius: AppDimens.radius30,
        title: LocaleKeys.declareInfo_next.tr,
        textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
        onPressed: () {
          controller.nextTab();
        },
      );
    }

    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      title: LocaleKeys.app_save.tr,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      onPressed: controller.saveDraft,
    );
  }
}
