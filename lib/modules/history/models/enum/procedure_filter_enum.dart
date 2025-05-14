import '../../../src.dart';

enum ProcedureFilterEnum {
  all,
  procedure600,
  procedure600c,
  procedure600d,
  procedure600o;
}

extension ProcedureFilterExt on ProcedureFilterEnum {
  String get title {
    switch (this) {
      case ProcedureFilterEnum.all:
        return LocaleKeys.history_all;
      case ProcedureFilterEnum.procedure600:
        return LocaleKeys.history_procedure600;
      case ProcedureFilterEnum.procedure600c:
        return LocaleKeys.history_procedure600c;
      case ProcedureFilterEnum.procedure600d:
        return LocaleKeys.history_procedure600d;
      case ProcedureFilterEnum.procedure600o:
        return LocaleKeys.history_procedure600o;
      default:
        return LocaleKeys.history_all;
    }
  }

  String get procedureCode {
    switch (this) {
      case ProcedureFilterEnum.all:
        return "";
      case ProcedureFilterEnum.procedure600:
        return AppConst.procedure600;
      case ProcedureFilterEnum.procedure600c:
        return AppConst.procedure600c;
      case ProcedureFilterEnum.procedure600d:
        return AppConst.procedure600d;
      case ProcedureFilterEnum.procedure600o:
        return AppConst.procedure600o;
      default:
        return "";
    }
  }
}
