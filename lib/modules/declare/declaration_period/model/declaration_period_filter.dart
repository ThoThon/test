import '../../../src.dart';

/// Bộ lọc trạng thái đợt
// Xử lý những gì liên quan đến bộ lọc
enum DeclarationPeriodFilter {
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
      case DeclarationPeriodFilter.all:
        return LocaleKeys.declarationPeriod_all.tr;
      case DeclarationPeriodFilter.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case DeclarationPeriodFilter.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case DeclarationPeriodFilter.sent:
        return LocaleKeys.declarationPeriod_statusSent.tr;
    }
  }

  int? get statusNumber {
    switch (this) {
      case DeclarationPeriodFilter.all:
        return null;
      case DeclarationPeriodFilter.notYet:
        return 0;
      case DeclarationPeriodFilter.draft:
        return 1;
      case DeclarationPeriodFilter.sent:
        return 2;
    }
  }
}
