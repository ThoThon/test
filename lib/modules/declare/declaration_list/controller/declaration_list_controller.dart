import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/core/router/app_route.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/declaration_list_argument.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

class DeclarationListController extends BaseGetxController {
  final argument = Get.arguments as DeclarationListArgument;

  void showDialogCheckedSuccess() {
    ShowDialog.showDialogConfirm2(
      title: 'Thành Công!',
      content:
          'Đã gửi hồ sơ tới hệ thống ký số, vui lòng đăng nhập mysign để tiến hành phê duyệt.',
      iconType: DialogIconType.success,
      exitTitle: 'Thoát',
      confirmTitle: 'Lịch sử',
      onCancel: () {
        Get.until(ModalRoute.withName(AppRoutes.pageBuilder.path));
      },
      onConfirm: () {
        Get.toNamed(AppRoutes.history.path);
      },
    );
  }
}
