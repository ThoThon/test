import 'package:v_bhxh/modules/src.dart';

enum ActionD01FormEnum {
  // Sửa
  edit,

  // Xóa
  delete;

  String get title {
    switch (this) {
      case ActionD01FormEnum.edit:
        return LocaleKeys.staffList_edit.tr;
      case ActionD01FormEnum.delete:
        return LocaleKeys.staffList_delete.tr;
    }
  }

  String get icon {
    switch (this) {
      case ActionD01FormEnum.edit:
        return Assets.ASSETS_ICONS_IC_EDIT_SVG;
      case ActionD01FormEnum.delete:
        return Assets.ASSETS_ICONS_IC_DELETE_SVG;
    }
  }
}
