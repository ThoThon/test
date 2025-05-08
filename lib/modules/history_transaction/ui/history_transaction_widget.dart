part of 'history_transaction_page.dart';

extension HistoryTransactionWidget on HistoryTransactionPage {
  Widget _buildBody() {
    final checkHaveUnitCode = controller.registerItem != null &&
        controller.registerItem?.unitCode?.isNotEmpty == true;
    return SDSSafearea(
      child: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                _buildTaxcodeDisplay(),
                _buildSearchAndFilter(),
                // _buildButtonTab(),
                Obx(
                  () {
                    switch (controller.selectTab.value) {
                      case HistoryTransactionEnum.registerTab:
                        return HistoryRegisterTabPage();
                      case HistoryTransactionEnum.declarationFormTab:
                        return SizedBox.shrink();
                      // return HistoryDeclarationFormTabPage();
                    }
                  },
                ),
              ],
            ).paddingSymmetric(
              horizontal: AppDimens.defaultPadding,
            ),
          ),
          Visibility(
            visible: controller.isFromHome.value,
            child: BaseButton(
              text: checkHaveUnitCode
                  ? LocaleKeys.historyRegister_home.tr
                  : LocaleKeys.historyRegister_selectedUnitCode.tr,
              onPressed: () {
                Get.until(
                  (route) {
                    return checkHaveUnitCode
                        ? route.settings.name == AppRoutes.home.path
                        : route.settings.name ==
                            AppRoutes.declarationTaxCodeDetail.path;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTaxcodeDisplay() {
    return Row(
      children: [
        TextUtils(
          text: LocaleKeys.unitInfo_inputTaxCode.tr,
          availableStyle: StyleEnum.bodyRegular,
        ).paddingOnly(right: AppDimens.paddingSmallest),
        TextUtils(
          text: controller.taxCode,
          availableStyle: StyleEnum.bodyBold,
          color: AppColors.primaryColor,
        ),
      ],
    ).paddingOnly(bottom: AppDimens.defaultPadding);
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primaryNavy),
              borderRadius: BorderRadius.circular(AppDimens.radius30),
            ),
            child: Row(
              children: [
                SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_SEARCH_SVG,
                  width: AppDimens.sizeIcon,
                  height: AppDimens.sizeIcon,
                ).paddingOnly(right: AppDimens.paddingVerySmall),
                TextUtils(
                  text: LocaleKeys.historyRegister_searchProfile.tr,
                  availableStyle: StyleEnum.bodyRegular,
                  color: AppColors.thumbColorSwitch,
                ),
              ],
            ).paddingAll(AppDimens.paddingSmall),
          ),
        ),
        SDSImageSvg(
          Assets.ASSETS_ICONS_IC_FILTER_SVG,
          width: AppDimens.sizeIcon32,
          height: AppDimens.sizeIcon32,
        ).paddingOnly(left: AppDimens.paddingSmall),
      ],
    );
  }

  // Widget _buildButtonTab() {
  //   return Container(
  //       decoration: BoxDecoration(
  //         color: AppColors.colorWhite,
  //         borderRadius: BorderRadius.circular(AppDimens.radius30),
  //       ),
  //       child: Obx(
  //         () {
  //           return Row(
  //             children: [
  //               _buildItemTabButton(
  //                 onTap: () {
  //                   controller
  //                       .changeFilterTab(HistoryTransactionEnum.registerTab);
  //                 },
  //                 title: LocaleKeys.transaction_register.tr,
  //                 filter: HistoryTransactionEnum.registerTab,
  //                 selectTab: controller.selectTab.value,
  //               ),
  //               _buildItemTabButton(
  //                 onTap: () {
  //                   controller.changeFilterTab(
  //                       HistoryTransactionEnum.declarationFormTab);
  //                 },
  //                 title: LocaleKeys.historyRegister_declarationForm.tr,
  //                 filter: HistoryTransactionEnum.declarationFormTab,
  //                 selectTab: controller.selectTab.value,
  //               ),
  //             ],
  //           );
  //         },
  //       ));
  // }

  // Widget _buildItemTabButton({
  //   required String title,
  //   required HistoryTransactionEnum selectTab,
  //   required HistoryTransactionEnum filter,
  //   VoidCallback? onTap,
  // }) {
  //   final isSelected = filter == selectTab;
  //   return Expanded(
  //     child: InkWell(
  //       onTap: onTap,
  //       borderRadius: BorderRadius.circular(AppDimens.radius30),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //               width: 1,
  //               color:
  //                   isSelected ? AppColors.primaryColor : AppColors.colorWhite),
  //           borderRadius: BorderRadius.circular(AppDimens.radius30),
  //           color: isSelected ? AppColors.buttonTab : AppColors.colorWhite,
  //         ),
  //         child: TextUtils(
  //           text: title,
  //           textAlign: TextAlign.center,
  //           color: isSelected ? AppColors.primaryColor : AppColors.colorBlack,
  //           availableStyle:
  //               isSelected ? StyleEnum.bodyBold : StyleEnum.bodyRegular,
  //         ).paddingSymmetric(vertical: AppDimens.paddingSmall),
  //       ),
  //     ),
  //   );
  // }
}
