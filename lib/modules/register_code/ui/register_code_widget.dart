part of 'register_code_page.dart';

extension RegisterCodeWidget on RegisterCodePage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
        child: Column(
          children: [
            _buildTabs(),
            Expanded(
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
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
              child: Obx(
                () {
                  final String title;
                  switch (controller.currentTab.value) {
                    case RegisterCodeTabEnum.common_info:
                      title = 'Tiếp tục';
                    case RegisterCodeTabEnum.register_info:
                      title = 'Đăng ký';
                  }
                  return UtilWidget.buildSolidButton(
                    title: title,
                    onPressed: controller.registerCodeFirst,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.defaultPadding,
        // horizontal: AppDimens.defaultPadding,
      ),
      child: Container(
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
                    title: 'Thông tin chung',
                    // enabled: controller.enableTk1Tab,
                    isSelected: controller.currentTab.value ==
                        RegisterCodeTabEnum.common_info,
                    onTap: () {
                      controller.onTabChanged(RegisterCodeTabEnum.common_info);
                    },
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    title: 'Thông tin đăng ký',
                    isSelected: controller.currentTab.value ==
                        RegisterCodeTabEnum.register_info,
                    onTap: () {
                      controller
                          .onTabChanged(RegisterCodeTabEnum.register_info);
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

  _buildTabButton({
    required String title,
    required isSelected,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
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
                ? AppTextStyle.font14Bo.copyWith(color: AppColors.basicWhite)
                : AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
          ).paddingSymmetric(
            horizontal: AppDimens.paddingSmall,
            vertical: AppDimens.paddingVerySmall,
          ),
        ),
      ),
    );
  }
}
