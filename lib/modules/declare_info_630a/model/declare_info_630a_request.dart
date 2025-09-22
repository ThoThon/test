import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

class DeclareInfo630aRequest {
  final String? id;
  final String? kyKeKhaiId;
  final String phatSinhDieuChinh;
  final String hoTen;
  final String maSoBhxh;
  final String? soCmnd;
  final String? maNhanVien;
  final String maNhomHuong;
  final String? soSeriCT;
  final DateTime tuNgay;
  final DateTime denNgay;
  final int tongSoNgay;
  final DateTime tuNgayDonVi;
  final String? ngayNghiTuan;
  final String? tuyenBenhVien;
  final DateTime? ngaySinhCon;
  final String? theBhytCuaCon;
  final int? soCon;
  final String? maBenhDaiNgay;
  final String? tenBenh;
  final String? dieuKienLamViec;
  final bool? dangKyNghiDuongThai;
  final String? dotBoSung;
  final String? maHoSo;
  final String? hinhThucNhan;
  final String? soTaiKhoan;
  final String? tenChuTaiKhoan;
  final Bank? maNganHang;
  final String? ghiChu;
  final String? dotDaGiaiQuyet;
  final DateTime? tuNgayDuyetTruoc;
  final String? lyDoDieuChinh;

  DeclareInfo630aRequest({
    this.id,
    this.kyKeKhaiId,
    required this.phatSinhDieuChinh,
    required this.hoTen,
    required this.maSoBhxh,
    this.soCmnd,
    this.maNhanVien,
    required this.maNhomHuong,
    this.soSeriCT,
    required this.tuNgay,
    required this.denNgay,
    required this.tongSoNgay,
    required this.tuNgayDonVi,
    this.ngayNghiTuan,
    this.tuyenBenhVien,
    this.ngaySinhCon,
    this.theBhytCuaCon,
    this.soCon,
    this.maBenhDaiNgay,
    this.tenBenh,
    this.dieuKienLamViec,
    this.dangKyNghiDuongThai,
    this.dotBoSung,
    this.maHoSo,
    this.hinhThucNhan,
    this.soTaiKhoan,
    this.tenChuTaiKhoan,
    this.maNganHang,
    this.ghiChu,
    this.dotDaGiaiQuyet,
    this.tuNgayDuyetTruoc,
    this.lyDoDieuChinh,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'kyKeKhaiId': kyKeKhaiId,
        'phatSinh_DieuChinh': phatSinhDieuChinh,
        'hoTen': hoTen,
        'maSoBhxh': maSoBhxh,
        'soCmnd': soCmnd,
        'maNhanVien': maNhanVien,
        'maNhomHuong': maNhomHuong,
        'soSeriCT': soSeriCT,
        'tuNgay': tuNgay.toIso8601String(),
        'denNgay': denNgay.toIso8601String(),
        'tongSoNgay': tongSoNgay,
        'tuNgayDonVi': tuNgayDonVi.toIso8601String(),
        'ngayNghiTuan': ngayNghiTuan,
        'tuyenBenhVien': tuyenBenhVien,
        'ngaySinhCon': ngaySinhCon?.toIso8601String(),
        'theBhytCuaCon': theBhytCuaCon,
        'soCon': soCon,
        'maBenhDaiNgay': maBenhDaiNgay,
        'tenBenh': tenBenh,
        'dieuKienLamViec': dieuKienLamViec,
        'dangKyNghiDuongThai': dangKyNghiDuongThai,
        'dotBoSung': dotBoSung,
        'maHoSo': maHoSo,
        'hinhThucNhan': hinhThucNhan,
        'soTaiKhoan': soTaiKhoan,
        'tenChuTaiKhoan': tenChuTaiKhoan,
        'maNganHang': maNganHang?.code ?? '',
        'ghiChu': ghiChu,
        'dotDaGiaiQuyet': dotDaGiaiQuyet,
        'tuNgayDuyetTruoc': tuNgayDuyetTruoc?.toIso8601String(),
        'lyDoDieuChinh': lyDoDieuChinh,
      };
}
