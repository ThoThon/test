class DeclarationForm {
  /// ID bảng kê - Gen với uuid
  final String id;

  /// Họ và tên *
  final String fullName;

  /// Mã số bảo hiểm xã hội
  final String bhxhNumber;

  /// Tên loại văn bản *
  final String documentType;

  /// Số văn bản *
  final String documentNumber;

  /// Ngày ban hành*
  final DateTime dateOfIssue;

  /// Ngày văn bản có hiệu lực *
  final DateTime effectiveDate;

  /// Cơ quan ban hành *
  final String issuingAgency;

  /// Trích yếu *
  final String summary;

  /// Nội dung thẩm định *
  final String contentToBeAssessed;

  const DeclarationForm({
    required this.id,
    required this.fullName,
    required this.bhxhNumber,
    required this.documentType,
    required this.documentNumber,
    required this.dateOfIssue,
    required this.effectiveDate,
    required this.issuingAgency,
    required this.summary,
    required this.contentToBeAssessed,
  });
}
