import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

class DeclareInfo630aResponse {
  final String id;
  final String kyKeKhaiId;
  final String phatSinhDieuChinh;
  final String hoTen;
  final String maSoBhxh;
  final String soCmnd;
  final String maNhanVien;
  final String maNhomHuong;
  final String soSeriCT;
  final DateTime tuNgay;
  final DateTime denNgay;
  final double tongSoNgay;
  final DateTime tuNgayDonVi;
  final DateTime denNgayDonVi;
  final String? ngayNghiTuan;
  final String tuyenBenhVien;
  final DateTime? ngaySinhCon;
  final String theBhytCuaCon;
  final int? soCon;
  final String maBenhDaiNgay;
  final String tenBenh;
  final String dieuKienLamViec;
  final bool dangKyNghiDuongThai;
  final String dotBoSung;
  final String maHoSo;
  final String hinhThucNhan;
  final String soTaiKhoan;
  final String tenChuTaiKhoan;
  final Bank? nganHang;
  final String ghiChu;
  final String dotDaGiaiQuyet;
  final DateTime? tuNgayDuyetTruoc;
  final String lyDoDieuChinh;

  DeclareInfo630aResponse({
    required this.id,
    required this.kyKeKhaiId,
    required this.phatSinhDieuChinh,
    required this.hoTen,
    required this.maSoBhxh,
    required this.soCmnd,
    required this.maNhanVien,
    required this.maNhomHuong,
    required this.soSeriCT,
    required this.tuNgay,
    required this.denNgay,
    required this.tongSoNgay,
    required this.tuNgayDonVi,
    required this.denNgayDonVi,
    this.ngayNghiTuan,
    required this.tuyenBenhVien,
    required this.ngaySinhCon,
    required this.theBhytCuaCon,
    required this.soCon,
    required this.maBenhDaiNgay,
    required this.tenBenh,
    required this.dieuKienLamViec,
    required this.dangKyNghiDuongThai,
    required this.dotBoSung,
    required this.maHoSo,
    required this.hinhThucNhan,
    required this.soTaiKhoan,
    required this.tenChuTaiKhoan,
    required this.nganHang,
    required this.ghiChu,
    required this.dotDaGiaiQuyet,
    required this.tuNgayDuyetTruoc,
    required this.lyDoDieuChinh,
  });

  factory DeclareInfo630aResponse.fromJson(Map<String, dynamic> json) {
    return DeclareInfo630aResponse(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      phatSinhDieuChinh: json['phatSinh_DieuChinh'] ?? '',
      hoTen: json['hoTen'] ?? '',
      maSoBhxh: json['maSoBhxh'] ?? '',
      soCmnd: json['soCmnd'] ?? '',
      maNhanVien: json['maNhanVien'] ?? '',
      maNhomHuong: json['maNhomHuong'] ?? '',
      soSeriCT: json['soSeriCT'] ?? '',
      tuNgay: DateTime.tryParse(json['tuNgay'] ?? '') ?? DateTime.now(),
      denNgay: DateTime.tryParse(json['denNgay'] ?? '') ?? DateTime.now(),
      tongSoNgay: json['tongSoNgay']?.toDouble() ?? 0,
      tuNgayDonVi:
          DateTime.tryParse(json['tuNgayDonVi'] ?? '') ?? DateTime.now(),
      denNgayDonVi:
          DateTime.tryParse(json['denNgayDonVi'] ?? '') ?? DateTime.now(),
      ngayNghiTuan: json['ngayNghiTuan'] ?? '',
      tuyenBenhVien: json['tuyenBenhVien'] ?? '',
      ngaySinhCon: json['ngaySinhCon'] != null
          ? DateTime.tryParse(json['ngaySinhCon'])
          : null,
      theBhytCuaCon: json['theBhytCuaCon'] ?? '',
      soCon: json['soCon'],
      maBenhDaiNgay: json['maBenhDaiNgay'] ?? '',
      tenBenh: json['tenBenh'] ?? '',
      dieuKienLamViec: json['dieuKienLamViec'] ?? '',
      dangKyNghiDuongThai: json['dangKyNghiDuongThai'] ?? false,
      dotBoSung: json['dotBoSung'] ?? '',
      maHoSo: json['maHoSo'] ?? '',
      hinhThucNhan: json['hinhThucNhan'] ?? '',
      soTaiKhoan: json['soTaiKhoan'] ?? '',
      tenChuTaiKhoan: json['tenChuTaiKhoan'] ?? '',
      nganHang:
          json['nganHang'] != null ? Bank.fromJson(json['nganHang']) : null,
      ghiChu: json['ghiChu'] ?? '',
      dotDaGiaiQuyet: json['dotDaGiaiQuyet'] ?? '',
      tuNgayDuyetTruoc: json['tuNgayDuyetTruoc'] != null
          ? DateTime.tryParse(json['tuNgayDuyetTruoc'])
          : null,
      lyDoDieuChinh: json['lyDoDieuChinh'] ?? '',
    );
  }
}
