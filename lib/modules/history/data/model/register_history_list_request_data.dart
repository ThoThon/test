import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class RegisterHistoryListRequestData implements Entity {
  final int? pageIndex;
  final int? pageSize;
  final int? thang;
  final int? nam;
  final String? soHoSo;
  final String? loaiGiaoDich;

  const RegisterHistoryListRequestData({
    this.pageIndex,
    this.pageSize,
    this.thang,
    this.nam,
    this.soHoSo,
    this.loaiGiaoDich,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'thang': thang,
      'nam': nam,
      'soHoSo': soHoSo,
      'loaiGiaoDich': loaiGiaoDich,
    };
  }
}
