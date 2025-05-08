import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.src.dart';

class SDSImageSvg extends StatelessWidget {
  const SDSImageSvg(
    this.assetName, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.fit,
    this.alignment,
  });
  final String assetName;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      width: width,
      colorFilter: color != null
          ? ColorFilter.mode(
              color ?? AppColors.colorWhite,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
