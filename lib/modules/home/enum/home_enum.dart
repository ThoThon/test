import 'package:v_bhxh/generated/locales.g.dart';

import '../../../assets.dart';
import '../../../core/core.src.dart';

enum HomeEnum {
  unit_info,
  declare,
  history,
  lookup_c12,
  guide;

  String get image {
    switch (this) {
      case unit_info:
        return Assets.ASSETS_ICONS_HOME_UNIT_INFO_SVG;
      case declare:
        return Assets.ASSETS_ICONS_HOME_DECLARATION_SVG;
      case history:
        return Assets.ASSETS_ICONS_HOME_HISTORY_SVG;
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
      case declare:
        return LocaleKeys.home_declare;
      case history:
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
      case declare:
        return AppRoutes.procedureList.path;
      case history:
        return AppRoutes.history.path;
      case lookup_c12:
        return AppRoutes.lookupC12.path;
      case guide:
        return "";
    }
  }
}
