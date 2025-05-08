import 'package:v_bhxh/generated/locales.g.dart';

import '../../../assets.dart';
import '../../../core/core.src.dart';

enum HomeEnum {
  register_transaction,
  // file_declaration,
  transaction_history;
  // lookup_c12;

  String get image {
    switch (this) {
      case register_transaction:
        return Assets.ASSETS_ICONS_HOME_REGISTER_TRANSACTION_SVG;
      // case file_declaration:
      //   return Assets.ASSETS_ICONS_HOME_FILE_DECLARATION_SVG;
      case transaction_history:
        return Assets.ASSETS_ICONS_HOME_TRANSACTION_HISTORY_SVG;
      // case lookup_c12:
      //   return Assets.ASSETS_ICONS_HOME_LOOKUP_C12_SVG;
    }
  }

  String get string {
    switch (this) {
      case register_transaction:
        return LocaleKeys.home_registerInsurance;
      // case file_declaration:
      // return LocaleKeys.home_declarationForm;
      case transaction_history:
        return LocaleKeys.home_transactionHistory;
      // case lookup_c12:
      // return LocaleKeys.home_lookupC12;
    }
  }

  String get path {
    switch (this) {
      case register_transaction:
        return AppRoutesIcare.createTransaction.path;
      // case file_declaration:
      //   return "";
      case transaction_history:
        return AppRoutesIcare.historyTransaction.path;
      // case lookup_c12:
      //   return "";
    }
  }
}
