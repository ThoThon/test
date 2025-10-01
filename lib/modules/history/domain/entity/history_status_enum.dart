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
        return const Color(0xFFFE9705);
      case HistoryStatusEnum.success:
        return const Color(0xFF409C37);
      case HistoryStatusEnum.fail:
        return AppColors.primaryColor;
      default:
        return const Color(0xFFFE9705);
    }
  }

  Color? get cardStatusColor {
    switch (this) {
      case HistoryStatusEnum.processing:
        return const Color(0xFFFFF1DF);
      case HistoryStatusEnum.success:
        return const Color(0xFFE9FFE6);
      case HistoryStatusEnum.fail:
        return const Color(0xFFFEEBF0);
      default:
        return const Color(0xFFFFF1DF);
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
