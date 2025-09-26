import '../../../../clean/core/domain/entity/entity.dart';

class RegisterHistoryItem implements Entity {
  String messId;
  String toKhai;
  String thoiGianGui;
  String? kqBuoc1;
  String? kqBuoc2;
  String? kqBuoc3;
  String trangThaiTK;
  String? soHoSo;
  String? tiepNhan;
  int nam;
  int thang;
  bool? trangThaiBuoc1;
  bool? trangThaiBuoc2;
  bool? trangThaiBuoc3;

  RegisterHistoryItem({
    required this.messId,
    required this.toKhai,
    required this.thoiGianGui,
    this.kqBuoc1,
    this.kqBuoc2,
    this.kqBuoc3,
    required this.trangThaiTK,
    this.soHoSo,
    this.tiepNhan,
    required this.nam,
    required this.thang,
    this.trangThaiBuoc1,
    this.trangThaiBuoc2,
    this.trangThaiBuoc3,
  });
}
