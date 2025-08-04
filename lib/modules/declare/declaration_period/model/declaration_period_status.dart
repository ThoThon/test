import '../../../src.dart';

/// Trạng thái hồ sơ
enum DeclarationPeriodStatus {
  /// 0:Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã gửi
  sent;

  // Sửa lại logic nghiệp vụ
  // Không dùng 'trangThai' nữa
  // Nhóm 'trangThaiHoSo' trả về từ BE
  // 0 -> 0 : Chưa kê khai
  // 1,2 -> 1 : Lưu nháp
  // 3,4,5,6 -> 2 : Đã gửi

  static DeclarationPeriodStatus fromInt(int? value) {
    switch (value) {
      case 0:
        return DeclarationPeriodStatus.notYet;
      case 1:
      case 2:
        return DeclarationPeriodStatus.draft;
      case 3:
      case 4:
      case 5:
      case 6:
        return DeclarationPeriodStatus.sent;
      default:
        return DeclarationPeriodStatus.notYet;
    }
  }

  Color get color {
    switch (this) {
      case DeclarationPeriodStatus.notYet:
        return Colors.black;
      case DeclarationPeriodStatus.draft:
        return const Color(0xFFFE9705);
      case DeclarationPeriodStatus.sent:
        return Colors.blue;
    }
  }

  Color get cardColor {
    switch (this) {
      case DeclarationPeriodStatus.notYet:
        return const Color(0xFFEDEDED);
      case DeclarationPeriodStatus.draft:
        return const Color(0xFFFFF1DF);
      case DeclarationPeriodStatus.sent:
        return const Color(0xFFE3F0FF);
    }
  }

  String get title {
    switch (this) {
      case DeclarationPeriodStatus.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case DeclarationPeriodStatus.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case DeclarationPeriodStatus.sent:
        return LocaleKeys.declarationPeriod_statusSent.tr;
    }
  }
}
