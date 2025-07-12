import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/uuid_utils.dart';

class DeclarationFormDetailController extends BaseGetxController {
  final argument = Get.arguments as DeclarationFormDetailArgument?;

  final formKey = GlobalKey<FormState>();

  final registeredKey = GlobalKey<FormRegistryWidgetState>();

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số BHXH
  final bhxhTextCtrl = TextEditingController();

  /// Tên loại văn bản *
  final documentTypeTextCtrl = TextEditingController();

  /// Số văn bản *
  final documentNumberTextCtrl = TextEditingController();

  /// Ngày ban hành *
  final dateOfIssueCtrl = TextEditingController();

  /// Ngày văn bản có hiệu lực *
  final effectiveDateCtrl = TextEditingController();

  /// Cơ quan ban hành *
  final issuingAgencyTextCtrl = TextEditingController();

  /// Trích yếu *
  final summaryTextCtrl = TextEditingController();

  /// Nội dung thẩm định *
  final contentToBeAssessedTextCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if (argument != null) {
      if (argument?.form != null) {
        fullNameTextCtrl.text = argument?.form?.fullName ?? '';
        bhxhTextCtrl.text = argument?.form?.bhxhNumber ?? '';
        documentTypeTextCtrl.text = argument?.form?.documentType ?? '';
        documentNumberTextCtrl.text = argument?.form?.documentNumber ?? '';
        dateOfIssueCtrl.text =
            convertDateToStringSafe(argument?.form?.dateOfIssue, PATTERN_1) ??
                '';
        effectiveDateCtrl.text =
            convertDateToStringSafe(argument?.form?.effectiveDate, PATTERN_1) ??
                '';
        issuingAgencyTextCtrl.text = argument?.form?.issuingAgency ?? '';
        summaryTextCtrl.text = argument?.form?.summary ?? '';
        contentToBeAssessedTextCtrl.text =
            argument?.form?.contentToBeAssessed ?? '';
      } else {
        fullNameTextCtrl.text = argument?.fullName ?? '';
        bhxhTextCtrl.text = argument?.bhxhCode ?? '';
      }
    }
  }

  void submit() {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      // Scroll to the first invalid field
      registeredKey.currentState?.firstInvalid?.scrollToIntoView();
      return;
    }

    Get.back(
      result: DeclarationForm(
        // Khi sửa bảng kê ở local hoặc DB thì sẽ giữ id cũ
        id: argument?.form?.id ?? generateUuid(),
        fullName: fullNameTextCtrl.text.trim(),
        bhxhNumber: bhxhTextCtrl.text.trim(),
        documentType: documentTypeTextCtrl.text.trim(),
        documentNumber: documentNumberTextCtrl.text.trim(),
        dateOfIssue: convertStringToDateSafe(dateOfIssueCtrl.text, PATTERN_1),
        effectiveDate:
            convertStringToDateSafe(effectiveDateCtrl.text, PATTERN_1),
        issuingAgency: issuingAgencyTextCtrl.text.trim(),
        summary: summaryTextCtrl.text.trim(),
        contentToBeAssessed: contentToBeAssessedTextCtrl.text.trim(),
        // Khi update bảng kê ở DB thì sẽ truyền isUpdate = true
        // Cần keep trạng thái isUpdate để tránh tạo mới
        isUpdate: argument?.form?.isUpdate ?? false,
      ),
    );
  }

  @override
  void onClose() {
    fullNameTextCtrl.dispose();
    dateOfIssueCtrl.dispose();
    effectiveDateCtrl.dispose();
    bhxhTextCtrl.dispose();
    documentTypeTextCtrl.dispose();
    documentNumberTextCtrl.dispose();
    issuingAgencyTextCtrl.dispose();
    summaryTextCtrl.dispose();
    contentToBeAssessedTextCtrl.dispose();
    super.onClose();
  }
}
