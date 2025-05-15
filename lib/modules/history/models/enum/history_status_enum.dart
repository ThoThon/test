import 'package:v_bhxh/modules/src.dart';

abstract class HistoryStatusEnum {
  /// Đang chờ xử lý
  static const String processing = 'Đang xử lý';

  ///Thành công
  static const String success = 'Thành công';

  ///Thất bại
  static const String fail = 'Thất bại';
}

extension HistoryStatusEnumExt on String? {
  Color? get historyStatusColor {
    switch (this) {
      case HistoryStatusEnum.processing:
        return AppColors.statusNoti;
      case HistoryStatusEnum.success:
        return AppColors.statusGreen;
      case HistoryStatusEnum.fail:
        return AppColors.statusRed;
      default:
        return AppColors.statusNoti;
    }
  }

  String get titleStatus {
    switch (this) {
      case HistoryStatusEnum.processing:
        return LocaleKeys.history_socialAgencyInProcess.tr;
      case HistoryStatusEnum.success:
        return LocaleKeys.history_success.tr;
      case HistoryStatusEnum.fail:
        return LocaleKeys.history_fail.tr;
      default:
        return LocaleKeys.history_socialAgencyInProcess.tr;
    }
  }
}
