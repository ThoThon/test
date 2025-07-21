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
        return 'Thứ hai';
      case WeeklyDayOffEnum.tuesday:
        return 'Thứ ba';
      case WeeklyDayOffEnum.wednesday:
        return 'Thứ tư';
      case WeeklyDayOffEnum.thursday:
        return 'Thứ năm';
      case WeeklyDayOffEnum.friday:
        return 'Thứ sáu';
      case WeeklyDayOffEnum.saturday:
        return 'Thứ bảy';
      case WeeklyDayOffEnum.sunday:
        return 'Chủ nhật';
    }
  }
}
