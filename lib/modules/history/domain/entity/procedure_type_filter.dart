import '../../../../clean/core/domain/entity/entity.dart';

class ProcedureTypeFilter implements Entity {
  final String name;
  final String parentName;
  final String type;
  final String code;
  final String note;

  const ProcedureTypeFilter({
    required this.name,
    required this.parentName,
    required this.type,
    required this.code,
    required this.note,
  });
}
