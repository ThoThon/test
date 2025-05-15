part of 'nfc_page.dart';

extension NfcWidget on NfcPage {
  Widget _buildBody() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UtilWidget.buildCardBase(
                    Center(
                      child: Column(
                        children: [
                          SDSImageSvg(Assets.ASSETS_ICONS_IC_CCCD_SVG),
                          sdsSBHeight20,
                          Image.asset(
                            Assets.ASSETS_IMAGES_IPHONE_JPG,
                            height: 400,
                          ),
                        ],
                      ),
                    ).paddingAll(AppDimens.defaultPadding),
                  ),
                  SDSBuildText(
                    LocaleKeys.scanCccd_guideScanCCCD.tr,
                    style: AppTextStyle.font16Bo.copyWith(
                      color: AppColors.basicBlack,
                    ),
                  ).paddingOnly(
                    bottom: AppDimens.padding5,
                    top: AppDimens.paddingSmall,
                  ),
                  _titleInstruct(
                    LocaleKeys.scanCccd_stepOne.tr,
                    LocaleKeys.scanCccd_titleStepOne.tr,
                  ),
                  _titleInstruct(
                    LocaleKeys.scanCccd_stepTwo.tr,
                    LocaleKeys.scanCccd_titleStepTwo.tr,
                  ),
                  _titleInstruct(
                    LocaleKeys.scanCccd_stepThree.tr,
                    LocaleKeys.scanCccd_titleStepThree.tr,
                  ),
                ],
              ).paddingAll(AppDimens.padding15),
            ),
          ),
          _buildButtonNfcContinue(),
        ],
      ),
    );
  }

  Widget _titleInstruct(
    String step,
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sdsSBHeight8,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SDSBuildText("$step. "),
            ),
            Expanded(
              child: SDSBuildText(
                title,
                maxLines: 4,
              ),
            ),
          ],
        ),
        sdsSBHeight8,
      ],
    ).paddingOnly(bottom: AppDimens.padding5);
  }

  Widget _buildButtonNfcContinue() {
    return BaseButton(
      text: 'Bắt đầu',
      onPressed: () async {
        Get.bottomSheet(
          UtilWidget.buildBottomSheetFigma(
            title: 'Sẵn sàng quét',
            textColor: AppColors.basicGrey1,
            child: Column(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_ICON_SCAN_NFC_SVG),
                sdsSBHeight16,
                SDSBuildText(
                  'Bạn hãy đưa CCCD gắn chip lại gần camera,\ndi chuyển lên xuống để nhận cảm biến',
                  textAlign: TextAlign.center,
                ),
                sdsSBHeight16,
                BaseButton(
                  text: 'Hủy',
                  padding: EdgeInsets.zero,
                  boderColor: AppColors.primaryColor,
                  color: AppColors.colorWhite,
                  textColor: AppColors.primaryColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
                sdsSBHeight16,
              ],
            ),
          ),
        );
        await Future.delayed(Duration(seconds: 3));
        Get.toNamed(AppRoutes.nfcInformationUser.path);
      },
    );
  }
}
