import '../../../src.dart';

/// Trạng thái đợt
// Xử lý trạng thái từ bên BE trả về
enum PeriodStatus {
  /// 0: Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã gửi
  sent;

  static PeriodStatus fromInt(int? value) {
    switch (value) {
      case 0:
        return PeriodStatus.notYet;
      case 1:
        return PeriodStatus.draft;
      case 2:
        return PeriodStatus.sent;
      default:
        return PeriodStatus.notYet;
    }
  }

  Color get color {
    switch (this) {
      case PeriodStatus.notYet:
        return Colors.black;
      case PeriodStatus.draft:
        return const Color(0xFFFE9705);
      case PeriodStatus.sent:
        return const Color(0xFF409C37);
    }
  }

  Color get cardColor {
    switch (this) {
      case PeriodStatus.notYet:
        return const Color(0xFFEDEDED);
      case PeriodStatus.draft:
        return const Color(0xFFFFF1DF);
      case PeriodStatus.sent:
        return const Color(0xFFE9FFE6);
    }
  }

  String get title {
    switch (this) {
      case PeriodStatus.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case PeriodStatus.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case PeriodStatus.sent:
        return LocaleKeys.declarationPeriod_statusSent.tr;
    }
  }
}
