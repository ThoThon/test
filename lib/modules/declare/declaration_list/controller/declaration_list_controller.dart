import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/core/router/app_route.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/declaration_list_argument.dart';
import 'package:v_bhxh/modules/declare/declaration_list/repository/declaration_list_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

class DeclarationListController extends BaseGetxController {
  final argument = Get.arguments as DeclarationListArgument;

  late final _repository = DeclarationListRepository(this);

  Future<void> signDocument() async {
    try {
      _showDialogCheckedSuccess();

      await Future.delayed(const Duration(seconds: 2));

      final response = await _repository.signDocument(
        declarationPeriodId: argument.declarationPeriodId,
      );

      if (response.isSuccess) {
        ShowDialog.dismissDialog();
        _showDialogVerifySuccess();
      } else {
        ShowDialog.dismissDialog();
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
      ShowDialog.dismissDialog();
    }
  }

  void _showDialogCheckedSuccess() {
    ShowDialog.showDialogWithWidget(
      // isActiveBack: false,
      title: 'Chuyển ký thành công !',
      content:
          'Đã gửi hồ sơ tới hệ thống ký số, vui lòng đăng nhập mysign để tiến hành phê duyệt.',
      child: const CupertinoActivityIndicator(
        radius: 20,
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  void _showDialogVerifySuccess() {
    ShowDialog.showDialogConfirm2(
      title: 'Thành Công!',
      content: 'Gửi tờ khai lên cổng tiếp nhận của BHXH thành công.',
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
