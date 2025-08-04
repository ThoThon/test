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
  procedure630a;

  static ProcedureType? fromInt(int? value) {
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
      default:
        return null;
    }
  }

  int get toInt {
    return switch (this) {
      ProcedureType.procedure600 => 6001,
      ProcedureType.procedure607 => 6071,
      ProcedureType.procedure608 => 6081,
      ProcedureType.procedure610 => 6101,
      ProcedureType.procedure612 => 6121,
      ProcedureType.procedure613 => 6131,
      ProcedureType.procedure630a => 1662,
    };
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
    }
  }
}
