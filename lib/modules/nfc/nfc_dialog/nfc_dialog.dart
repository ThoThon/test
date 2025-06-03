import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:v_bhxh/modules/nfc/nfc_dialog/nfc_dialog.src.dart';

import '../../src.dart';

class NfcDialog extends BaseGetWidget<NfcDialogController> {
  @override
  NfcDialogController get controller => Get.put(NfcDialogController());

  const NfcDialog({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: SDSBuildText(
                controller.isReading.value ? 'Đang quét CCCD' : 'Sẵn sàng quét',
                style: AppTextStyle.font24Bo.copyWith(
                  color: AppColors.thumbColorSwitch,
                ),
              ).paddingOnly(
                  top: AppDimens.paddingMedium, bottom: AppDimens.padding15),
            ),
            SvgPicture.asset(Assets.ASSETS_ICONS_IC_SCAN_NFC_SVG),
            SDSBuildText(
              controller.isReading.value ? 'Đang quét CCCD' : 'Sẵn sàng quét',
              style: AppTextStyle.font14Re.copyWith(
                color: AppColors.basicBlack,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ).paddingAll(AppDimens.padding10),
            buildProgressBar(controller),
            ButtonUtils.buildButton(
              'Bỏ qua',
              () async {
                await controller.closeNfc();
              },
              isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.colorWhite,
              border: Border.all(width: 1, color: AppColors.primaryCam1),
              borderRadius: BorderRadius.circular(AppDimens.radius4),
              colorText: AppColors.primaryCam1,
              colorOverlay: AppColors.dsGray5,
            ).paddingAll(AppDimens.padding15)
          ],
        ).paddingOnly(bottom: AppDimens.padding10));
  }

  Widget buildProgressBar(NfcDialogController controller) {
    return Visibility(
      visible: controller.isReading.value,
      child: LinearPercentIndicator(
        width: Get.width / 1.5,
        lineHeight: AppDimens.padding5,
        alignment: MainAxisAlignment.center,
        percent: controller.processQuantity.value / controller.maxProcess,
        progressColor: AppColors.primaryCam1,
        barRadius: const Radius.circular(AppDimens.radius4),
      ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
    );
  }
}
