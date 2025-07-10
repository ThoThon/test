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
      default:
        return ProcedureType.procedure600;
    }
  }

  String get declareInfoTitle {
    switch (this) {
      case ProcedureType.procedure600:
        return "Kê khai thông tin 600";
      case ProcedureType.procedure607:
        return "Kê khai thông tin 607";
      case ProcedureType.procedure608:
        return "Kê khai thông tin 608";
      case ProcedureType.procedure610:
        return "Kê khai thông tin 610";
      case ProcedureType.procedure612:
        return "Kê khai thông tin 612";
      case ProcedureType.procedure613:
        return "Kê khai thông tin 613";
    }
  }
}
