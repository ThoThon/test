import '../../../src.dart';

/// Bộ lọc trạng thái đợt
enum PeriodStatusFilter {
  /// Tất cả
  all,

  /// 0: Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã gửi
  sent;

  String get title {
    switch (this) {
      case PeriodStatusFilter.all:
        return LocaleKeys.declarationPeriod_all.tr;
      case PeriodStatusFilter.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case PeriodStatusFilter.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case PeriodStatusFilter.sent:
        return LocaleKeys.declarationPeriod_statusSent.tr;
    }
  }

  int? get statusNumber {
    switch (this) {
      case PeriodStatusFilter.all:
        return null;
      case PeriodStatusFilter.notYet:
        return 0;
      case PeriodStatusFilter.draft:
        return 1;
      case PeriodStatusFilter.sent:
        return 2;
    }
  }

  static PeriodStatusFilter fromInt(int? value) {
    switch (value) {
      case 0:
        return PeriodStatusFilter.notYet;
      case 1:
        return PeriodStatusFilter.draft;
      case 2:
        return PeriodStatusFilter.sent;
      default:
        return PeriodStatusFilter.notYet;
    }
  }

  Color get color {
    switch (this) {
      case PeriodStatusFilter.all:
        return Colors.transparent;
      case PeriodStatusFilter.notYet:
        return Colors.black;
      case PeriodStatusFilter.draft:
        return const Color(0xFFFE9705);
      case PeriodStatusFilter.sent:
        return const Color(0xFF409C37);
    }
  }

  Color get cardColor {
    switch (this) {
      case PeriodStatusFilter.all:
        return Colors.transparent;
      case PeriodStatusFilter.notYet:
        return const Color(0xFFEDEDED);
      case PeriodStatusFilter.draft:
        return const Color(0xFFFFF1DF);
      case PeriodStatusFilter.sent:
        return const Color(0xFFE9FFE6);
    }
  }
}
