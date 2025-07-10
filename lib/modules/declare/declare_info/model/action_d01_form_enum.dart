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

  IconData get icon {
    switch (this) {
      case ActionD01FormEnum.edit:
        return Icons.autorenew;
      case ActionD01FormEnum.delete:
        return Icons.delete;
    }
  }
}
