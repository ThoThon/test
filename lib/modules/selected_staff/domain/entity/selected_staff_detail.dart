import 'package:v_bhxh/clean/shared/entity/category.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

import '../../../src.dart';

class SelectedStaffDetail {
  final String? id;
  final String? hoTen;
  final String? maSoBHXH;
  final String? soCCCD;
  final int? gioiTinh;
  final int? chiCoNamSinh;
  final String? ngaySinh;
  final Category? danToc;
  final Category? quocTich;
  final String? chucVu;
  final bool dongTheoHeSo;
  final int? heSoLuongCoBan;
  final int? tienLuong;
  final int? phuCapChucVu;
  final int? phuCapThamNienVuotKhung;
  final int? phuCapThamNienNghe;
  final int? phuCapLuong;
  final int? phuCapBoSung;
  final Province? benhVienTinh;
  final Hospital? benhVien;
  final Province? khaiSinhTinh;
  final Ward? khaiSinhXa;
  final String? diaChiKhaiSinh;
  final Province? noiNhanTinh;
  final Ward? noiNhanXa;
  final String? diaChiNoiNhan;
  final String? dienThoaiLienHe;
  final String? hoTenChuHo;
  final String? chuHoSoCCCD;
  final Province? chuHoThuongTruTinh;
  final Ward? chuHoThuongTruXa;
  final String? diaChiThuongTruChuHo;
  final bool trungDiaChiKhaiSinh;
  final bool laChuHo;
  final String? tyLeDong;
  final List<StaffFamilyResponse> danhSachThanhViens;

  const SelectedStaffDetail({
    this.id,
    this.hoTen,
    this.maSoBHXH,
    this.soCCCD,
    this.gioiTinh,
    this.chiCoNamSinh,
    this.ngaySinh,
    this.danToc,
    this.quocTich,
    this.chucVu,
    required this.dongTheoHeSo,
    this.heSoLuongCoBan,
    this.tienLuong,
    this.phuCapChucVu,
    this.phuCapThamNienVuotKhung,
    this.phuCapThamNienNghe,
    this.phuCapLuong,
    this.phuCapBoSung,
    this.benhVienTinh,
    this.benhVien,
    this.khaiSinhTinh,
    this.khaiSinhXa,
    this.diaChiKhaiSinh,
    this.noiNhanTinh,
    this.noiNhanXa,
    this.diaChiNoiNhan,
    this.dienThoaiLienHe,
    this.hoTenChuHo,
    this.chuHoSoCCCD,
    this.chuHoThuongTruTinh,
    this.chuHoThuongTruXa,
    this.diaChiThuongTruChuHo,
    required this.trungDiaChiKhaiSinh,
    required this.laChuHo,
    this.tyLeDong,
    required this.danhSachThanhViens,
  });
}
