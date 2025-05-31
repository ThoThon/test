import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/src.dart';
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
  // final dateOfIssue = Rxn<DateTime>();

  final dateOfIssueCtrl = TextEditingController();

  /// Ngày văn bản có hiệu lực *
  // final effectiveDate = Rxn<DateTime>();

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

    final declarationForm = argument;
    if (declarationForm != null) {
      fullNameTextCtrl.text = declarationForm.fullName;
      bhxhTextCtrl.text = declarationForm.bhxhNumber;
      documentTypeTextCtrl.text = declarationForm.documentType;
      documentNumberTextCtrl.text = declarationForm.documentNumber;
      dateOfIssueCtrl.text =
          convertDateToStringSafe(declarationForm.dateOfIssue, PATTERN_1) ?? '';
      effectiveDateCtrl.text =
          convertDateToStringSafe(declarationForm.effectiveDate, PATTERN_1) ??
              '';
      issuingAgencyTextCtrl.text = declarationForm.issuingAgency;
      summaryTextCtrl.text = declarationForm.summary;
      contentToBeAssessedTextCtrl.text = declarationForm.contentToBeAssessed;
    }
  }

  void submit() {
    final doi = dateOfIssueCtrl.text;
    if (doi.isEmpty) {
      showSnackBar("Ngày ban hành không được để trống");
      return;
    }

    final ed = effectiveDateCtrl.text;
    if (ed.isEmpty) {
      showSnackBar("Ngày hiệu lực không được để trống");
      return;
    }

    if (formKey.currentState?.validate() ?? false) {
      Get.back(
        result: DeclarationForm(
          // Khi sửa bảng kê ở local hoặc DB thì sẽ giữ id cũ
          id: argument?.id ?? generateUuid(),
          fullName: fullNameTextCtrl.text.trim(),
          bhxhNumber: bhxhTextCtrl.text.trim(),
          documentType: documentTypeTextCtrl.text.trim(),
          documentNumber: documentNumberTextCtrl.text.trim(),
          dateOfIssue: convertStringToDateSafe(doi, PATTERN_1),
          effectiveDate: convertStringToDateSafe(ed, PATTERN_1),
          issuingAgency: issuingAgencyTextCtrl.text.trim(),
          summary: summaryTextCtrl.text.trim(),
          contentToBeAssessed: contentToBeAssessedTextCtrl.text.trim(),
          // Khi update bảng kê ở DB thì sẽ truyền isUpdate = true
          // Cần keep trạng thái isUpdate để tránh tạo mới
          isUpdate: argument?.isUpdate ?? false,
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
