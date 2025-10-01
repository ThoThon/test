import 'package:v_bhxh/modules/src.dart';

enum HistoryTabEnum {
  // Hồ sơ kê khai
  file_declare,
  // Đăng ký giao dịch
  register_transaction;

  String get title {
    switch (this) {
      case HistoryTabEnum.file_declare:
        return LocaleKeys.history_declaringForm.tr;
      case HistoryTabEnum.register_transaction:
        return LocaleKeys.history_transactionRegistered.tr;
    }
  }
}
