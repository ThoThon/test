import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_form_detail/model/model_src.dart';

class DeclarationFormDetailController extends BaseGetxController {
  final DeclarationFormDetailArgument argument = Get.arguments;

  final formKey = GlobalKey<FormState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH
  final bhxhTextCtrl = TextEditingController();

  /// Tên loại văn bản *
  final documentTypeTextCtrl = TextEditingController();

  /// Số văn bản *
  final documentNumberTextCtrl = TextEditingController();

  /// Ngày ban hành
  final dateOfIssue = Rxn<DateTime>();

  final effectiveDate = Rxn<DateTime>();

  /// Cơ quan ban hành *
  final issuingAgencyTextCtrl = TextEditingController();

  /// Trích yếu *
  final summaryTextCtrl = TextEditingController();

  /// Nội dung thẩm định *
  final contentToBeAssessedTextCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if (argument.action.isCreate) {
      fullNameTextCtrl.text = argument.fullName ?? '';
      bhxhTextCtrl.text = argument.bhxhCode ?? '';
    }
  }

  void submit() {
    if (formKey.currentState?.validate() ?? false) {
      //
    }
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    documentTypeTextCtrl.dispose();
    documentNumberTextCtrl.dispose();
    issuingAgencyTextCtrl.dispose();
    summaryTextCtrl.dispose();
    contentToBeAssessedTextCtrl.dispose();
    super.onClose();
  }
}
