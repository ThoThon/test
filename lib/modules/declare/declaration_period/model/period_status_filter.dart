import '../../../src.dart';

/// Bộ lọc trạng thái đợt
// Xử lý những gì liên quan đến bộ lọc
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
}
