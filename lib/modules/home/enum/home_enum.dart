import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/generated/locales.g.dart';

import '../../../assets.dart';
import '../../../core/core.src.dart';

enum HomeEnum {
  unit_info,
  declare,
  history,
  lookup_c12,
  register_service;

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
      case register_service:
        return Assets.ASSETS_ICONS_HOME_IC_REGISTER_SERVICE_SVG;
    }
  }

  String get string {
    switch (this) {
      case unit_info:
        return LocaleKeys.home_unitInfo;
      case declare:
        return LocaleKeys.home_procedureList;
      case history:
        return LocaleKeys.home_history;
      case lookup_c12:
        return LocaleKeys.home_lookupC12;
      case register_service:
        return LocaleKeys.home_registerService;
    }
  }

  String get path {
    switch (this) {
      case unit_info:
        return AppRoutes.infoUnit.path;
      case declare:
        return AppRoutesCl.procedureList.path;
      case history:
        return AppRoutes.history.path;
      case lookup_c12:
        return AppRoutes.lookupC12.path;
      case register_service:
        return AppRoutes.registerService.path;
    }
  }
}
