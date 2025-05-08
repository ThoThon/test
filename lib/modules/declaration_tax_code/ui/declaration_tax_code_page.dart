import '../declaration_tax_code_src.dart';

class DeclarationTaxCodePage extends BaseGetWidget {
  DeclarationTaxCodePage({super.key});

  @override
  DeclarationTaxControllerICare get controller => _controller;

  late final _controller = Get.put(DeclarationTaxControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: TextUtils(
          text: LocaleKeys.declaration_declarationSocial.tr,
          availableStyle: StyleEnum.subBold,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return baseShowLoading(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: LocaleKeys.declaration_selectTaxCode.tr,
            availableStyle: StyleEnum.bodyBold,
          ).paddingOnly(
            bottom: AppDimens.paddingVerySmall,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  final item = controller.listData[index];
                  return _buildCardItem(item);
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listData.length,
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildCardItem(
    TaxModelResponse item,
  ) {
    return Visibility(
      visible: item.isActive,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            AppRoutes.declarationTaxCodeDetail.path,
            arguments: item.taxcode,
          );
        },
        child: SDSCard(
          child: Row(
            children: [
              SDSImageSvg(
                Assets.ASSETS_ICONS_IC_HUGE_SVG,
                width: AppDimens.sizeIconMedium,
                height: AppDimens.sizeIconMedium,
              ).paddingOnly(
                right: AppDimens.paddingVerySmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: item.email,
                    availableStyle: StyleEnum.bodyBold,
                  ).paddingOnly(
                    bottom: AppDimens.paddingSmallest,
                  ),
                  TextUtils(
                    text: item.taxcode,
                    availableStyle: StyleEnum.bodyRegular,
                  ),
                ],
              ),
              Spacer(),
              SDSImageSvg(
                Assets.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                width: AppDimens.sizeIcon,
                height: AppDimens.sizeIcon,
              ),
            ],
          ).paddingSymmetric(
            horizontal: AppDimens.paddingSmall,
            vertical: AppDimens.defaultPadding,
          ),
        ),
      ).paddingOnly(bottom: AppDimens.paddingVerySmall),
    );
  }
}
