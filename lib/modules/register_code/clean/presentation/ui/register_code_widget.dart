part of 'register_code_page.dart';

extension RegisterCodeWidget on RegisterCodePage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildTabs(),
          sdsSBHeight12,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.defaultPadding),
              child: Obx(
                () {
                  return IndexedStack(
                    index: controller.currentTab.value.index,
                    children: [
                      _buildCommonInfoTab(),
                      _buildRegisterInfoTab(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
      ),
      child: Obx(
        () {
          return Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  step: '1',
                  title: LocaleKeys.registerCode_commonInfo.tr,
                  isSelected: controller.currentTab.value ==
                      RegisterCodeTabEnum.common_info,
                  onTap: () {
                    controller.onTabChanged(RegisterCodeTabEnum.common_info);
                  },
                ),
              ),
              SDSImageSvg(
                Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                color: AppColors.colorBlack,
              ).paddingOnly(bottom: AppDimens.defaultPadding),
              Expanded(
                child: _buildTabButton(
                  step: '2',
                  mainAxisAlignment: MainAxisAlignment.end,
                  title: LocaleKeys.registerCode_registerInfo.tr,
                  isSelected: controller.currentTab.value ==
                      RegisterCodeTabEnum.register_info,
                  onTap: () {
                    controller.onTabChanged(RegisterCodeTabEnum.register_info);
                  },
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
        },
      ),
    );
  }

  _buildTabButton({
    required String title,
    required bool isSelected,
    VoidCallback? onTap,
    required String step,
    MainAxisAlignment? mainAxisAlignment,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: isSelected ? AppColors.primaryColor : AppColors.basicWhite,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        child: Center(
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.basicWhite,
                  borderRadius: BorderRadius.circular(AppDimens.radius30),
                  border: Border.all(
                    width: 1,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.colorBlack,
                  ),
                ),
                child: Center(
                  child: SDSBuildText(
                    step,
                    style: AppTextStyle.font14Re.copyWith(
                      color: isSelected
                          ? AppColors.basicWhite
                          : AppColors.colorBlack,
                    ),
                  ),
                ),
              ),
              sdsSBWidth4,
              SDSBuildText(
                title,
                style: AppTextStyle.font14Re.copyWith(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.colorBlack,
                ),
              ),
            ],
          ).paddingOnly(
            bottom: AppDimens.paddingSmall,
          ),
        ),
      ),
    );
  }
}
