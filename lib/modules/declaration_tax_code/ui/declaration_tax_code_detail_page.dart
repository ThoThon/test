import 'ui_src.dart';

class DeclarationTaxCodeDetailPage extends BaseGetWidget {
  DeclarationTaxCodeDetailPage({super.key});
  @override
  DeclarationTaxDetailControllerICare get controller => _controller;

  late final _controller = Get.put(DeclarationTaxDetailControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.declaration_selectedUnitCode.tr,
      ),
      body: baseShowLoading(
        () => _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final isUnitEmpty = controller.itemSelected.value?.unitCode.isEmpty == true;
    return SDSSafearea(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextUtils(
                      text: LocaleKeys.declaration_declarationTaxCode,
                      availableStyle: StyleEnum.bodyRegular,
                    ).paddingOnly(
                      right: AppDimens.paddingSmallest,
                    ),
                    TextUtils(
                      text: controller.taxCode ?? '',
                      availableStyle: StyleEnum.bodyBold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ).paddingOnly(bottom: AppDimens.paddingSmall),
                TextUtils(
                  text: LocaleKeys.declaration_declarationListCode.tr,
                  availableStyle: StyleEnum.bodyBold,
                ).paddingOnly(bottom: AppDimens.paddingVerySmall),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return _buildCardItem(controller.listDataDetail[index]);
                    },
                    shrinkWrap: true,
                    itemCount: controller.listDataDetail.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        sdsSBHeight12,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
          ),
          _buildButtonRegister(isUnitEmpty),
          _buildBtnGoToHistoryRegister(isUnitEmpty),
        ],
      ),
    );
  }

  Widget _buildCardItem(InfoCompanyResponse item) {
    return Obx(
      () {
        final isSelected = controller.itemSelected.value?.id == item.id;
        final isExpired = controller.compareTimeValid(item.endDate);
        return InkWell(
          radius: AppDimens.radius8,
          onTap: () {
            isExpired ? null : controller.itemSelected.value = item;
          },
          child: UtilWidget.buildCardBase(
            backgroundColor:
                isExpired ? AppColors.dsGray5 : AppColors.colorWhite,
            Row(
              children: [
                SDSImageSvg(
                  Assets.ASSETS_ICONS_IC_GROUP_SVG,
                  color:
                      isExpired ? AppColors.colorBlack : AppColors.primaryColor,
                  width: AppDimens.sizeIconMedium,
                  height: AppDimens.sizeIconMedium,
                ).paddingOnly(
                  right: AppDimens.paddingVerySmall,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      availableStyle: StyleEnum.bodyBold,
                      text: item.unitCode.isNotEmpty
                          ? item.unitCode.toUpperCase()
                          : LocaleKeys.declaration_noUnitCode,
                    ).paddingOnly(
                      bottom: AppDimens.paddingSmallest,
                    ),
                    TextUtils(
                      text:
                          "${LocaleKeys.transaction_expiryDate.tr} ${changeDateString(item.endDate, pattern: PATTERN_1)}",
                    ),
                  ],
                ),
                if (isSelected) ...[
                  Spacer(),
                  Icon(
                    Icons.check_outlined,
                    color: AppColors.primaryColor,
                  ),
                ]
              ],
            ).paddingAll(
              AppDimens.paddingSmall,
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtonRegister(bool isUnitEmpty) {
    return BaseButton(
      text: isUnitEmpty
          ? LocaleKeys.transaction_signUpForCode
          : LocaleKeys.transaction_agree,
      style: StyleEnum.subBold,
      color: isUnitEmpty ? AppColors.statusGreen : AppColors.primaryColor,
      radius: AppDimens.radius4,
      onPressed: controller.itemSelected.value != null
          ? () {
              Get.toNamed(
                isUnitEmpty
                    ? AppRoutes.createTransaction.path
                    : AppRoutes.home.path,
                arguments: controller.itemSelected.value,
              );
            }
          : null,
    );
  }

  Widget _buildBtnGoToHistoryRegister(bool isUnitEmpty) {
    return Visibility(
      visible: isUnitEmpty,
      child: Padding(
        padding: EdgeInsets.only(
          right: AppDimens.defaultPadding,
          left: AppDimens.defaultPadding,
          bottom: AppDimens.defaultPadding,
        ),
        child: BaseButton(
          radius: AppDimens.radius4,
          padding: EdgeInsets.zero,
          text: LocaleKeys.declaration_historyRegister.tr,
          style: StyleEnum.subBold,
          textColor: AppColors.primaryColor,
          color: AppColors.colorWhite,
          boderColor: AppColors.primaryColor,
          onPressed: () {
            Get.toNamed(
              AppRoutes.historyTransaction.path,
              arguments: controller.itemSelected.value,
            );
          },
        ),
      ),
    );
  }
}
