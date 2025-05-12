part of 'declare_info_page.dart';

extension DeclareInfoWidget on DeclareInfoPage {
  Widget _buildBody() {
    return Column(
      children: [
        _buildTabs(),
        Expanded(
          child: Obx(
            () {
              return IndexedStack(
                index: controller.selectedTab.value.index,
                children: [
                  _buildD02TabBody(),
                  _buildTk1TabBody(),
                  _buildD01TabBody(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(AppDimens.radius8),
          ),
          padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  title: 'D02-LT',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.d02,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d02);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'TK1-TS',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.tk1,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.tk1);
                  },
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'D01-TS',
                  isSelected:
                      controller.selectedTab.value == DeclareInfoTab.d01,
                  onTap: () {
                    controller.onTabChanged(DeclareInfoTab.d01);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabButton({
    required String title,
    required isSelected,
    VoidCallback? onTap,
  }) {
    return Material(
      color: isSelected ? AppColors.primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimens.radius8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radius8),
        child: Center(
          child: SDSBuildText(
            title,
            style: AppTextStyle.font16Re.copyWith(
              color: isSelected ? AppColors.colorWhite : AppColors.primaryColor,
            ),
          ).paddingAll(AppDimens.paddingSmall),
        ),
      ),
    );
  }

  Widget _buildScanIDButton({
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.qr_code_scanner,
            size: 36,
          ),
          UtilWidget.sizedBoxWidth8,
          Flexible(
            child: SDSBuildText(
              'Quét căn cước công dân để lấy thông tin',
              style: AppTextStyle.font14Semi,
            ),
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }
}
