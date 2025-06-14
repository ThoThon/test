import 'package:v_bhxh/modules/src.dart';

enum HistoryRegisterTypeFilterEnum {
  all,
  register_transaction,
  register_change,
  cancel_transaction;

  String get type {
    switch (this) {
      case HistoryRegisterTypeFilterEnum.all:
        return '';
      case HistoryRegisterTypeFilterEnum.register_transaction:
        return 'D101';
      case HistoryRegisterTypeFilterEnum.register_change:
        return 'D102';
      case HistoryRegisterTypeFilterEnum.cancel_transaction:
        return 'D103';
    }
  }

  String get title {
    switch (this) {
      case HistoryRegisterTypeFilterEnum.all:
        return LocaleKeys.history_all.tr;
      case HistoryRegisterTypeFilterEnum.register_transaction:
        return LocaleKeys.history_registerTransaction.tr;
      case HistoryRegisterTypeFilterEnum.register_change:
        return LocaleKeys.history_registerChanged.tr;
      case HistoryRegisterTypeFilterEnum.cancel_transaction:
        return LocaleKeys.history_cancelTransaction.tr;
    }
  }
}
