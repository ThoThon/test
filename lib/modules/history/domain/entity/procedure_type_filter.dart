import '../../../../clean/core/domain/entity/entity.dart';

class ProcedureTypeFilter implements Entity {
  final String ten;
  final String tenCha;
  final String loai;
  final String ma;
  final String ghiChu;

  ProcedureTypeFilter({
    required this.ten,
    required this.tenCha,
    required this.loai,
    required this.ma,
    required this.ghiChu,
  });
}
