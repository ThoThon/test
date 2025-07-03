enum ProcedureType {
  /// Thủ tục 600
  procedure600,

  /// Thủ tục 607
  procedure607;

  static ProcedureType fromInt(int? value) {
    switch (value) {
      case 6001:
        return ProcedureType.procedure600;
      case 6071:
        return ProcedureType.procedure607;
      default:
        return ProcedureType.procedure600;
    }
  }
}
