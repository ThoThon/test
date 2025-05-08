part of '../create_transaction_page.dart';

extension CreateTransactionWidget on CreateTransactionPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Column(
        children: [
          _buildInfoTab(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      return IndexedStack(
                        index: controller.indexedStackInfoTab.value,
                        children: [
                          GeneralInfoTabPage(),
                          RegisterInfoTabPage(),
                        ],
                      );
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
            ),
          ),
          _buildButtonConsignment(),
        ],
      ),
    );
  }

  Widget _buildInfoTab() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius30),
        color: AppColors.colorWhite,
      ),
      child: Obx(
        () {
          return Row(
            children: [
              Expanded(
                child: _buildInfoTabButton(
                    onTap: () {
                      controller.changeInfoTab(0);
                    },
                    title: LocaleKeys.transaction_generalInfo.tr,
                    indexTab: 0,
                    selectedTab: controller.indexedStackInfoTab.value),
              ),
              Expanded(
                child: _buildInfoTabButton(
                    onTap: () {
                      controller.changeInfoTab(1);
                    },
                    title: LocaleKeys.transaction_registerInfo.tr,
                    indexTab: 1,
                    selectedTab: controller.indexedStackInfoTab.value),
              ),
            ],
          );
        },
      ),
    ).paddingOnly(
      right: AppDimens.defaultPadding,
      left: AppDimens.defaultPadding,
      bottom: AppDimens.defaultPadding,
    );
  }

  Widget _buildInfoTabButton({
    required String title,
    required int indexTab,
    required int selectedTab,
    VoidCallback? onTap,
  }) {
    final isSelected = indexTab == selectedTab;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radius30),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMedium,
          vertical: AppDimens.paddingSmall,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radius30),
          color: isSelected ? AppColors.buttonTab : AppColors.colorWhite,
        ),
        child: TextUtils(
          textAlign: TextAlign.center,
          text: title,
          availableStyle: StyleEnum.bodyBold,
          color: isSelected ? AppColors.primaryColor : AppColors.colorBlack,
        ),
      ),
    );
  }

  Widget _buildButtonConsignment() {
    return BaseButton(
      text: LocaleKeys.transaction_consignment.tr,
      style: StyleEnum.subBold,
      radius: AppDimens.radius4,
      onPressed: () {
        controller.validateAndSubmit();
      },
    );
  }
}
