import 'package:v_bhxh/modules/src.dart';

/// Loại thủ tục
enum ProcedureType {
  /// Thủ tục 600
  procedure600,

  /// Thủ tục 607
  procedure607,

  /// Thủ tục 608
  procedure608,

  /// Thủ tục 610
  procedure610,

  /// Thủ tục 612
  procedure612,

  /// Thủ tục 613
  procedure613,

  /// Thủ tục 630a
  procedure630a,

  /// Thủ tục 630b
  procedure630b;

  static ProcedureType fromInt(int? value) {
    switch (value) {
      case 6001:
        return ProcedureType.procedure600;
      case 6071:
        return ProcedureType.procedure607;
      case 6081:
        return ProcedureType.procedure608;
      case 6101:
        return ProcedureType.procedure610;
      case 6121:
        return ProcedureType.procedure612;
      case 6131:
        return ProcedureType.procedure613;
      case 1662:
        return ProcedureType.procedure630a;
      case 1663:
        return ProcedureType.procedure630b;
      default:
        return ProcedureType.procedure600;
    }
  }

  String get declareInfoTitle {
    switch (this) {
      case ProcedureType.procedure600:
        return LocaleKeys.declareInfo_title600.tr;
      case ProcedureType.procedure607:
        return LocaleKeys.declareInfo_title607.tr;
      case ProcedureType.procedure608:
        return LocaleKeys.declareInfo_title608.tr;
      case ProcedureType.procedure610:
        return LocaleKeys.declareInfo_title610.tr;
      case ProcedureType.procedure612:
        return LocaleKeys.declareInfo_title612.tr;
      case ProcedureType.procedure613:
        return LocaleKeys.declareInfo_title613.tr;
      case ProcedureType.procedure630a:
        return LocaleKeys.declareInfo_title630a.tr;
      case ProcedureType.procedure630b:
        return LocaleKeys.declareInfo_title630b.tr;
    }
  }
}
