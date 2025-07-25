import 'package:flutter/material.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/core/theme/colors.dart';

enum SnackBarType {
  success,
  failure;

  Color get backgroundColor {
    switch (this) {
      case SnackBarType.success:
        return AppColors.backgroundSuccess;
      case SnackBarType.failure:
        return AppColors.backgroundFail;
    }
  }

  Color get borderColor {
    switch (this) {
      case SnackBarType.success:
        return AppColors.statusGreen;
      case SnackBarType.failure:
        return AppColors.statusRed;
    }
  }

  String get iconPath {
    switch (this) {
      case SnackBarType.success:
        return Assets.ASSETS_ICONS_ICON_SNACK_BAR_SUCCESS_SVG;
      case SnackBarType.failure:
        return Assets.ASSETS_ICONS_ICON_SNACK_BAR_FAIL_SVG;
    }
  }
}
