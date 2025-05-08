part of 'await_confirm_signature_page.dart';

extension AwaitConfirmSignatureWidget on AwaitConfirmSignaturePage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => controller.listSign.isEmpty
                ? _buildAwait(title: LocaleKeys.awaitConfirmSign_loading.tr)
                : ListView.builder(
                    itemCount: controller.listSign.length,
                    itemBuilder: (context, index) {
                      final item = controller.listSign[index];
                      return InkWell(
                          onTap: () async {
                            await controller.confirmSign(item);
                          },
                          child: UtilWidget.buildCardBase(
                            radius: AppDimens.radius4,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtils(
                                  text: item.certSerial,
                                  availableStyle: StyleEnum.bodyBold,
                                  color: AppColors.colorBlack,
                                  maxLine: 2,
                                ),
                                sdsSBHeight8,
                                TextUtils(
                                  text: LocaleKeys
                                      .awaitConfirmSign_checkConfirmSign.tr,
                                  availableStyle: StyleEnum.bodyBold,
                                  color: AppColors.colorBlack,
                                ),
                                sdsSBHeight8,
                                TextUtils(
                                  text:
                                      "${LocaleKeys.awaitConfirmSign_createDate.tr} ${convertDateStringToString(item.createTime, PATTERN_1)}",
                                  availableStyle: StyleEnum.bodyRegular,
                                  color: AppColors.colorBlack,
                                ),
                              ],
                            ).paddingAll(AppDimens.paddingSmall),
                          ).paddingOnly(
                            top: AppDimens.defaultPadding,
                            left: AppDimens.defaultPadding,
                            right: AppDimens.defaultPadding,
                          ));
                    },
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildAwait({String? title}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UtilWidget.buildLoading(
            AppColors.primaryColor,
          ),
          TextUtils(
            text: title ?? LocaleKeys.awaitConfirmSign_comfirmSignLoading.tr,
            availableStyle: StyleEnum.bodyBold,
            color: AppColors.colorBlack,
          ).paddingAll(AppDimens.defaultPadding),
        ],
      ),
    );
  }
}
