import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/uuid_utils.dart';

class DeclarationFormDetailController extends BaseGetxController {
  DeclarationForm? declarationForm;

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

    final arg = Get.arguments;
    if (arg != null && arg is DeclarationFormDetailArgument) {
      if (arg.form != null) {
        declarationForm = arg.form;
        fullNameTextCtrl.text = declarationForm?.fullName ?? '';
        bhxhTextCtrl.text = declarationForm?.bhxhNumber ?? '';
        documentTypeTextCtrl.text = declarationForm?.documentType ?? '';
        documentNumberTextCtrl.text = declarationForm?.documentNumber ?? '';
        dateOfIssueCtrl.text =
            convertDateToStringSafe(declarationForm?.dateOfIssue, PATTERN_1) ??
                '';
        effectiveDateCtrl.text = convertDateToStringSafe(
                declarationForm?.effectiveDate, PATTERN_1) ??
            '';
        issuingAgencyTextCtrl.text = declarationForm?.issuingAgency ?? '';
        summaryTextCtrl.text = declarationForm?.summary ?? '';
        contentToBeAssessedTextCtrl.text =
            declarationForm?.contentToBeAssessed ?? '';
      } else {
        fullNameTextCtrl.text = arg.fullName ?? '';
        bhxhTextCtrl.text = arg.bhxhCode ?? '';
      }
    }
  }

  void submit() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back(
        result: DeclarationForm(
          // Khi sửa bảng kê ở local hoặc DB thì sẽ giữ id cũ
          id: declarationForm?.id ?? generateUuid(),
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
          isUpdate: declarationForm?.isUpdate ?? false,
        ),
      );
    }
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
