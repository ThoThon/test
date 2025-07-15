import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/d01_detail_response.dart';

class DeclarationForm {
  /// ID bảng kê - Gen với uuid
  final String? id;

  /// Họ và tên *
  final String fullName;

  /// Mã số bảo hiểm xã hội
  final String bhxhNumber;

  /// Tên loại văn bản *
  final String documentType;

  /// Số văn bản *
  final String documentNumber;

  /// Ngày ban hành*
  final DateTime? dateOfIssue;

  /// Ngày văn bản có hiệu lực *
  final DateTime? effectiveDate;

  /// Cơ quan ban hành *
  final String issuingAgency;

  /// Trích yếu *
  final String summary;

  /// Nội dung thẩm định *
  final String contentToBeAssessed;

  final bool isUpdate;

  const DeclarationForm({
    this.id,
    required this.fullName,
    required this.bhxhNumber,
    required this.documentType,
    required this.documentNumber,
    this.dateOfIssue,
    this.effectiveDate,
    required this.issuingAgency,
    required this.summary,
    required this.contentToBeAssessed,
    // Mặc định isUpdate là false khi tạo mới
    this.isUpdate = false,
  });

  factory DeclarationForm.fromResponse(D01DetailResponse detail) {
    return DeclarationForm(
      id: detail.id,
      fullName: detail.hoTen ?? '',
      bhxhNumber: detail.maSoBhxh ?? '',
      documentType: detail.tenLoaiVanBan ?? '',
      documentNumber: detail.soVanBan ?? '',
      dateOfIssue: detail.ngayBanHanh,
      effectiveDate: detail.ngayHieuLuc,
      issuingAgency: detail.coQuanBanHanh ?? '',
      summary: detail.trichYeu ?? '',
      contentToBeAssessed: detail.noiDungThamDinh ?? '',
      // Đọc từ response => đã có dữ liệu, isUpdate sẽ là true để cập nhật ở BE
      isUpdate: true,
    );
  }
}
