import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';

enum BirthTypeEnum {
  /// 2 - Năm - yyyy
  year,

  /// 1 - Tháng/năm - MM/yyyy
  monthYear,

  /// 0 - Đầy đủ - dd/MM/yyyy
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

  int get rawValue {
    switch (this) {
      case year:
        return 2;
      case monthYear:
        return 1;
      case full:
        return 0;
    }
  }
}
