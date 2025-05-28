import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/shares/utils/uuid_utils.dart';

class DeclarationFormDetailController extends BaseGetxController {
  final argument = Get.arguments as DeclarationForm?;

  final formKey = GlobalKey<FormState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH
  final bhxhTextCtrl = TextEditingController();

  /// Tên loại văn bản *
  final documentTypeTextCtrl = TextEditingController();

  /// Số văn bản *
  final documentNumberTextCtrl = TextEditingController();

  /// Ngày ban hành *
  final dateOfIssue = Rxn<DateTime>();

  /// Ngày văn bản có hiệu lực *
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

    final declarationForm = argument;
    if (declarationForm != null) {
      fullNameTextCtrl.text = declarationForm.fullName;
      bhxhTextCtrl.text = declarationForm.bhxhNumber;
      documentTypeTextCtrl.text = declarationForm.documentType;
      documentNumberTextCtrl.text = declarationForm.documentNumber;
      dateOfIssue.value = declarationForm.dateOfIssue;
      effectiveDate.value = declarationForm.effectiveDate;
      issuingAgencyTextCtrl.text = declarationForm.issuingAgency;
      summaryTextCtrl.text = declarationForm.summary;
      contentToBeAssessedTextCtrl.text = declarationForm.contentToBeAssessed;
    }
  }

  void submit() {
    final doi = dateOfIssue.value;
    if (doi == null) {
      showSnackBar("Ngày ban hành không được để trống");
      return;
    }

    final ed = effectiveDate.value;
    if (ed == null) {
      showSnackBar("Ngày hiệu lực không được để trống");
      return;
    }

    if (formKey.currentState?.validate() ?? false) {
      Get.back(
        result: DeclarationForm(
          id: generateUuid(),
          fullName: fullNameTextCtrl.text.trim(),
          bhxhNumber: bhxhTextCtrl.text.trim(),
          documentType: documentTypeTextCtrl.text.trim(),
          documentNumber: documentNumberTextCtrl.text.trim(),
          dateOfIssue: doi,
          effectiveDate: ed,
          issuingAgency: issuingAgencyTextCtrl.text.trim(),
          summary: summaryTextCtrl.text.trim(),
          contentToBeAssessed: contentToBeAssessedTextCtrl.text.trim(),
        ),
      );
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
