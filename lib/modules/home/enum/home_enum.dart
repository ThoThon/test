import 'package:v_bhxh/generated/locales.g.dart';

import '../../../assets.dart';
import '../../../core/core.src.dart';

enum HomeEnum {
  unit_info,
  file_declaration,
  transaction_history,
  lookup_c12,
  guide;

  String get image {
    switch (this) {
      case unit_info:
        return Assets.ASSETS_ICONS_HOME_REGISTER_TRANSACTION_SVG;
      case file_declaration:
        return Assets.ASSETS_ICONS_HOME_FILE_DECLARATION_SVG;
      case transaction_history:
        return Assets.ASSETS_ICONS_HOME_TRANSACTION_HISTORY_SVG;
      case lookup_c12:
        return Assets.ASSETS_ICONS_HOME_LOOKUP_C12_SVG;
      case guide:
        return Assets.ASSETS_ICONS_HOME_IC_GUIDE_SVG;
    }
  }

  String get string {
    switch (this) {
      case unit_info:
        return LocaleKeys.home_unitInfo;
      case file_declaration:
        return LocaleKeys.home_declare;
      case transaction_history:
        return LocaleKeys.home_history;
      case lookup_c12:
        return LocaleKeys.home_lookupC12;
      case guide:
        return LocaleKeys.home_guide;
    }
  }

  String get path {
    switch (this) {
      case unit_info:
        return AppRoutes.infoUnit.path;
      case file_declaration:
        return "";
      case transaction_history:
        return AppRoutes.historyTransaction.path;
      case lookup_c12:
        return "";
      case guide:
        return "";
    }
  }
}
