import 'dart:ui';

import 'package:v_bhxh/generated/locales.g.dart';

import '../../../core/theme/colors.dart';

abstract class HistoryStatusEnum {
  /// Đang chờ xử lý
  static const String processing = '0';

  ///Thành công
  static const String success = '1';

  ///Thất bại
  static const String fail = '2';
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
        return LocaleKeys.historyRegister_socialAgencyInProcess;
      case HistoryStatusEnum.success:
        return LocaleKeys.historyRegister_success;
      case HistoryStatusEnum.fail:
        return LocaleKeys.historyRegister_fail;
      default:
        return LocaleKeys.historyRegister_socialAgencyInProcess;
    }
  }
}
