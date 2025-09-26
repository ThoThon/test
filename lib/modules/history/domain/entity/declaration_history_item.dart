import '../../../../clean/core/domain/entity/entity.dart';

class DeclarationHistoryItem implements Entity {
  String id;
  String maThuTuc;
  String thoiGianGui;
  String? soHoSo;
  String thang;
  String nam;
  String trangThai;
  String? maLoiBuoc1;
  String? ketQuaBuoc1;
  String? maLoiBuoc2;
  String? ketQuaBuoc2;
  String? maLoiBuoc3;
  String? ketQuaBuoc3;
  String? maLoiBuoc4;
  String? ketQuaBuoc4;

  DeclarationHistoryItem({
    required this.id,
    required this.maThuTuc,
    required this.thoiGianGui,
    this.soHoSo,
    required this.thang,
    required this.nam,
    required this.trangThai,
    this.maLoiBuoc1,
    this.ketQuaBuoc1,
    this.maLoiBuoc2,
    this.ketQuaBuoc2,
    this.maLoiBuoc3,
    this.ketQuaBuoc3,
    this.maLoiBuoc4,
    this.ketQuaBuoc4,
  });
}
