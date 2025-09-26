import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class RegisterHistoryListRequest implements Entity {
  final int pageIndex;
  final int pageSize;
  final int thang;
  final int nam;
  final String soHoSo;
  final String loaiGiaoDich;

  const RegisterHistoryListRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.thang,
    required this.nam,
    required this.soHoSo,
    required this.loaiGiaoDich,
  });
}
