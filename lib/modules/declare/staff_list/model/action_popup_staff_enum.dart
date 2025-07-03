import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

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

  IconData get icon {
    switch (this) {
      case ActionPopupStaffEnum.edit:
        return Icons.autorenew;
      case ActionPopupStaffEnum.delete:
        return Icons.delete;
    }
  }
}
