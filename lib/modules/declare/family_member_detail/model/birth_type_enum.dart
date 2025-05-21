import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';

enum BirthTypeEnum {
  /// Năm - yyyy
  year,

  /// Tháng/năm - MM/yyyy
  monthYear,

  /// Đầy đủ - dd/MM/yyyy
  full;

  String get title {
    switch (this) {
      case year:
        return LocaleKeys.familyMember_birthTypeYear.tr;
      case monthYear:
        return LocaleKeys.familyMember_birthTypeMonthYear.tr;
      case full:
        return LocaleKeys.familyMember_birthTypeFull.tr;
    }
  }

  String get pattern {
    switch (this) {
      case year:
        return PATTERN_13;
      case monthYear:
        return PATTERN_12;
      case full:
        return PATTERN_1;
    }
  }
}
