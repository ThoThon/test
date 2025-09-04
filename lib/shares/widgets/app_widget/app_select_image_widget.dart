import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/core/const/app_text_style.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';
import 'package:v_bhxh/shares/widgets/image_app/sds_image_svg.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

class AppSelectImageWidget extends StatelessWidget {
  const AppSelectImageWidget({
    super.key,
    required this.checkMaxImageAttachments,
    this.onTakePhoto,
    this.onPickImage,
  });

  final bool Function() checkMaxImageAttachments;
  final VoidCallback? onTakePhoto;
  final VoidCallback? onPickImage;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.colorBorder,
      strokeWidth: 2,
      dashPattern: [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: InkWell(
        onTap: _showBottomSheetUploadOptions,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding24),
          child: Center(
            child: Column(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_IC_UP_FILE_SVG),
                SDSBuildText(
                  'Tải ảnh lên',
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.primaryColor),
                ),
                SDSBuildText(
                  LocaleKeys.registerCode_contentDownloadAttachment.tr,
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.textColorGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetUploadOptions() {
    if (checkMaxImageAttachments()) {
      return;
    }

    Get.bottomSheet(
      UtilWidget.buildBottomSheetFigma(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUploadOption(
              icon: Icons.camera_alt_outlined,
              text: LocaleKeys.registerCode_imageFromCamera.tr,
              onTap: onTakePhoto,
            ),
            const Divider(height: 1),
            _buildUploadOption(
              icon: Icons.image_outlined,
              text: LocaleKeys.registerCode_imageFromLibrary.tr,
              onTap: onPickImage,
            ),
            UtilWidget.sizedBox16,
          ],
        ),
      ),
    );
  }

  Widget _buildUploadOption({
    required IconData icon,
    required String text,
    required VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.back();
          onTap?.call();
        },
        child: Row(
          children: [
            Icon(icon),
            UtilWidget.sizedBoxWidth8,
            Expanded(
              child: SDSBuildText(
                text,
                style: AppTextStyle.font16Semi,
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
      ),
    );
  }
}
