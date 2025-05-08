import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/shares/widgets/image_app/sds_image_svg.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({
    super.key,
    this.backFunc,
  });

  final VoidCallback? backFunc;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: backFunc ?? Get.back,
      icon: SDSImageSvg(
        Assets.ASSETS_ICONS_IC_ARROW_LARGE_SVG,
        width: AppDimens.sizeIconMedium,
        height: AppDimens.sizeIconMedium,
      ),
    );
  }
}
