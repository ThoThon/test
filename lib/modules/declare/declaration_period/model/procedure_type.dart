enum ProcedureType {
  procedure600,
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
