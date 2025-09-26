import '../../../../clean/core/domain/entity/entity.dart';

class DeclarationHistoryListRequest implements Entity {
  final String? companyId;
  final int pageIndex;
  final int pageSize;
  final String? thang;
  final String? nam;
  final String? maThuTuc;
  final String? soHoSo;

  DeclarationHistoryListRequest({
    this.companyId,
    required this.pageIndex,
    required this.pageSize,
    this.thang,
    this.nam,
    this.maThuTuc,
    this.soHoSo,
  });
}
