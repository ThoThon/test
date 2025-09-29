import '../../../../clean/core/domain/entity/entity.dart';

class DeclarationHistoryListRequest implements Entity {
  final String? companyId;
  final int pageIndex;
  final int pageSize;
  final String? month;
  final String? year;
  final String? procedureCode;
  final String? dossierNumber;

  const DeclarationHistoryListRequest({
    this.companyId,
    required this.pageIndex,
    required this.pageSize,
    this.month,
    this.year,
    this.procedureCode,
    this.dossierNumber,
  });
}
