import '../../../src.dart';

enum WeeklyDayOffEnum {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  String get title {
    switch (this) {
      case WeeklyDayOffEnum.monday:
        return LocaleKeys.weeklyDayOff_monday.tr;
      case WeeklyDayOffEnum.tuesday:
        return LocaleKeys.weeklyDayOff_tuesday.tr;
      case WeeklyDayOffEnum.wednesday:
        return LocaleKeys.weeklyDayOff_wednesday.tr;
      case WeeklyDayOffEnum.thursday:
        return LocaleKeys.weeklyDayOff_thursday.tr;
      case WeeklyDayOffEnum.friday:
        return LocaleKeys.weeklyDayOff_friday.tr;
      case WeeklyDayOffEnum.saturday:
        return LocaleKeys.weeklyDayOff_saturday.tr;
      case WeeklyDayOffEnum.sunday:
        return LocaleKeys.weeklyDayOff_sunday.tr;
    }
  }

  String get value {
    switch (this) {
      case WeeklyDayOffEnum.monday:
        return 't2';
      case WeeklyDayOffEnum.tuesday:
        return 't3';
      case WeeklyDayOffEnum.wednesday:
        return 't4';
      case WeeklyDayOffEnum.thursday:
        return 't5';
      case WeeklyDayOffEnum.friday:
        return 't6';
      case WeeklyDayOffEnum.saturday:
        return 't7';
      case WeeklyDayOffEnum.sunday:
        return 'cn';
    }
  }

  static WeeklyDayOffEnum? parse(String? value) {
    switch (value) {
      case 't2':
        return WeeklyDayOffEnum.monday;
      case 't3':
        return WeeklyDayOffEnum.tuesday;
      case 't4':
        return WeeklyDayOffEnum.wednesday;
      case 't5':
        return WeeklyDayOffEnum.thursday;
      case 't6':
        return WeeklyDayOffEnum.friday;
      case 't7':
        return WeeklyDayOffEnum.saturday;
      case 'cn':
        return WeeklyDayOffEnum.sunday;
      default:
        return null;
    }
  }
}
