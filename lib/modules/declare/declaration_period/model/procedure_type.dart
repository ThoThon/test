/// Loại thủ tục
enum ProcedureType {
  /// Thủ tục 600
  procedure600,

  /// Dùng chung cho các thủ tục 607, 608, 610, 612, 613, do các thủ tục này có chung UI và nghiệp vụ
  procedure607;

  static ProcedureType fromInt(int? value) {
    switch (value) {
      case 6001:
        return ProcedureType.procedure600;
      case 6071:
      case 6081:
      case 6101:
      case 6121:
      case 6131:
        return ProcedureType.procedure607;
      default:
        return ProcedureType.procedure600;
    }
  }
}
