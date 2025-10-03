import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class RegisterHistoryListRequest implements Entity {
  final int pageIndex;
  final int pageSize;
  final int month;
  final int year;
  final String dossierNumber;
  final String transactionType;

  const RegisterHistoryListRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.month,
    required this.year,
    required this.dossierNumber,
    required this.transactionType,
  });
}
