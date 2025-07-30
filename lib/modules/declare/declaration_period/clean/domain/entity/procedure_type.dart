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
  procedure613;

  static ProcedureType? fromInt(int? value) {
    return switch (value) {
      6001 => ProcedureType.procedure600,
      6071 => ProcedureType.procedure607,
      6081 => ProcedureType.procedure608,
      6101 => ProcedureType.procedure610,
      6121 => ProcedureType.procedure612,
      6131 => ProcedureType.procedure613,
      _ => null,
    };
  }

  int get toInt {
    return switch (this) {
      ProcedureType.procedure600 => 6001,
      ProcedureType.procedure607 => 6071,
      ProcedureType.procedure608 => 6081,
      ProcedureType.procedure610 => 6101,
      ProcedureType.procedure612 => 6121,
      ProcedureType.procedure613 => 6131,
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
    }
  }
}
