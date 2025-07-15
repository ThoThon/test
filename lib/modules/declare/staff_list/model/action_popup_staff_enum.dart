import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

import '../../../../assets.dart';

enum ActionPopupStaffEnum {
  // Sửa
  edit,

  // Xóa
  delete;

  String get title {
    switch (this) {
      case ActionPopupStaffEnum.edit:
        return LocaleKeys.staffList_edit.tr;
      case ActionPopupStaffEnum.delete:
        return LocaleKeys.staffList_delete.tr;
    }
  }

  String get iconAsset {
    switch (this) {
      case ActionPopupStaffEnum.edit:
        return Assets.ASSETS_ICONS_IC_EDIT_SVG;
      case ActionPopupStaffEnum.delete:
        return Assets.ASSETS_ICONS_IC_DELETE_SVG;
    }
  }
}
